//
//  PlayPresenter.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 21/11/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import UIKit

protocol PlayPresenterInput {

    var router: PlayRouterInput? { get set }

    var output: PlayPresenterOutput? { get set }
    
    func viewDidLoad()
    
    func viewDidAppear()
    
    func pauseButtonTapped()
    
    func successButtonTapped()
    
    func failureButtonTapped()
    
    func exitTapped()

}

protocol PlayPresenterOutput: class {

    func setCurrentWord(word: String)
    
    func setCurrentTeam(name: String)
    
    func setTimeLeft(timeLeft: String)
    
    func setCurrentRound(number: Int)
    
    func setScore(_ score: Int)
    
    func setImages(images: [UIImage?], animated: Bool)
    
    func performSlide(images: [UIImage?])
    
    func showAlert(title: String, message: String, completion: @escaping () -> Void, destructive: (() -> Void)?)
    
}

protocol PlayRouterInput: class {
    
    func showRoundResult(configuration: AliasGameConfiguration, teamResult: TeamResult, completion: @escaping () -> Void)
    
    func showResult(title: String, emoji: String, text: String, buttonTitle: String, completion: @escaping () -> Void)
    
    func showTeamResult(configuration: AliasGameConfiguration, teamResult: TeamResult, completion: @escaping () -> Void)
    
    func exitFromPlayModule()
    
    func playModuleDidLoadWords()
    
    func playModuleDidNotLoadWords()
    
    func readyFromPlayModule(configuration: AliasGameConfiguration, nextTeam: Int)

}

class PlayPresenter: PlayPresenterInput {

    weak var router: PlayRouterInput?

    weak var output: PlayPresenterOutput?

    private var interactor: PlayInteractorInput


    init(interactor: PlayInteractorInput) {
        self.interactor = interactor
    }
    
    // MARK: - Элементы синхронизации
    
    let locker = NSLock()
    
    let queue = DispatchQueue.global(qos: .userInitiated)
    
    func viewDidAppear() {
        interactor.startTimer()
    }
    
    func viewDidLoad() {
        interactor.loadWords()
    }
    
    
    func exitTapped() {
        guard let output = output else {
            debugPrint("[PlayPresenter]: output is nil")
            return
        }
        interactor.stopTimer()
        output.showAlert(title: "Завершить игру", message: "Результаты игры будут потеряны", completion: {
            self.interactor.startTimer()
        }){
            if let router = self.router {
                router.exitFromPlayModule()
            } else {
                #if DEBUG
                debugPrint("[PlayPresenter]: router is nil")
                #endif
            }
        }
    }
    
    func pauseButtonTapped() {
        guard let output = output else {
            debugPrint("[PlayPresenter]: output is nil")
            return
        }
        interactor.stopTimer()
        let timeLeft = Double(interactor.timeLeft) / 10.0
        output.showAlert(title: "Пауза", message: "Осталось времени: \(timeLeft) c", completion: {
            self.interactor.startTimer()
        }, destructive: nil)
    }
    
    private var guessedWords: [AliasWord] = []
    
    private var notGuessedWords: [AliasWord] = []
    
    func successButtonTapped() {
        wordGuessed(true)
        nextWord()
    }
    
    func failureButtonTapped() {
        wordGuessed(false)
        nextWord()
    }
    
    private var timeLeftString: String {
        return "\(Double(interactor.timeLeft) / 10.0)"
    }
    
    private func updateUI(animated: Bool) {
        guard let output = output else {
            debugPrint("[PlayPresenter]: output is nil")
            return
        }
        let teamName = "\(interactor.configuration.mode.teamType) \(interactor.team + 1)"
        let roundNumber = interactor.round + 1
        
        output.setCurrentRound(number: roundNumber)
        output.setCurrentTeam(name: teamName)
        output.setTimeLeft(timeLeft: timeLeftString)
        output.setScore(0)
        guard interactor.words.count >= 3 else {
            assertionFailure("[PlayPresenter]: Недостаточно слов")
            return
        }
        output.setCurrentWord(word: interactor.words[currentWordIndex].word)
        output.setImages(images: [firstImage, secondImage, thirdImage], animated: animated)
    }
    
    var currentWordIndex = 0
    
    var defaultImage: UIImage? {
        return UIImage(color: getRandomColor())
    }
    
    var firstImage: UIImage? {
        return interactor.words[currentWordIndex].image ?? defaultImage
    }
    
    var secondImage: UIImage? {
        return currentWordIndex + 1 < interactor.words.count ? interactor.words[currentWordIndex + 1].image ?? defaultImage : nil
    }
    
    var thirdImage: UIImage? {
        return currentWordIndex + 2 < interactor.words.count ? interactor.words[currentWordIndex + 2].image ?? defaultImage: nil
    }
    
    var score: Int {
        return guessedWords.count - notGuessedWords.count
    }
    
    private func wordGuessed(_ guessed: Bool) {
        if currentWordIndex >= interactor.words.count - 1 {
            return
        }
        let word = interactor.words[currentWordIndex]
        if guessed {
            guessedWords.append(word)
        } else {
            notGuessedWords.append(word)
        }
        guard let output = output else {
            debugPrint("[PlayPresenter]: output is nil")
            return
        }
        let score = guessedWords.count - notGuessedWords.count
        output.setScore(score)
    }
    
    private func nextWord() {
        guard let output = output else {
            assertionFailure("[PlayPresenter]: output is nil")
            return
        }
        locker.lock()
        currentWordIndex += 1
        let currentWordIndex = self.currentWordIndex
        locker.unlock()
        if currentWordIndex >= interactor.words.count {
            return
        }
        output.setCurrentWord(word: interactor.words[currentWordIndex].word)
        output.performSlide(images: [firstImage, secondImage, thirdImage])
    }

}

extension PlayPresenter: PlayInteractorOutput {

    func interactorFailedAction(with message: String) {
        if let output = output {
            output.showAlert(title: "Ошибка", message: message, completion: {
                if let router = self.router {
                    router.exitFromPlayModule()
                } else {
                    debugPrint("[PlayPresenter]: router is nil")
                }
            }, destructive: nil)
        } else {
            debugPrint("[PlayPresenter]: output is nil")
        }
    }
    
    func interactorDidLoadWords() {
        currentWordIndex = 0
        guard let router = router else {
            debugPrint("[PlayPresenter]: router is nil")
            return
        }
        interactor.setupTime()
        updateUI(animated: false)
        DispatchQueue.main.async {
            router.playModuleDidLoadWords()
        }
    }
    
    func interactorDidNotLoadWords() {
        guard let router = router else {
            debugPrint("[PlayPresenter]: router is nil")
            return
        }
        DispatchQueue.main.async {
            router.playModuleDidNotLoadWords()
        }
    }
    
    func timeIsOver() {        
        guard let router = router else {
            debugPrint("[PlayPresenter]: router is nil")
            return
        }
        
        // Результаты команды
        let configuration = interactor.configuration
        let teamResult = TeamResult(configuration: configuration, score: score, team: interactor.team)
        router.showTeamResult(configuration: configuration, teamResult: teamResult, completion: {
            self.interactor.nextTeam()
            let team = self.interactor.team
            if team < self.interactor.configuration.numberOfTeams {
                
                // Следующая команда
                self.interactor.loadWords()
                router.readyFromPlayModule(configuration: configuration, nextTeam: team)
            } else {
                
                // Результаты раунда
                router.showResult(title: "Конец раунда", emoji: "🎯", text: "Информация о конце раунда...", buttonTitle: "Далее", completion: {
                    self.interactor.nextRound()
                    let round = self.interactor.round
                    if round < self.interactor.configuration.numberOfRounds {
                        
                        // Следующий раунд
                        let team = self.interactor.team
                        self.interactor.loadWords()
                        router.readyFromPlayModule(configuration: configuration, nextTeam: team)
                    } else {
                        
                        // Результаты игры
                        router.showResult(title: "Конец игры", emoji: "🏆", text: "Информация о победителе", buttonTitle: "Завершить", completion: {
                            // FIXME: - Будет рабоатать, или сначала нужно закрыть presenting controller
                            router.exitFromPlayModule()
                        })
                    }
                })
            }
        })
        prepareForReuse()
    }

    
    private func prepareForReuse() {
        guessedWords = []
        notGuessedWords = []
    }
    
    func tac() {
        guard let output = output else {
            debugPrint("[PlayPresenter]: output is nil")
            return
        }
        output.setTimeLeft(timeLeft: timeLeftString)
    }
    
}
