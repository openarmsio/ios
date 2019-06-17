//
//  DashboardTopView.swift
//  openarms
//
//  Created by Alexander Stevens on 6/16/19.
//  Copyright © 2019 Alexander Stevens. All rights reserved.
//

import UIKit

class DashboardTopView: UIView {

  var colorView: UIView!
  var bgColor = UIColor(red: 235/255, green: 96/255, blue: 91/255, alpha: 1)

  override func awakeFromNib() {
    super.awakeFromNib()
  }

  override init(frame: CGRect) {
    super.init(frame: frame)
    setUpView()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func setUpView() {
    self.backgroundColor = UIColor.white
    colorView = UIView()
    colorView.translatesAutoresizingMaskIntoConstraints = false
    self.addSubview(colorView)
    let constraints: [NSLayoutConstraint] = [
      colorView.topAnchor.constraint(equalTo: self.topAnchor),
      colorView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
      colorView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
      colorView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
    ]
    NSLayoutConstraint.activate(constraints)
    colorView.backgroundColor = bgColor
    colorView.alpha = 0.6
  }
}
