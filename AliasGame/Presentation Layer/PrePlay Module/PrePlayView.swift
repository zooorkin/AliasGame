//
//  PrePlayView.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 02/12/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import UIKit

class PrePlayView: AliasLightViewController {

    private let presenter: PrePlayPresenterInput
    
    
    init(presenter: PrePlayPresenterInput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupBarButtons()
        setupFirstLabel()
        setupFirstImageView()
        setupStartGameButton()
        setupTextLabel()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        layoutFirstLabel()
        layoutFirstImageView()
        layoutStartGameButton()
        layoutTextLabel()
    }
    
    // MARK: - Элементы UI
    
    let stopBarButtonItem = UIBarButtonItem(barButtonSystemItem: .stop, target: nil, action: nil)
    
    let firstLabel = UILabel(frame: .zero)
    
    let firstImageView = UIImageView(frame: .zero)
    
    let textLabel = UILabel(frame: .zero)
    
    let startGameButton = UIButton(frame: .zero)
    
    // MARK: - Настройка элементов UI
    
    /// Настройка кнопок паузы и выхода
    private func setupBarButtons() {
        stopBarButtonItem.target = self
        stopBarButtonItem.action = #selector(stopBarButtonTapped)
        navigationItem.rightBarButtonItems = [stopBarButtonItem]
        self.navigationItem.largeTitleDisplayMode = .never
    }
    
    /// Настройка слова
    private func setupFirstLabel() {
        firstLabel.text = "Начало игры"
        firstLabel.font = .systemFont(ofSize: 37.0, weight: .bold)
        firstLabel.textAlignment = .center
        view.addSubview(firstLabel)
    }
    
    /// Настройка картинок
    private func setupFirstImageView() {
        view.addSubview(firstImageView)
        firstImageView.layer.cornerRadius = 16.0
        firstImageView.clipsToBounds = true
        firstImageView.contentMode = .scaleAspectFill
        firstImageView.backgroundColor = .clear
        firstImageView.contentMode = .scaleAspectFill
        firstImageView.image = #imageLiteral(resourceName: "game-mode-2")
    }
    
    private func setupTextLabel() {
        view.addSubview(textLabel)
        textLabel.text = "Чтобы начать игру, нажмите Далее"
        textLabel.textAlignment = .center
        textLabel.numberOfLines = 0
    }
    
    private func setupStartGameButton() {
        view.addSubview(startGameButton)
        startGameButton.setTitle("Далее", for: .normal)
        startGameButton.setTitleColor(#colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1), for: .normal)
        startGameButton.addTarget(self, action: #selector(startGameButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - Настройка layout
    
    private func layoutFirstLabel() {
        let topSafeInset = view.safeAreaInsets.top
        let firstLabelIntrinsicSize = firstLabel.intrinsicContentSize
        firstLabel.frame = CGRect(x: 0,
                                     y: topSafeInset + firstLabelIntrinsicSize.height / 2 + 32.0,
                                     width: view.frame.width,
                                     height: firstLabelIntrinsicSize.height)
    }
    
    private func layoutFirstImageView() {
        let firstImageViewWidth = view.frame.width * 0.30
        let firstImageViewX = (view.frame.width - firstImageViewWidth) / 2
        let firstImageViewY = firstLabel.frame.maxY + 48.0
        let firstImageViewFrame = CGRect(x: firstImageViewX,
                                         y: firstImageViewY,
                                         width: firstImageViewWidth,
                                         height: firstImageViewWidth)
       firstImageView.frame = firstImageViewFrame
    }
    
    private func layoutTextLabel() {
        textLabel.frame = CGRect(x: view.frame.width / 4,
                                 y: firstImageView.frame.maxY + 32.0,
                                 width: view.frame.width / 2,
                                 height: 80)
    }
    
    private func layoutStartGameButton() {
        startGameButton.frame = CGRect(x: 0, y: 640, width: view.frame.width, height: 80)
    }
    
    // MARK: - Обработка нажатий клавиш
    
    @objc func stopBarButtonTapped() {
        presenter.exitTapped()
    }
    
    @objc func startGameButtonTapped() {
        presenter.startGameButtonTapped()
    }
    
}

extension PrePlayView: PrePlayPresenterOutput {

}
