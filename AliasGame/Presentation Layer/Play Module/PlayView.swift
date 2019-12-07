//
//  PlayView.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 21/11/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import UIKit

class PlayView: AliasLightViewController {

    
    private let presenter: PlayPresenterInput
    
    
    init(presenter: PlayPresenterInput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupTeamNameLabel()
        setupTimeLeftLabel()
        setupMainWordLabel()
        setupScoreLabel()
        setupImageViews()
        setupButtons()
        presenter.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter.viewDidAppear()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        layoutTeamNameLabel()
        layoutTimeLeftLabel()
        layoutMainWordLabel()
        layoutImageViews()
        layoutButtons()
        layoutScoreLabel()
    }
    
    // MARK: - Элементы синхронизации
    
    let locker = NSLock()
    
    // MARK: - Элементы UI
    
    let stopBarButtonItem = UIBarButtonItem(barButtonSystemItem: .stop, target: nil, action: nil)
    
    let pauseBarButtonItem = UIBarButtonItem(barButtonSystemItem: .pause, target: nil, action: nil)
    
    let teamNameLabel = UILabel(frame: .zero)
    
    let timeLeftLabel = UILabel(frame: .zero)
    
    let successButton = UIButton(type: .custom)
    
    let failureButton = UIButton(type: .custom)
    
    let scoreLabel = UILabel(frame: .zero)
    
    let mainWordLabel = UILabel(frame: .zero)
    
    // На repeating не заменять! (Потому что классы это reference type)
    var imageViews = [UIImageView(), .init(), .init(), .init()]
    
    var topImageViewIndex = 0
    
    var zeroImageView: UIImageView {
        return imageViews[(topImageViewIndex) % imageViews.count]
    }
    
    var firstImageView: UIImageView {
        return imageViews[(topImageViewIndex + 1) % imageViews.count]
    }

    var secondImageView: UIImageView {
        return imageViews[(topImageViewIndex + 2) % imageViews.count]
    }

    var thirdImageView: UIImageView {
        return imageViews[(topImageViewIndex + 3) % imageViews.count]
    }
    
    // MARK: - Настройка элементов UI
    
    /// Настройка кнопок паузы и выхода
    private func setupNavigationBar() {
        stopBarButtonItem.target = self
        stopBarButtonItem.action = #selector(stopBarButtonTapped)
        pauseBarButtonItem.target = self
        pauseBarButtonItem.action = #selector(pauseBarButtonTapped)
        navigationItem.rightBarButtonItem = pauseBarButtonItem
        navigationItem.leftBarButtonItem = stopBarButtonItem
        navigationItem.hidesBackButton = true
        self.navigationItem.largeTitleDisplayMode = .never
    }
    
    private func setupTeamNameLabel() {
        teamNameLabel.text = "[TEAM]"
        teamNameLabel.font = .systemFont(ofSize: 17.0, weight: .medium)
        teamNameLabel.textColor = .black
        teamNameLabel.textAlignment = .left
        view.addSubview(teamNameLabel)
    }
    
    private func setupTimeLeftLabel() {
        timeLeftLabel.text = "[TIME]"
        timeLeftLabel.font = .systemFont(ofSize: 17.0, weight: .medium)
        timeLeftLabel.textColor = .black
        timeLeftLabel.textAlignment = .right
        view.addSubview(timeLeftLabel)
    }
    
    /// Настройка слова
    private func setupMainWordLabel() {
        mainWordLabel.text = " "
        mainWordLabel.font = .systemFont(ofSize: 34.0, weight: .bold)
        mainWordLabel.textAlignment = .center
        view.addSubview(mainWordLabel)
    }
    
    /// Настройка счёта
    private func setupScoreLabel() {
        scoreLabel.text = "17"
        scoreLabel.font = .systemFont(ofSize: 128.0, weight: .bold)
        scoreLabel.textColor = #colorLiteral(red: 0.9580479547, green: 0.9594150742, blue: 0.9802771338, alpha: 1)
        scoreLabel.textAlignment = .center
        view.addSubview(scoreLabel)
    }
    
    /// Настройка картинок
    private func setupImageViews() {
        for imageView in imageViews {
            view.addSubview(imageView)
            imageView.clipsToBounds = true
            imageView.contentMode = .scaleAspectFill
            imageView.backgroundColor = .clear
            /*
            imageView.layer.shadowOpacity = 0.5
            imageView.layer.shadowColor = UIColor.black.cgColor
            imageView.layer.shadowOffset = .zero
            imageView.layer.shadowRadius = 16.0
            imageView.layer.shouldRasterize = true
            imageView.layer.rasterizationScale = UIScreen.main.scale
            */
        }
    }
    
    /// Настройка клавиш ╋ и ━
    private func setupButtons() {
        view.addSubview(successButton)
        view.addSubview(failureButton)
        
        successButton.addTarget(self, action: #selector(successButtonTapped), for: .touchUpInside)
        failureButton.addTarget(self, action: #selector(failureButtonTapped), for: .touchUpInside)
        
        successButton.setTitle("╋", for: .normal)
        failureButton.setTitle("━", for: .normal)
        
        successButton.titleLabel?.font = .systemFont(ofSize: 34.0, weight: .bold)
        failureButton.titleLabel?.font = .systemFont(ofSize: 34.0, weight: .bold)
        
        successButton.setTitleColor(#colorLiteral(red: 0.1215686277, green: 0.1294117719, blue: 0.1411764771, alpha: 1), for: .normal)
        failureButton.setTitleColor(#colorLiteral(red: 0.1215686277, green: 0.1294117719, blue: 0.1411764771, alpha: 1), for: .normal)
        
        successButton.backgroundColor = #colorLiteral(red: 0.9580479547, green: 0.9594150742, blue: 0.9802771338, alpha: 1)
        failureButton.backgroundColor = #colorLiteral(red: 0.9580479547, green: 0.9594150742, blue: 0.9802771338, alpha: 1)
        
        successButton.layer.cornerRadius = 40.0
        failureButton.layer.cornerRadius = 40.0
    }
    
    // MARK: - Настройка layout
    
    private let edgeInset: CGFloat = 16.0
    
    private func layoutTeamNameLabel() {
        let topSafeInset = view.safeAreaInsets.top
        let intrinsicSize = teamNameLabel.intrinsicContentSize
        teamNameLabel.frame = CGRect(x: edgeInset,
                                     y: topSafeInset,
                                     width: view.frame.width - 2 * edgeInset,
                                     height: intrinsicSize.height)
    }
    
    private func layoutTimeLeftLabel() {
        let topSafeInset = view.safeAreaInsets.top
        let intrinsicSize = timeLeftLabel.intrinsicContentSize
        timeLeftLabel.frame = CGRect(x: edgeInset,
                                     y: topSafeInset,
                                     width: view.frame.width - 2 * edgeInset,
                                     height: intrinsicSize.height)
    }
    
    private func layoutMainWordLabel() {
        let topOffset = teamNameLabel.frame.maxY
        let mainWordLabelIntrinsicSize = mainWordLabel.intrinsicContentSize
        mainWordLabel.frame = CGRect(x: 0,
                                     y: topOffset + mainWordLabelIntrinsicSize.height / 2 + 8.0,
                                     width: view.frame.width,
                                     height: mainWordLabelIntrinsicSize.height)
    }
    
    private func layoutImageViews() {
        view.bringSubviewToFront(thirdImageView)
        view.bringSubviewToFront(secondImageView)
        view.bringSubviewToFront(firstImageView)
        view.bringSubviewToFront(zeroImageView)
        
        zeroImageView.alpha = 0.0
        
        let cornerRadius: CGFloat = 16.0
        let scale: CGFloat = 0.95
        
        let firstImageViewWidth = 3 * view.frame.width / 4
        let firstImageViewHeight = min(3 * view.frame.width / 4, view.frame.height - 512 + 32)
        let firstImageViewX = (view.frame.width - firstImageViewWidth) / 2
        let firstImageViewY = mainWordLabel.frame.maxY + 24.0
        let firstImageViewFrame = CGRect(x: firstImageViewX,
                                      y: firstImageViewY,
                                      width: firstImageViewWidth,
                                      height: firstImageViewHeight)
        
        let secondImageViewInset = (1 - scale) * firstImageViewFrame.width
        let secondImageViewYOffset = secondImageViewInset + 16.0 * scale
        let secondImageViewFrame = firstImageViewFrame
            .insetBy(dx: secondImageViewInset, dy: secondImageViewInset)
            .offsetBy(dx: 0, dy: secondImageViewYOffset)
        
        let thirdImageViewInset = (1 - scale) * secondImageViewFrame.width
        let thirdImageViewYOffset = thirdImageViewInset + 16.0 * scale * scale
        let thirdImageViewFrame = secondImageViewFrame
            .insetBy(dx: thirdImageViewInset, dy: thirdImageViewInset)
            .offsetBy(dx: 0, dy: thirdImageViewYOffset)
        
        /*
        // Вместо zeroImageViewFrame используется firstImageViewFrame
        //
        let zeroImageViewInset = -(1 - scale) * firstImageViewFrame.width
        let zeroImageViewYOffset = -(secondImageViewInset + 16.0 * scale)
        let zeroImageViewFrame = firstImageViewFrame
            .insetBy(dx: zeroImageViewInset, dy: zeroImageViewInset)
            .offsetBy(dx: 0, dy: zeroImageViewYOffset)
                                                                        */
        
        zeroImageView.frame = firstImageViewFrame
        firstImageView.frame = firstImageViewFrame
        secondImageView.frame = secondImageViewFrame
        thirdImageView.frame = thirdImageViewFrame
        
        zeroImageView.layer.cornerRadius = cornerRadius / scale
        firstImageView.layer.cornerRadius = cornerRadius
        secondImageView.layer.cornerRadius = cornerRadius * scale
        thirdImageView.layer.cornerRadius = cornerRadius * scale * scale
        
        zeroImageView.layer.cornerRadius = zeroImageView.bounds.width / 32.0
        firstImageView.layer.cornerRadius = firstImageView.bounds.width / 32.0
        secondImageView.layer.cornerRadius = secondImageView.bounds.width / 32.0
        thirdImageView.layer.cornerRadius = thirdImageView.bounds.width / 32.0

        for imageView in imageViews {
            imageView.layer.shadowPath = UIBezierPath(roundedRect: imageView.bounds, cornerRadius: 16.0).cgPath
        }
    }
    
    private func layoutButtons() {
        let mainFrame = firstImageView.frame
        successButton.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        failureButton.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        
        successButton.center = CGPoint(x: 3 * view.frame.width / 4,
                                       y: mainFrame.maxY + 40 + 64)
        failureButton.center = CGPoint(x: 1 * view.frame.width / 4,
                                       y: mainFrame.maxY + 40 + 64)
    }
    
    private func layoutScoreLabel() {
        scoreLabel.frame = CGRect(x: 0,
                                  y: view.frame.height * 0.80,
                                  width: view.frame.width,
                                  height: view.frame.height * 0.15)
    }
    
    // MARK: - Обработка нажатий клавиш
    
    @objc func stopBarButtonTapped() {
        presenter.exitTapped()
//        let alertController = UIAlertController(title: "Завершить игру?",
//                                                message: "Резульаты игры будут потеряны",
//                                                preferredStyle: .alert)
//        let closeAction = UIAlertAction(title: "Да", style: .destructive) { _ in
//            self.presenter.exitTapped()
//        }
//        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel) { _ in
//
//        }
//        alertController.addAction(closeAction)
//        alertController.addAction(cancelAction)
//        present(alertController, animated: true, completion: nil)
    }
    
    @objc func pauseBarButtonTapped() {
        presenter.pauseButtonTapped()
    }
    
    @objc func successButtonTapped() {
        presenter.successButtonTapped()
    }
    
    @objc func failureButtonTapped() {
        presenter.failureButtonTapped()
    }
    
}


extension PlayView: PlayPresenterOutput {
    
    func performSlide(images: [UIImage?]) {
        DispatchQueue.main.async {
            self.locker.lock()
            self.topImageViewIndex += 1
            self.locker.unlock()
            UIView.animate(withDuration: 0.1, delay: 0, options: .curveEaseOut, animations: {
                self.layoutImageViews()
            }, completion: { finished in
                self.setImages(images: images, animated: true)
                UIView.animate(withDuration: 0.1) {
                    self.firstImageView.alpha = 1.0
                    self.secondImageView.alpha = 1.0
                    self.thirdImageView.alpha = 1.0
                }
            })
        }
    }
    
    func setCurrentWord(word: String) {
        DispatchQueue.main.async {
            self.mainWordLabel.text = word.uppercasedFirstLetter()
        }
    }
    
    func setImages(images: [UIImage?], animated: Bool) {
        let orderedImageViews = [firstImageView, secondImageView, thirdImageView]
        guard orderedImageViews.count == images.count else {
            assertionFailure("[PlayView]: orderedImageViews.count != images.count")
            return
        }
        DispatchQueue.main.async {
            for (imageView, image) in zip(orderedImageViews, images) {
                if animated {
                    UIView.transition(with: imageView, duration: 0.3, options: .transitionCrossDissolve, animations: {
                        imageView.image = image
                    }, completion: nil)
                } else {
                    imageView.image = image
                }
            }
        }
    }
    
    func setCurrentTeam(name: String) {
        DispatchQueue.main.async {
            self.teamNameLabel.text = name
        }
    }
    
    func setTimeLeft(timeLeft: String) {
        DispatchQueue.main.async {
            self.timeLeftLabel.text = timeLeft
        }
    }
    
    func setCurrentRound(number: Int) {
        DispatchQueue.main.async {
            self.title = "Раунд \(number)"
        }
    }
    
    func setScore(_ score: Int) {
        DispatchQueue.main.async {
            self.scoreLabel.text = String(score)
        }
    }
    
    func showAlert(title: String, message: String, completion: @escaping () -> Void, destructive: (() -> Void)?) {
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .alert)
        if let destructiveBlock = destructive {
            let destructiveAction = UIAlertAction(title: "Завершить", style: .destructive) { _ in
                destructiveBlock()
            }
            alertController.addAction(destructiveAction)
            let okAction = UIAlertAction(title: "Отмена", style: .cancel) { _ in
                completion()
            }
            alertController.addAction(okAction)
        } else {
            let okAction = UIAlertAction(title: "OK", style: .default) { _ in
                completion()
            }
            alertController.addAction(okAction)
        }
        DispatchQueue.main.async {
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
}
