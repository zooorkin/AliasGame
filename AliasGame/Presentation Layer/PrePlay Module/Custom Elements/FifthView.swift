//
//  FifthView.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 03/12/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import UIKit

class FifthView: UIView {
    
    var label: UILabel = UILabel(frame: .zero)
    
    init(emoji: String) {
        super.init(frame: .zero)
        label.text = emoji
        label.font = .systemFont(ofSize: 80.0, weight: .regular)
        label.textAlignment = .center
        addSubview(label)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = bounds
    }
    
}
