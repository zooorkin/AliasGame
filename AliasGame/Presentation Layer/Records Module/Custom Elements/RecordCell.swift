//
//  RecordCell.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 28/11/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import UIKit

class RecordCell: UITableViewCell {

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupBackground()
        setupGameModeImageView()
        setupGameModeLabel()
        setupTimeLabel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layoutBackground()
        layoutGameModeImageView()
        layoutGameModeLabel()
        layputTimeLabel()
    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        if highlighted{
            UIView.animate(withDuration: 0.1){
                self.background.backgroundColor = .lightGray
                self.gameModeLabel.textColor = .white
                self.timeLabel.textColor = .white
                self.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
            }
        } else {
            UIView.animate(withDuration: 0.1){
                self.background.backgroundColor = .groupTableViewBackground
                self.gameModeLabel.textColor = #colorLiteral(red: 0.1215686277, green: 0.1294117719, blue: 0.1411764771, alpha: 1)
                self.timeLabel.textColor = #colorLiteral(red: 0.1215686277, green: 0.1294117719, blue: 0.1411764771, alpha: 1)
                self.transform = .identity
            }
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        if selected{
            // Здесь анимация не нужна! Они должны перекрыть UNHIGHLIGHTNING
            background.backgroundColor = .lightGray
            gameModeLabel.textColor = .white
            timeLabel.textColor = .white
        } else {
            UIView.animate(withDuration: 0.3){
                self.background.backgroundColor = .groupTableViewBackground
                self.gameModeLabel.textColor = #colorLiteral(red: 0.1215686277, green: 0.1294117719, blue: 0.1411764771, alpha: 1)
                self.timeLabel.textColor = #colorLiteral(red: 0.1215686277, green: 0.1294117719, blue: 0.1411764771, alpha: 1)
            }
        }
    }
    
    // MARK: - Элементы UI
    
    let background = UIView()
    
    let gameModeImageView = UIImageView()
    
    let gameModeLabel = UILabel()
    
    let timeLabel = UILabel()
    
    // MARK: - Настройка элементов UI
    
    private func setupBackground() {
        backgroundColor = .clear
        background.layer.cornerRadius = 16.0
        background.clipsToBounds = true
        background.backgroundColor = .groupTableViewBackground
        addSubview(background)
        sendSubviewToBack(background)
    }
    
    private func setupGameModeImageView() {
        gameModeImageView.backgroundColor = #colorLiteral(red: 0.9117276424, green: 0.9130286635, blue: 0.9328820709, alpha: 1)
        gameModeImageView.layer.cornerRadius = 8.0
        gameModeImageView.clipsToBounds = true
        addSubview(gameModeImageView)
    }
    
    private func setupGameModeLabel() {
        gameModeLabel.font = .systemFont(ofSize: 17.0, weight: .medium)
        gameModeLabel.text = "Название режима игры"
        gameModeLabel.textColor = #colorLiteral(red: 0.1215686277, green: 0.1294117719, blue: 0.1411764771, alpha: 1)
        addSubview(gameModeLabel)
    }
    
    private func setupTimeLabel() {
        timeLabel.font = .systemFont(ofSize: 17.0, weight: .regular)
        timeLabel.text = "Время игры: 27 мин"
        timeLabel.textColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        addSubview(timeLabel)
    }
    
    // MARK: - Настройка layout
    
    private func layoutBackground() {
        let insets = UIEdgeInsets(top: 4, left: 0, bottom: 4, right: 0)
        background.frame = self.bounds.inset(by: insets)
    }
    
    private func layoutGameModeImageView() {
        let gameModeImageViewInsets = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
        gameModeImageView.frame = CGRect(x: background.frame.minX,
                                         y: background.frame.minY,
                                         width: background.frame.height,
                                         height: background.frame.height)
            .inset(by: gameModeImageViewInsets)
    }
    
    private func layoutGameModeLabel() {
        let gameModeLabelIntrinsicSize = gameModeLabel.intrinsicContentSize
        gameModeLabel.frame = CGRect(x: gameModeImageView.frame.maxX + 16,
                                     y: gameModeImageView.frame.minY + 4,
                                     width: gameModeLabelIntrinsicSize.width,
                                     height: gameModeLabelIntrinsicSize.height)
    }
    
    private func layputTimeLabel() {
        let timeLabelIntrinsicSize = timeLabel.intrinsicContentSize
        timeLabel.frame = CGRect(x: gameModeLabel.frame.minX,
                                     y: gameModeLabel.frame.maxY + 8,
                                     width: timeLabelIntrinsicSize.width,
                                     height: timeLabelIntrinsicSize.height)
    }

}
