//
//  FoodAssemble.swift
//  TrainApplication
//
//  Created by  Alexandr Zakharov on 06.05.2021.
//

import UIKit

class FoodAssembly {
    func build(userId: UUID) -> UIViewController {
        let vc = FoodViewController()
        
        let foodService = FoodService()
        let router = FoodRouter()
        let viewModel = FoodViewModel(userId: userId, foodService: foodService, router: router)
        
        vc.viewModel = viewModel
        router.moduleVc = vc
        return vc
    }
}
