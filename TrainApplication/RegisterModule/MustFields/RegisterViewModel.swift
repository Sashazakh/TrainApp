//
//  RegisterViewModel.swift
//  TrainApplication
//
//  Created by  Alexandr Zakharov on 05.05.2021.
//

import Foundation
import RxSwift

protocol RegisterViewModelProtocol {
    func register(with login: String?, password: String?, name: String?)
    func backToLogin()
}

class RegisterViewModel: RegisterViewModelProtocol {
    private let bag = DisposeBag()
    
    private var router: RegisterRouterProtocol
    private var registerService: RegisterServiceProtocol
    
    init(router: RegisterRouterProtocol,
         registerService: RegisterServiceProtocol) {
        self.router = router
        self.registerService = registerService
    }
    
    func register(with login: String?, password: String?, name: String?) {
        guard let login = login,
              let password = password,
              let name = name else { return }
        router.open(.showOptionalScreen(login: login, password: password, name: name))
    }
    
    func backToLogin() {
        router.open(.login)
    }
}
