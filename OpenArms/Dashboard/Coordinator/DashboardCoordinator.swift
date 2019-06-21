//
//  DashboardCoordinator.swift
//  openarms
//
//  Created by Alexander Stevens on 6/16/19.
//  Copyright © 2019 Alexander Stevens. All rights reserved.
//

import UIKit

class DashboardCoordinator: Coordinator {

  var dashboardViewController: DashboardController?
  var navigationController: UINavigationController?

  init(viewController: DashboardController, navigationController: UINavigationController?) {
    self.dashboardViewController = viewController

    guard navigationController != nil else { return }
    self.navigationController = navigationController
  }

  func start() {
    dashboardViewController?.viewModel = DashboardViewModel()
  }
}
