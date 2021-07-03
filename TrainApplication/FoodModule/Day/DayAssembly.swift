//
//  DayAssembly.swift
//  TrainApplication
//
//  Created by  Alexandr Zakharov on 08.05.2021.
//

import UIKit

class DayAssembly {
    func build(userId: UUID, dayId: UUID?, title: String) -> UIViewController {
        let vc = DayViewController()
        
        let foodService = FoodService()
        let router = DayRouter()
        let viewModel = DayViewModel(userId: userId, foodService: foodService, dayId: dayId, router: router)
        
        router.moduleVc = vc
        vc.viewModel = viewModel
        vc.title = title
        return vc
    }
}
