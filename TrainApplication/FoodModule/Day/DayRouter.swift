//
//  DayRouter.swift
//  TrainApplication
//
//  Created by  Alexandr Zakharov on 09.05.2021.
//

import Foundation

protocol DayRouterProtocol {
    func open(_ routes: DayRoutes)
}

class DayRouter: DayRouterProtocol {
    var moduleVc: DayViewController!
    
    func open(_ routes: DayRoutes) {
        switch routes {
        case .addDay(let userId, let dayId):
            let vc = AddDayAssembly().build(userId: userId, dayId: dayId)
            moduleVc.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

enum DayRoutes {
    case addDay(userId: UUID, dayId: UUID?)
}

