//
//  PasswordViewModel.swift
//  TrainApplication
//
//  Created by  Alexandr Zakharov on 05.05.2021.
//

import Foundation
import RxSwift

protocol PasswordViewModelProtocol {
    func checkPassword(with password: String?)
}

class PasswordViewModel: PasswordViewModelProtocol {
    private let bag = DisposeBag()
    
    private var router: PasswordRouterProtocol
    private var authService: AuthServiceProtocol
    
    private let userLogin: String
    
    init(router: PasswordRouterProtocol,
         authService: AuthServiceProtocol,
         userLogin: String) {
        self.router = router
        self.authService = authService
        self.userLogin = userLogin
    }
    
    func checkPassword(with password: String?) {
        guard let password = password else { return }
        authService.checkPassword(login: userLogin, password: password)
            .subscribe(onSuccess: { [weak self] user in
                guard let self = self else { return }
                UserDefaults.standard.setValue(true, forKey: "isAuth")
                let uustring = user.id.uuidString
                UserDefaults.standard.setValue(uustring, forKey: "userId")
                self.router.open(.mainApp(user: user))
            }, onError: { error in
                print(error)
            }
            ).disposed(by: bag)
    }
}
