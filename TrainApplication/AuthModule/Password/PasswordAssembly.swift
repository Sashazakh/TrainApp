//
//  PasswordAssembly.swift
//  TrainApplication
//
//  Created by  Alexandr Zakharov on 05.05.2021.
//

import UIKit

class PasswordAssembly {
    func build(login: String) -> UIViewController {
        let vc = PasswordViewController()
        
        let authService = AuthService()
        let passwordRouter = PasswordRouter()
        passwordRouter.moduleVc = vc
        
        let viewModel = PasswordViewModel(router: passwordRouter, authService: authService, userLogin: login)
        vc.viewModel = viewModel
        return vc
    }
}
