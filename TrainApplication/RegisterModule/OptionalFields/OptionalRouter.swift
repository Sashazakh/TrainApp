//
//  OptionalRouter.swift
//  TrainApplication
//
//  Created by  Alexandr Zakharov on 06.05.2021.
//

import UIKit

protocol OptionalRouterProtocol {
    func open(_ routes: OptionalRoutes)
}

class OptionalRouter: OptionalRouterProtocol {
    var moduleVc: OptionalViewController!
    
    func open(_ routes: OptionalRoutes) {
        switch routes {
        case .showMainScreen(let user):
            return
        case .back:
            moduleVc.navigationController?.popViewController(animated: true)
        }
    }
}

enum OptionalRoutes {
    case showMainScreen(user: User)
    case back
}

