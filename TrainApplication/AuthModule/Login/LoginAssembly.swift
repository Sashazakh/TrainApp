//
//  LoginViewControllerBuild.swift
//  TrainApplication
//
//  Created by  Alexandr Zakharov on 05.05.2021.
//

import UIKit

class LoginAssembly {
    func build() -> UIViewController {
        let vc = LoginViewController()
        
        let authService = AuthService()
        let loginRouter = LoginRouter()
        loginRouter.moduleVc = vc
        
        let viewModel = LoginViewModel(router: loginRouter, authService: authService)
        vc.viewModel = viewModel
        return vc
    }
}

