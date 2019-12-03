//
//  ThirdView.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 03/12/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import UIKit

class ThirdView: UIView {

    private let scale: CGFloat = 1.0 / sqrt(2.0)
    
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
        imageView.bounds = bounds
        imageView.center = CGPoint(x: bounds.width / 2, y: bounds.height / 2)
        imageView.layer.cornerRadius = imageView.bounds.width / 6
        imageView.transform = CGAffineTransform(rotationAngle: .pi / 4).scaledBy(x: scale, y: scale)
    }

}
