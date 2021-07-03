//
//  FoodRouter.swift
//  TrainApplication
//
//  Created by  Alexandr Zakharov on 08.05.2021.
//

import Foundation

protocol FoodRouterProtocol {
    func open(_ routes: FoodRoutes)
}

class FoodRouter: FoodRouterProtocol {
    var moduleVc: FoodViewController!
    
    func open(_ routes: FoodRoutes) {
        switch routes {
        case .showDay(let userId, let dayId, let title):
            let vc = DayAssembly().build(userId: userId, dayId: dayId, title: title)
            moduleVc.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

enum FoodRoutes {
    case showDay(userId: UUID, dayId: UUID?, title: String)
}
