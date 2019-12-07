//
//  SingleScreenView.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 03/12/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import UIKit

struct SingleScreenModel {
    
    var title: String
    
    var text: String
    
    var color: UIColor
    
    var buttonTitle: String

}

class SingleScreenView: UIView {
    
    init() {
        super.init(frame: .zero)
        setupTitleLabel()
        setupTextLabel()
        setupButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layoutTitleLabel()
        layoutCustomView()
        layoutTextLabel()
        layoutButton()
        layoutCustomControlView()
        layoutActivityIndicator()
    }
    
    func loadModel(model: SingleScreenModel) {
        tintColor = model.color
        titleLabel.text = model.title
        textLabel.text = model.text
        button.setTitle(model.buttonTitle, for: .normal)
        button.setTitleColor(model.color, for: .normal)
    }
    
    func loadCustomView(customView: UIView) {
        if let oldCustomView = self.customView {
            oldCustomView.removeFromSuperview()
        }
        self.customView = customView
        setupCustomView()
    }
    
    func loadCustomControl(customControl: UIView) {
        if let oldCustomControl = self.customControl {
            oldCustomControl.removeFromSuperview()
        }
        self.customControl = customControl
        setupCustomControl()
    }
    
    // MARK: - Элементы UI
    
    var activityIndicatorIsLoaded: Bool = false
    
    lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.color = .black
        activityIndicator.style = .gray
        activityIndicator.isHidden = true
        addSubview(activityIndicator)
        activityIndicatorIsLoaded = true
        return activityIndicator
    }()
    
    let titleLabel = UILabel(frame: .zero)
    
    var customView: UIView?
    
    let textLabel = UITextView(frame: .zero)
    
    let button = UIButton(frame: .zero)
    
    var customControl: UIView?

    // MARK: - Настройка элементов UI
    
    /// Настройка слова
    private func setupTitleLabel() {
        titleLabel.font = .systemFont(ofSize: 37.0, weight: .bold)
        titleLabel.textAlignment = .center
        addSubview(titleLabel)
    }
    
    /// Настройка картинок
    private func setupCustomView() {
        guard let customView = customView else {
            return
        }
        addSubview(customView)
    }
    
    private func setupTextLabel() {
        addSubview(textLabel)
        textLabel.textAlignment = .center
        textLabel.isEditable = false
        textLabel.isSelectable = false
        textLabel.font = .systemFont(ofSize: 17.0, weight: .regular)
        textLabel.textColor = .black
    }
    
    private func setupCustomControl() {
        guard let customControl = customControl else {
            return
        }
        addSubview(customControl)
        if let segmentedControl = customControl as? UISegmentedControl {
            segmentedControl.tintColor = tintColor
        }
    }
    
    private func setupButton() {
        addSubview(button)
        button.titleLabel?.font = .systemFont(ofSize: 24.0, weight: .medium)
    }
    
    // MARK: - Настройка layout
    
    private func layoutTitleLabel() {
        let topSafeInset = safeAreaInsets.top
        let titleLabelIntrinsicSize = titleLabel.intrinsicContentSize
        titleLabel.frame = CGRect(x: 0,
                                  y: topSafeInset + titleLabelIntrinsicSize.height / 2 + 32.0,
                                  width: frame.width,
                                  height: titleLabelIntrinsicSize.height)
    }
    
    private func layoutCustomView() {
        guard let customView = customView else {
            debugPrint("[SingleScreenView]: customView is nil")
            return
        }
        let customViewWidth = frame.width * 0.30
        let customViewX = (frame.width - customViewWidth) / 2
        let customViewY = titleLabel.frame.maxY + 48.0
        let customViewFrame = CGRect(x: customViewX,
                                         y: customViewY,
                                         width: customViewWidth,
                                         height: customViewWidth)
        customView.frame = customViewFrame
    }
    
    private func layoutTextLabel() {
        if let customView = customView  {
            textLabel.frame = CGRect(x: 0,
                                     y: customView.frame.maxY + 32.0,
                                     width: frame.width,
                                     height: 128.0)
                .insetBy(dx: 32.0, dy: 0)
        } else {
                textLabel.frame = CGRect(x: 0,
                                 y: titleLabel.frame.maxY + 48.0,
                                 width: frame.width,
                                 height: 128)
                    .insetBy(dx: 32.0, dy: 0)
        }
    }

    
    private func layoutButton() {
        let buttonHeight: CGFloat = 80.0
        let buttonBottomOffset: CGFloat = 80.0
        let bottomInset = superview?.superview?.safeAreaInsets.bottom ?? 0.0
        let buttonY = bounds.height - buttonHeight - buttonBottomOffset + bottomInset
        button.frame = CGRect(x: 0, y: buttonY, width: bounds.width, height: buttonHeight)
    }
    
    private func layoutCustomControlView() {
        guard let customControl = customControl else {
            return
        }
        let customControlY = textLabel.frame.minY + 80.0
        let customControlFrame = CGRect(x: 32.0,
                                        y: customControlY,
                                        width: frame.width - 2 * 32.0,
                                        height: 48)
        customControl.frame = customControlFrame
    }
    
    private func layoutActivityIndicator() {
        if activityIndicatorIsLoaded {
            activityIndicator.frame = CGRect(origin: .zero, size: activityIndicator.intrinsicContentSize)
            activityIndicator.center = button.center
        }
    }
    
    func enableButton() {
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
            self.activityIndicator.isHidden = true
            self.button.isHidden = false
            self.button.isEnabled = true
        }
        
    }
    
    func disableButton() {
        DispatchQueue.main.async {
            self.activityIndicator.startAnimating()
            self.activityIndicator.isHidden = false
            self.button.isHidden = true
            self.button.isEnabled = false
        }
    }
    
}
