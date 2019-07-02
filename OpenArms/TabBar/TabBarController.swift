//
//  TabBarController.swift
//  openarms
//
//  Created by Alexander Stevens on 6/14/19.
//  Copyright © 2019 Alexander Stevens. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

  override func viewDidLoad() {
    super.viewDidLoad()
    setupControllers()
    loadDefaultViewController()
  }

  private func setupControllers() {
    let dashboard = DashboardController()
    dashboard.tabBarItem = UITabBarItem(title: "alex", image: nil, tag: 0)

    let dummyVC = UIViewController()
    dummyVC.tabBarItem = UITabBarItem(title: "settings", image: nil, tag: 0)

    viewControllers = [dashboard, dummyVC]
  }

  private func loadDefaultViewController() {
    guard let tabControllers = self.viewControllers else { return }
    if let controller = tabControllers[0] as? DashboardController {
      let coordinator = DashboardCoordinator(viewController: controller, navigationController: self.navigationController)
      coordinator.start()
    }
  }

  override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
    guard let tabControllers = self.viewControllers else { return }
    switch item.title {
    case "alex":
      if let controller = tabControllers[0] as? DashboardController {
        let coordinator = DashboardCoordinator(viewController: controller, navigationController: self.navigationController)
        coordinator.start()
      }
    default:return
    }
  }

}
