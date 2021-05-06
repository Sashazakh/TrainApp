//
//  LoginRouterProtocol.swift
//  TrainApplication
//
//  Created by  Alexandr Zakharov on 05.05.2021.
//

import UIKit

protocol LoginRouterProtocol {
    func open(_ routes: LoginRoutes)
}

class LoginRouter: LoginRouterProtocol {
    var moduleVc: LoginViewController!
    
    func open(_ routes: LoginRoutes) {
        switch routes {
        case .passwordScreen(let login):
            let vc = PasswordAssembly().build(login: login)
            moduleVc.navigationController?.pushViewController(vc, animated: true)
        case .register:
            let vc = RegisterAssembly().build()
            moduleVc.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

enum LoginRoutes {
    case passwordScreen(login: String)
    case register
}
