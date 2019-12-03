//
//  GameModeCollectionCell.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 28/11/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import UIKit

class GameModeCollectionCell: UICollectionViewCell {
    
    
    let imageView = UIImageView(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        clipsToBounds = true
        backgroundColor = #colorLiteral(red: 0.9117276424, green: 0.9130286635, blue: 0.9328820709, alpha: 1)
        backgroundColor = getRandomColor()
        setupImageView()
    }
    
    
    private func setupImageView() {
        addSubview(imageView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = bounds
        layer.cornerRadius = layer.bounds.width / 6.0
    }
    
}
