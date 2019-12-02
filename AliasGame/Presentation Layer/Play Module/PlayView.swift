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
        setupBarButtons()
        setupMainWordLabel()
        setupScoreLabel()
        setupImageViews()
        setupButtons()
        presenter.viewDidLoad()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
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
    
    let successButton = UIButton(type: .custom)
    
    let failureButton = UIButton(type: .custom)
    
    
    let teamLabel = UILabel(frame: .zero)
    
    let timeLabel = UILabel(frame: .zero)
    
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
        mainWordLabel.text = " "
        mainWordLabel.font = .systemFont(ofSize: 34.0, weight: .bold)
        mainWordLabel.textAlignment = .center
        view.addSubview(mainWordLabel)
    }
    
    /// Настройка счёта
    private func setupScoreLabel() {
        scoreLabel.text = "17"
        scoreLabel.font = .systemFont(ofSize: 128.0, weight: .bold)
        scoreLabel.textColor = #colorLiteral(red: 0.9117276424, green: 0.9130286635, blue: 0.9328820709, alpha: 1)
        scoreLabel.textAlignment = .center
        view.addSubview(scoreLabel)
    }
    
    /// Настройка картинок
    private func setupImageViews() {
        for imageView in imageViews {
            view.addSubview(imageView)
            imageView.backgroundColor = .groupTableViewBackground
            imageView.layer.cornerRadius = 16.0
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
        
        successButton.backgroundColor = #colorLiteral(red: 0.9117276424, green: 0.9130286635, blue: 0.9328820709, alpha: 1)
        failureButton.backgroundColor = #colorLiteral(red: 0.9117276424, green: 0.9130286635, blue: 0.9328820709, alpha: 1)
        
        successButton.layer.cornerRadius = 40.0
        failureButton.layer.cornerRadius = 40.0
    }
    
    // MARK: - Настройка layout
    
    private func layoutMainWordLabel() {
        let topSafeInset = view.safeAreaInsets.top
        let mainWordLabelIntrinsicSize = mainWordLabel.intrinsicContentSize
        mainWordLabel.frame = CGRect(x: 0,
                                     y: topSafeInset + mainWordLabelIntrinsicSize.height / 2 + 8.0,
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
        let firstImageViewX = (view.frame.width - firstImageViewWidth) / 2
        let firstImageViewY = mainWordLabel.frame.maxY + 24.0
        let firstImageViewFrame = CGRect(x: firstImageViewX,
                                      y: firstImageViewY,
                                      width: firstImageViewWidth,
                                      height: firstImageViewWidth)
        
        let secondImageViewInset = (1 - scale) * firstImageViewFrame.width
        let secondImageViewYOffset = secondImageViewInset + 24.0 * scale
        let secondImageViewFrame = firstImageViewFrame
            .insetBy(dx: secondImageViewInset, dy: secondImageViewInset)
            .offsetBy(dx: 0, dy: secondImageViewYOffset)
        
        let thirdImageViewInset = (1 - scale) * secondImageViewFrame.width
        let thirdImageViewYOffset = thirdImageViewInset + 24.0 * scale * scale
        let thirdImageViewFrame = secondImageViewFrame
            .insetBy(dx: thirdImageViewInset, dy: thirdImageViewInset)
            .offsetBy(dx: 0, dy: thirdImageViewYOffset)
        
        let zeroImageViewInset = -(1 - scale) * firstImageViewFrame.width
        let zeroImageViewYOffset = -(secondImageViewInset + 24.0 * scale)
        let zeroImageViewFrame = firstImageViewFrame
            .insetBy(dx: zeroImageViewInset, dy: zeroImageViewInset)
            .offsetBy(dx: 0, dy: zeroImageViewYOffset)
        
        zeroImageView.frame = zeroImageViewFrame
        firstImageView.frame = firstImageViewFrame
        secondImageView.frame = secondImageViewFrame
        thirdImageView.frame = thirdImageViewFrame
        
        zeroImageView.layer.cornerRadius = cornerRadius / scale
        firstImageView.layer.cornerRadius = cornerRadius
        secondImageView.layer.cornerRadius = cornerRadius * scale
        thirdImageView.layer.cornerRadius = cornerRadius * scale * scale

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
            UIView.animate(withDuration: 0.3, animations: {
                self.layoutImageViews()
            }, completion: { finished in
                self.setImages(images: images, animated: true)
                UIView.animate(withDuration: 0.3) {
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
            self.teamLabel.text = name
        }
    }
    
    func setCurrentRound(number: Int) {
        DispatchQueue.main.async {
            self.title = "Раунд \(number)"
        }
    }
    
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
