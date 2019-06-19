//
//  DashboardCoordinator.swift
//  openarms
//
//  Created by Alexander Stevens on 6/16/19.
//  Copyright © 2019 Alexander Stevens. All rights reserved.
//

import UIKit

class DashboardCoordinator: Coordinator {

  var window: UIWindow

  init(window: UIWindow) {
    self.window = window
  }

  func start() {

    let tabBar = TabBarController()
    let dashboard = DashboardController()
    dashboard.tabBarItem = UITabBarItem(title: "alex", image: nil, tag: 0)
    tabBar.viewControllers = [dashboard]

    let nav = UINavigationController(rootViewController: tabBar)
//    nav.setNavigationBarHidden(true, animated: true)
    window.rootViewController = nav
  }

  private func setupTabBar() {
    
  }
}
