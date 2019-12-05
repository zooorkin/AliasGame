//
//  FirstView.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 03/12/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import UIKit

class FirstView: UIView {
    
    var imageView: UIImageView = UIImageView(frame: .zero)
    
    init(image: UIImage) {
        super.init(frame: .zero)
        imageView.image = image
        imageView.clipsToBounds = true
        addSubview(imageView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = bounds.insetBy(dx: 4.0, dy: 4.0)
        imageView.layer.cornerRadius = imageView.bounds.width / 6
    }
    
}
