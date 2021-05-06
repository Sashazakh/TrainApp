//
//  RegisterAssembly.swift
//  TrainApplication
//
//  Created by  Alexandr Zakharov on 05.05.2021.
//

import UIKit

class RegisterAssembly {
    func build() -> UIViewController {
        let vc = RegisterViewController()
        
        let registerService = RegisterService()
        let registerRouter = RegisterRouter()
        registerRouter.moduleVc = vc
        
        let viewModel = RegisterViewModel(router: registerRouter, registerService: registerService)
        vc.viewModel = viewModel
        return vc
    }
}
