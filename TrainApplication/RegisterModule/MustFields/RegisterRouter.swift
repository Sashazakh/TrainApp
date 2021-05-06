//
//  RegisterRouter.swift
//  TrainApplication
//
//  Created by  Alexandr Zakharov on 05.05.2021.
//

import UIKit

protocol RegisterRouterProtocol {
    func open(_ routes: RegisterRoutes)
}

class RegisterRouter: RegisterRouterProtocol {
    var moduleVc: RegisterViewController!
    
    func open(_ routes: RegisterRoutes) {
        switch routes {
        case .showOptionalScreen(let login, let password, let name):
            let vc = OptionalAssembly().build(login: login,
                                              password: password,
                                              name: name)
            moduleVc.navigationController?.pushViewController(vc, animated: true)
        case .login:
            moduleVc.navigationController?.popViewController(animated: true)
        }
    }
}

enum RegisterRoutes {
    case showOptionalScreen(login: String, password: String, name: String)
    case login
}
