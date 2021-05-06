//
//  LoginViewModel.swift
//  TrainApplication
//
//  Created by  Alexandr Zakharov on 05.05.2021.
//

import Foundation
import RxSwift

protocol LoginViewModelProtocol {
    func login(with login: String?)
    func userNotRegistered()
}

class LoginViewModel: LoginViewModelProtocol {
    private let bag = DisposeBag()
    
    private var router: LoginRouterProtocol
    private var authService: AuthServiceProtocol
    
    init(router: LoginRouterProtocol,
         authService: AuthServiceProtocol) {
        self.router = router
        self.authService = authService
    }
    
    func login(with login: String?) {
        guard let login = login else { return }
        authService.checkExists(login: login)
            .subscribe(onCompleted: { [weak self] in
                guard let self = self else { return }
                self.router.open(.passwordScreen(login: login))
            }, onError: { error in
                print(error)
        }).disposed(by: bag)
    }
    
    func userNotRegistered() {
        router.open(.register)
    }
}
