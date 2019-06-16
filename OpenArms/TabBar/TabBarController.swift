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

    let dashboardViewController = DashboardController()
    dashboardViewController.tabBarItem = UITabBarItem(title: "alex", image: nil, tag: 0)

    self.viewControllers = [dashboardViewController]

  }
}
