//
//  AppCoordinator.swift
//  openarms
//
//  Created by Alexander Stevens on 6/14/19.
//  Copyright © 2019 Alexander Stevens. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator {

  var window: UIWindow
  var tabBar: TabBarController?

  init(window: UIWindow) {
    self.window = window
  }

  func start() {
    setupTabBar()
    guard let tabBarController = self.tabBar else { return }
    let nav = UINavigationController(rootViewController: tabBarController)
    //    nav.setNavigationBarHidden(true, animated: true)
    window.rootViewController = nav
  }

  private func setupTabBar() {
    let tabBar = TabBarController()
    self.tabBar = tabBar
  }
}
