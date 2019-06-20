//
//  DashboardTopTableViewCell.swift
//  openarms
//
//  Created by Alexander Stevens on 6/16/19.
//  Copyright © 2019 Alexander Stevens. All rights reserved.
//

import UIKit

class DashboardTopTableViewCell: UITableViewCell {
  weak var backgoundCellView: UIView?
  weak var dashboardTopView: DashboardTopView?

  override func prepareForReuse() {
    super.prepareForReuse()
    backgoundCellView?.removeFromSuperview()
    dashboardTopView?.removeFromSuperview()
  }

  override func awakeFromNib() {
    super.awakeFromNib()
  }

  func setupTheme() {
    self.backgroundColor = .purple
    self.contentView.backgroundColor = . yellow
  }

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupViews()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func setupViews() {
    let dashboardTopView = DashboardTopView()
    let cellBackgroundView = UIView()
    let offsets = UIViewOffsets()
    self.dashboardTopView = dashboardTopView
    self.backgoundCellView = cellBackgroundView
    dashboardTopView.attach(to: cellBackgroundView, with: offsets)

    contentView.addSubview(cellBackgroundView)
    cellBackgroundView.attach(to: contentView, with: offsets)

  }
}
