//
//  DashboardTopTableViewCell.swift
//  openarms
//
//  Created by Alexander Stevens on 6/16/19.
//  Copyright © 2019 Alexander Stevens. All rights reserved.
//

import UIKit

class DashboardTopTableViewCell: UITableViewCell {
  weak var cellBackgroundView: UIView?
  //weak var dashboardTopView: DashboardTopView?

  override func prepareForReuse() {
    cellBackgroundView?.removeFromSuperview()
  }

  override func awakeFromNib() {
    super.awakeFromNib()
    // initialization
  }

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupViews()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func setupViews() {
    let topView = DashboardTopView()
    topView.backgroundColor = .yellow
    contentView.addSubview(topView)
    NSLayoutConstraint.activate([topView.topAnchor.constraint(equalTo: topAnchor),
                                 topView.bottomAnchor.constraint(equalTo: bottomAnchor),
                                 topView.leftAnchor.constraint(equalTo: leftAnchor),
                                 topView.rightAnchor.constraint(equalTo: rightAnchor)])
  }
}
