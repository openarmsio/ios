//
//  DashboardViewModel.swift
//  openarms
//
//  Created by Alexander Stevens on 6/16/19.
//  Copyright © 2019 Alexander Stevens. All rights reserved.
//

import UIKit

public enum DashboardTileSections: Int, CaseIterable {
  case topHeaderView
  case featuredContent
  case upcomingEvents
}

public class DashboardViewModel {

  init() {}

  func numberOfRowsInSection(section: Int) -> Int {
    return 1
  }

}
