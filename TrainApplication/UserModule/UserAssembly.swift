//
//  UserAssembly.swift
//  TrainApplication
//
//  Created by  Alexandr Zakharov on 06.05.2021.
//

import UIKit

class UserAssembly {
    func build(userId: UUID) -> UIViewController {
        let vc = UserViewController()
        
        let authService = AuthService()
        let userService = UserService()
        
        let viewModel = UserViewModel(userId: userId,
                                      authService: authService,
                                      userService: userService)
        
        vc.viewModel = viewModel
        return vc
    }
}
