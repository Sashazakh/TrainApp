//
//  File.swift
//  TrainApplication
//
//  Created by  Alexandr Zakharov on 09.05.2021.
//

import UIKit

class AddDayAssembly {
    func build(userId: UUID, dayId: UUID?) -> UIViewController {
        let vc = AddDayViewController()
        
        let foodService = FoodService()
        let viewModel = AddDayViewModel(userId: userId, foodService: foodService, dayId: dayId)
        
        vc.viewModel = viewModel
        return vc
    }
}
