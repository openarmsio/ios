//
//  DashboardViewModel.swift
//  openarms
//
//  Created by Alexander Stevens on 6/16/19.
//  Copyright © 2019 Alexander Stevens. All rights reserved.
//

import UIKit

enum DashboardTileSections: Int, CaseIterable {
  case topHeaderView
  case featuredContent
  case upcomingEvents
}

public class DashboardViewModel {

  init() {}

  func cellHeightForIndexPath(indexPath: IndexPath) -> CGFloat  {
    switch indexPath.row {
    case 0:
      return 50
    case 1:
      return 100
    default:
      return 0.0
    }
  }

  func numberOfRowsInSection(section: Int) -> Int {
    return 2
  }

  func createTableViewCells() {

  }

}
