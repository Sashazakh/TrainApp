//
//  OptionalAssembly.swift
//  TrainApplication
//
//  Created by  Alexandr Zakharov on 06.05.2021.
//

import UIKit

class OptionalAssembly {
    func build(login: String, password: String, name: String) -> UIViewController {
        let vc = OptionalViewController()
        
        let registerService = RegisterService()
        let optionalRouter = OptionalRouter()
        optionalRouter.moduleVc = vc
        
        let viewModel = OptionalViewModel(router: optionalRouter, registerService: registerService)
        viewModel.login = login
        viewModel.password = password
        viewModel.name = name
    
        vc.viewModel = viewModel
        return vc
    }
}
