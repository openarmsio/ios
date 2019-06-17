//
//  DashboardController.swift
//  openarms
//
//  Created by Alexander Stevens on 6/16/19.
//  Copyright © 2019 Alexander Stevens. All rights reserved.
//

import UIKit

class DashboardController: UIViewController {
  fileprivate let topCellId = "topCell"

  var headerHeightConstraint: NSLayoutConstraint?
  var viewModel: NSObject?
  
  private lazy var tableView: UITableView = {
    let table = UITableView()
    table.translatesAutoresizingMaskIntoConstraints = false
    table.backgroundColor = .red
    
    table.delegate = self
    table.dataSource = self

    table.register(DashboardTopTableViewCell.self, forCellReuseIdentifier: topCellId)
    return table
  }()

  private lazy var headerView: DashboardTopView = {
    let view = DashboardTopView(frame: .zero)
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupViews()
  }
  
  private func setupViews() {
    view.addSubview(headerView)
    view.addSubview(tableView)

    self.headerHeightConstraint = self.headerView.heightAnchor.constraint(equalToConstant: 150)
    self.headerHeightConstraint?.isActive = true

    configureConstraints()
  }
  
  private func configureConstraints() {

    NSLayoutConstraint.activate([headerView.topAnchor.constraint(equalTo: view.topAnchor),
                                 headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                 headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor)])

    NSLayoutConstraint.activate([tableView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
                                 tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                                 tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                 tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)])
  }

  func animateHeader() {
    self.headerHeightConstraint?.constant = 150
    UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
      self.view.layoutIfNeeded()
    }, completion: nil)
  }
  
}

extension DashboardController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 100
  }
  
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    return nil
  }
  
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return 0
  }
  
}

extension DashboardController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 20
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell()
    cell.backgroundColor = .white
    return cell
  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
}

extension DashboardController: UIScrollViewDelegate {

  func scrollViewDidScroll(_ scrollView: UIScrollView) {

    if scrollView.contentOffset.y < 0 {
      self.headerHeightConstraint?.constant += abs(scrollView.contentOffset.y)
    }
    else if scrollView.contentOffset.y > 0 && self.headerHeightConstraint?.constant ?? 0 >= 65 {

      self.headerHeightConstraint?.constant -= scrollView.contentOffset.y / 100

      if (self.headerHeightConstraint?.constant ?? 0) > 65 {
        self.headerHeightConstraint?.constant = 65
      }

    }
  }

  func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
    if self.headerHeightConstraint?.constant ?? 0 > 150 {
      animateHeader()
    }
  }

  func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
    if self.headerHeightConstraint?.constant ?? 0 > 150 {
      animateHeader()
    }
  }

}
