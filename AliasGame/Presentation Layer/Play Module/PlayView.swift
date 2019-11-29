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
        title = "Раунд 1"
        setupBarButtons()
        setupMainWordLabel()
        setupScoreLabel()
        setupImageViews()
        setupButtons()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        layoutMainWordLabel()
        layoutImageViews()
        layoutButtons()
        layoutScoreLabel()
    }
    
    // MARK: - Элементы UI
    
    let stopBarButtonItem = UIBarButtonItem(barButtonSystemItem: .stop, target: nil, action: nil)
    
    let pauseBarButtonItem = UIBarButtonItem(barButtonSystemItem: .pause, target: nil, action: nil)
    
    let successButton = UIButton(type: .custom)
    
    let failureButton = UIButton(type: .custom)
    
    
    let teamLabel = UILabel(frame: .zero)
    
    let timeLabel = UILabel(frame: .zero)
    
    let scoreLabel = UILabel(frame: .zero)
    
    let mainWordLabel = UILabel(frame: .zero)
    
    
    let leftLeftImageView = UIImageView(frame: .zero)
    
    let leftImageView = UIImageView(frame: .zero)
    
    let centerImageView = UIImageView(frame: .zero)
    
    let rightImageView = UIImageView(frame: .zero)
    
    let rightRightImageView = UIImageView(frame: .zero)
    
    // MARK: - Настройка элементов UI
    
    /// Настройка кнопок паузы и выхода
    private func setupBarButtons() {
        stopBarButtonItem.target = self
        stopBarButtonItem.action = #selector(stopBarButtonTapped)
        pauseBarButtonItem.target = self
        pauseBarButtonItem.action = #selector(pauseBarButtonTapped)
        navigationItem.rightBarButtonItems = [stopBarButtonItem, pauseBarButtonItem]
        self.navigationItem.largeTitleDisplayMode = .never
    }
    
    /// Настройка слова
    private func setupMainWordLabel() {
        mainWordLabel.text = "Слово"
        mainWordLabel.font = .systemFont(ofSize: 34.0, weight: .bold)
        view.addSubview(mainWordLabel)
    }
    
    /// Настройка счёта
    private func setupScoreLabel() {
        scoreLabel.text = "17"
        scoreLabel.font = .systemFont(ofSize: 256.0, weight: .bold)
        scoreLabel.textColor = #colorLiteral(red: 0.9117276424, green: 0.9130286635, blue: 0.9328820709, alpha: 1)
        scoreLabel.textAlignment = .center
        view.addSubview(scoreLabel)
    }
    
    /// Настройка картинок
    private func setupImageViews() {
        let imageViews = [leftLeftImageView,
                          rightRightImageView,
                          leftImageView,
                          rightImageView,
                          centerImageView]
        
        for imageView in imageViews {
            view.addSubview(imageView)
            imageView.layer.cornerRadius = 8.0
            imageView.clipsToBounds = true
        }
        centerImageView.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        rightImageView.backgroundColor = #colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)
        leftImageView.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        rightRightImageView.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        leftLeftImageView.backgroundColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
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
        
        successButton.backgroundColor = #colorLiteral(red: 0.9117276424, green: 0.9130286635, blue: 0.9328820709, alpha: 1)
        failureButton.backgroundColor = #colorLiteral(red: 0.9117276424, green: 0.9130286635, blue: 0.9328820709, alpha: 1)
        
        successButton.layer.cornerRadius = 40.0
        failureButton.layer.cornerRadius = 40.0
    }
    
    // MARK: - Настройка layout
    
    private func layoutMainWordLabel() {
        let topSafeInset = view.safeAreaInsets.top
        let mainWordLabelIntrinsicSize = mainWordLabel.intrinsicContentSize
        mainWordLabel.frame = CGRect(origin: .zero, size: mainWordLabelIntrinsicSize)
        mainWordLabel.center = CGPoint(x: view.center.x,
                                       y: topSafeInset + mainWordLabelIntrinsicSize.height / 2 + 32.0)
    }
    
    private func layoutImageViews() {
        let mainImageViewWidth = view.frame.width / 2
        centerImageView.frame = CGRect(x: 0, y: 0, width: mainImageViewWidth,
                                       height: mainImageViewWidth)
        centerImageView.center = CGPoint(x: view.center.x,
                                         y: mainWordLabel.frame.maxY
                                            + mainImageViewWidth / 2 + 32.0)
        let mainFrame = centerImageView.frame
        
        rightImageView.frame = mainFrame
        leftImageView.frame = mainFrame
        rightRightImageView.frame = mainFrame
        leftLeftImageView.frame = mainFrame
        
        let xTranslation = view.frame.width / 7
        
        let scale: CGFloat = 0.9
        rightImageView.transform = CGAffineTransform(scaleX: scale, y: scale)
            .translatedBy(x: xTranslation, y: 0)
        leftImageView.transform = CGAffineTransform(scaleX: scale, y: scale)
            .translatedBy(x: -xTranslation, y: 0)
        
        let scaleSquared = scale * scale
        rightRightImageView.transform = CGAffineTransform(scaleX: scaleSquared, y: scaleSquared)
            .translatedBy(x: (1 + scale) * xTranslation, y: 0)
        leftLeftImageView.transform = CGAffineTransform(scaleX: scaleSquared, y: scaleSquared)
            .translatedBy(x: (1 + scale) * -xTranslation, y: 0)
    }
    
    private func layoutButtons() {
        let mainFrame = centerImageView.frame
        successButton.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        failureButton.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        
        successButton.center = CGPoint(x: 3 * view.frame.width / 4,
                                       y: mainFrame.maxY + 40 + 64)
        failureButton.center = CGPoint(x: 1 * view.frame.width / 4,
                                       y: mainFrame.maxY + 40 + 64)
    }
    
    private func layoutScoreLabel() {
        scoreLabel.frame = CGRect(x: 0,
                                  y: view.frame.height * 0.65,
                                  width: view.frame.width,
                                  height: view.frame.height * 0.35)
    }
    
    // MARK: - Обработка нажатий клавиш
    
    @objc func stopBarButtonTapped() {
        let alertController = UIAlertController(title: "Завершить игру?",
                                                message: "Резульаты игры будут потеряны",
                                                preferredStyle: .alert)
        let closeAction = UIAlertAction(title: "Да", style: .destructive) { _ in
            self.presenter.exitTapped()
        }
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel) { _ in
            
        }
        alertController.addAction(closeAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }
    
    @objc func pauseBarButtonTapped() {
        print("\(#function) is called")
    }
    
    @objc func successButtonTapped() {
        print("\(#function) is called")
    }
    
    @objc func failureButtonTapped() {
        print("\(#function) is called")
    }
    
}


extension PlayView: PlayPresenterOutput {
    
    func showAlert(with message: String, completion: @escaping () -> Void) {
        let alertController = UIAlertController(title: "Уведомление",
                                                message: message,
                                                preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            completion()
        }
        alertController.addAction(okAction)
        DispatchQueue.main.async {
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
}
