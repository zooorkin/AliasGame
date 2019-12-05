//
//  GameModesTableCell.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 28/11/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import UIKit

protocol GameModesTableCellDelegate {

    func gameModesCell(_ gameModesTableCell: GameModesTableCell, didSelect gameMode: AliasGameMode)
}

class GameModesTableCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var delegate: GameModesTableCellDelegate?
    
    var gameModes: [AliasGameMode]?
    
    let titleLabel = UILabel(frame: .zero)
    
    let collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: 96, height: 96)
        flowLayout.minimumLineSpacing = 8.0
        flowLayout.scrollDirection = .horizontal
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        return UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
    }()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupTitleLabel()
        setupCollectionView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Настройка элементов UI
    
    private func setupTitleLabel() {
        titleLabel.text = "Выберите режим игры"
        titleLabel.font = .systemFont(ofSize: 17.0, weight: .bold)
        titleLabel.textColor = #colorLiteral(red: 0.1215686277, green: 0.1294117719, blue: 0.1411764771, alpha: 1)
        addSubview(titleLabel)
    }
    
    private func setupCollectionView() {
        collectionView.register(GameModeCollectionCell.self, forCellWithReuseIdentifier: "GameModeCollectionCell")
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        addSubview(collectionView)
    }
    
    // MARK: - Настройка layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layoutTitleLabel()
        layoutCollectionView()
    }
    
    private func layoutTitleLabel() {
        let titleLabelIntrinsicSize = titleLabel.intrinsicContentSize
        titleLabel.frame = CGRect(x: 16,
                                  y: 32,
                                  width: bounds.width,
                                  height: titleLabelIntrinsicSize.height)
    }
    
    private func layoutCollectionView() {
        collectionView.frame = CGRect(x: 0,
                                      y: titleLabel.frame.maxY + 16,
                                      width: bounds.width,
                                      height: 96)
    }
    
    // MARK: - UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let gameModes = gameModes {
            return gameModes.count
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GameModeCollectionCell", for: indexPath) as? GameModeCollectionCell else {
            fatalError("[GameModesTableCell]: cell is nil")
        }
        guard let gameModes = gameModes else {
            return cell
        }
        let mode = gameModes[indexPath.row]
        cell.imageView.image = mode.image
        return cell
    }
    
    // MARK: - UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let gameModes = gameModes else {
            return
        }
        let mode = gameModes[indexPath.row]
        delegate?.gameModesCell(self, didSelect: mode)
    }
    
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        UIView.animate(withDuration: 0.3){
            if let cell = collectionView.cellForItem(at: indexPath) {
                cell.transform = CGAffineTransform(scaleX: 0.85, y: 0.85).rotated(by: .pi/12)
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        UIView.animate(withDuration: 0.3){
            if let cell = collectionView.cellForItem(at: indexPath) {
                cell.transform = .identity
            }
        }
    }
    
}
