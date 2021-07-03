//
//  TabBarAssemble.swift
//  TrainApplication
//
//  Created by  Alexandr Zakharov on 06.05.2021.
//

import UIKit

class TabBarAssemble {
    private var userId: UUID!
    
    func build(userId: UUID) -> UIViewController {
        let tabBar = MainTabBar()
        
        self.userId = userId
        
        tabBar.viewControllers = [prepareExerciseViewController(),
                                  prepareFoodViewController(),
                                  prepareUserViewController()]
        
        return tabBar
    }
    
    private func prepareExerciseViewController() -> UINavigationController {
        let vc = ExerciseAssembly().build()
        let tabBarItem = UITabBarItem(title: "Exercises",
                                      image: UIImage(named: "exercise"),
                                      tag: 0)
        vc.tabBarItem = tabBarItem
        
        let navigationVC = UINavigationController(rootViewController: vc)
        navigationVC.navigationBar.isHidden = true
        return navigationVC
    }
    
    private func prepareFoodViewController() -> UINavigationController {
        let vc = FoodAssembly().build(userId: userId)
        let tabBarItem = UITabBarItem(title: "Food",
                                      image: UIImage(named: "food"),
                                      tag: 0)
        vc.tabBarItem = tabBarItem
        
        let navigationVC = UINavigationController(rootViewController: vc)
        return navigationVC
    }
    
    private func prepareUserViewController() -> UINavigationController {
        let vc = UserAssembly().build(userId: userId)
        let tabBarItem = UITabBarItem(title: "User",
                                      image: UIImage(named: "user"),
                                      tag: 0)
        vc.tabBarItem = tabBarItem
        
        let navigationVC = UINavigationController(rootViewController: vc)
        navigationVC.navigationBar.isHidden = true
        return navigationVC
    }
}
