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

  init(window: UIWindow) {
    self.window = window
  }

  func start() {
    // load some initial view controller
    let tabBar = TabBarController()
    let nav = UINavigationController(rootViewController: tabBar)
    window.rootViewController = nav
  }
}
