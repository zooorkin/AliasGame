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

    var model: SingleScreenModel
    
    init(model: SingleScreenModel, customView: UIView) {
        self.model = model
        self.customView = customView
        super.init(frame: .zero)
        setupTitleLabel()
        setupCustomView()
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
    }
    
    // MARK: - Элементы UI
    
    let titleLabel = UILabel(frame: .zero)
    
    let customView: UIView
    
    let textLabel = UILabel(frame: .zero)
    
    let button = UIButton(frame: .zero)

    // MARK: - Настройка элементов UI
    
    /// Настройка слова
    private func setupTitleLabel() {
        titleLabel.text = model.title
        titleLabel.font = .systemFont(ofSize: 37.0, weight: .bold)
        titleLabel.textAlignment = .center
        addSubview(titleLabel)
    }
    
    /// Настройка картинок
    private func setupCustomView() {
        addSubview(customView)
    }
    
    private func setupTextLabel() {
        addSubview(textLabel)
        textLabel.text = model.text
        textLabel.textAlignment = .center
        textLabel.numberOfLines = 0
    }
    
    private func setupButton() {
        addSubview(button)
        button.setTitle(model.buttonTitle, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 24.0, weight: .medium)
        button.setTitleColor(model.color, for: .normal)
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
        textLabel.frame = CGRect(x: 0,
                                 y: customView.frame.maxY + 32.0,
                                 width: frame.width,
                                 height: 80).insetBy(dx: 32.0, dy: 0)
    }
    
    private func layoutButton() {
        button.frame = CGRect(x: 0, y: 0.8 * bounds.height, width: bounds.width, height: 80)
    }
    
}
