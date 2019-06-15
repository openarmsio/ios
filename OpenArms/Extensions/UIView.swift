//
//  UIView.swift
//  openarms
//
//  Created by Alexander Stevens on 6/14/19.
//  Copyright © 2019 Alexander Stevens. All rights reserved.
//

import UIKit

public struct AnchorOffsets {
  let leadingAnchor: CGFloat = 0.0
  let trailingAnchor: CGFloat = 0.0
  let topAnchor: CGFloat = 0.0
  let bottomAnchor: CGFloat = 0.0
}

extension UIView {

  func pin(to: UIView, withOffsets: UIOffset) {

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
