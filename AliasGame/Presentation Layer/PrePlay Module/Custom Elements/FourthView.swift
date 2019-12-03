//
//  FourthView.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 03/12/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import UIKit

class FourthView: UIView {

    var imageViews: [UIImageView] = []
    
    init(image: UIImage) {
        super.init(frame: .zero)
        for _ in 0 ..< 3 {
            let imageView = UIImageView(frame: .zero)
            imageView.image = image
            imageView.layer.cornerRadius = 8.0
            imageView.clipsToBounds = true
            imageViews.append(imageView)
            addSubview(imageView)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let width = bounds.width / 2
        let height = bounds.height / 2
        imageViews[0].frame = CGRect(x: -width + width / 2, y: height / 2, width: width, height: height).offsetBy(dx: -8.0, dy: 0.0)
        imageViews[1].frame = CGRect(x:      0 + width / 2, y: height / 2, width: width, height: height)
        imageViews[2].frame = CGRect(x: +width + width / 2, y: height / 2, width: width, height: height).offsetBy(dx: 8.0, dy: 0.0)
        for imageView in imageViews {
            imageView.layer.cornerRadius = imageView.bounds.width / 6
        }
    }

}
