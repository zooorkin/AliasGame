//
//  AliasSegmentedControl.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 05/12/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

import UIKit

class AliasSegmentedControl: UISegmentedControl {
    
    init(segments: [String], color: UIColor) {
        super.init(frame: .zero)
        tintColor = color
        setup(segments: segments)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        for subview in subviews {
            let radius = min(subview.frame.width, subview.frame.height) / 2
            subview.layer.cornerRadius = radius
            subview.layer.masksToBounds = true
            
            let width = min(subview.frame.width, subview.frame.height)
            let size = CGSize(width: width, height: width)
            let center = subview.center
            let frame = CGRect(origin: .zero, size: size)
            subview.frame = frame
            subview.center = center
        }
    }
    
    func setup(segments: [String]) {
        for segmentTitle in segments {
            insertSegment(withTitle: segmentTitle, at: numberOfSegments, animated: false)
        }
        selectedSegmentIndex = Int((Double(segments.count) / 2.0).rounded(.down))
        setDividerImage(UIImage(), forLeftSegmentState: .selected, rightSegmentState: .normal, barMetrics: .default)
        let normalFont = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17, weight: .regular),
                           NSAttributedString.Key.foregroundColor: UIColor.black]
        let selectedFont = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17, weight: .medium),
                            NSAttributedString.Key.foregroundColor: UIColor.white]
        setTitleTextAttributes(normalFont, for: .normal)
        setTitleTextAttributes(selectedFont, for: .selected)
        
        let size = CGSize(width: 48.0, height: 48.0)
        let imageNormal = UIImage(color: .clear, size: size)
        let imageSelected = UIImage(color: tintColor, size: size)
        setBackgroundImage(imageNormal, for: .normal, barMetrics: .default)
        setBackgroundImage(imageSelected, for: .selected, barMetrics: .default)
    }
    
}
