//
//  UIView.swift
//  openarms
//
//  Created by Alexander Stevens on 6/14/19.
//  Copyright © 2019 Alexander Stevens. All rights reserved.
//

import UIKit

public struct UIViewOffsets {
    var leadingAnchor: CGFloat = 0.0
    var trailingAnchor: CGFloat = 0.0
    var topAnchor: CGFloat = 0.0
    var bottomAnchor: CGFloat = 0.0
}

extension UIView {
    
    func attach(to view: UIView, with offsets: UIViewOffsets) {
        
        var arr: [NSLayoutConstraint] = []
        arr.append(leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: offsets.leadingAnchor))
        arr.append(trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: offsets.leadingAnchor))
        arr.append(topAnchor.constraint(equalTo: view.topAnchor, constant: offsets.leadingAnchor))
        arr.append(bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: offsets.leadingAnchor))
        NSLayoutConstraint.activate(arr)
        
        self.layoutIfNeeded()
    }
    
    func roundCorners() {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: .allCorners, cornerRadii: CGSize(width: 16, height: 16))
        let maskLayer = CAShapeLayer()
        maskLayer.path = path.cgPath
        layer.mask = maskLayer
        layer.masksToBounds = true
        clipsToBounds = true
    }
    
    func applyGradient(withColors colors: [CGColor]) {
        let gradient = CAGradientLayer()
        gradient.colors = colors// your colors go here
        gradient.locations = [0.0, 0.5, 1.0]
        gradient.frame = bounds
        layer.insertSublayer(gradient, at: 0)
    }
    
    func dropShadow(withCornerRadius radius: CGFloat, withCGSize size: CGSize, withColor color: CGColor, masksToBounds: Bool) {
        layer.masksToBounds = masksToBounds
        layer.shadowColor = color
        layer.shadowOffset = size
        layer.cornerRadius = radius
    }
    
}
