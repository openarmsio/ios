//
//  DashboardTopView.swift
//  openarms
//
//  Created by Alexander Stevens on 6/16/19.
//  Copyright © 2019 Alexander Stevens. All rights reserved.
//

import UIKit

class DashboardTopView: UIView {

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
    self.backgroundColor = UIColor.yellow
  }
}
