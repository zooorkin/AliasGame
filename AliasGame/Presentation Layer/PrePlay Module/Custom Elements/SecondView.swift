//
//  SecondView.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 03/12/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import UIKit

class SecondView: UIView {
    
    private var number = 2

    var imageViews: [UIImageView] = []
    
    init(image: UIImage) {
        super.init(frame: .zero)
        for _ in 0 ..< number * number {
            let imageView = UIImageView(frame: .zero)
            imageView.image = image
            imageView.clipsToBounds = true
            imageViews.append(imageView)
            addSubview(imageView)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //    y/x  0    1
    //
    //    0    A    B
    //
    //    1    C    D
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let width = bounds.width / 2
        let height = bounds.width / 2
        for y in 0 ..< number {
            for x in 0 ..< number {
                let xOffset = CGFloat(integerLiteral: x) * bounds.width / 2
                let yOffset = CGFloat(integerLiteral: y) * bounds.height / 2
                let edges = UIEdgeInsets(top: y == 1 ? 4 : 0,
                                         left: x == 1 ? 4 : 0,
                                         bottom: y == 0 ? 4 : 0,
                                         right: x == 0 ? 4 : 0)
                let frame = CGRect(x: xOffset, y: yOffset, width: width, height: height).inset(by: edges)
                let imageView = imageViews[number * x + y]
                imageView.frame = frame
                imageView.layer.cornerRadius = imageView.bounds.width / 6
            }
        }
    }

}
