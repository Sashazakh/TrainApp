//
//  PasswordRouter.swift
//  TrainApplication
//
//  Created by  Alexandr Zakharov on 05.05.2021.
//

import UIKit

protocol PasswordRouterProtocol {
    func open(_ routes: PasswordRoutes)
}

class PasswordRouter: PasswordRouterProtocol {
    var moduleVc: PasswordViewController!
    
    func open(_ routes: PasswordRoutes) {
        switch routes {
        case .mainApp(let user):
            let vc = TabBarAssemble().build(userId: user.id)
            guard let sceneDelegate = moduleVc.view.window?.windowScene?.delegate as? SceneDelegate else {
                        return
                    }
            sceneDelegate.setRootViewController(viewController: vc)
        }
    }
}

enum PasswordRoutes {
    case mainApp(user: User)
}
