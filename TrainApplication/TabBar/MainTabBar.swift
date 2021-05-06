//
//  TabBarController.swift
//  TrainApplication
//
//  Created by  Alexandr Zakharov on 06.05.2021.
//

import UIKit

class MainTabBar: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func setupTabBar() {
        tabBar.barTintColor = GlobalColors.tintColor
        tabBar.tintColor = GlobalColors.darkColor
        tabBar.unselectedItemTintColor = GlobalColors.darkColor
    }
}
