//
//  OptionalViewMOdel.swift
//  TrainApplication
//
//  Created by  Alexandr Zakharov on 06.05.2021.
//

import Foundation
import RxSwift

protocol OptionalViewModelProtocol {
    func register(with age: String?, weight: String?, height: String?)
    func backToLogin()
}

class OptionalViewModel: OptionalViewModelProtocol {
    private let bag = DisposeBag()
    
    private var router: OptionalRouterProtocol
    private var registerService: RegisterServiceProtocol
    
    var login: String!
    var password: String!
    var name: String!
    
    init(router: OptionalRouterProtocol,
         registerService: RegisterServiceProtocol) {
        self.router = router
        self.registerService = registerService
    }
    
    func register(with age: String?, weight: String?, height: String?) {
        guard let age = age,
              let weight = weight,
              let height = height else { return }
        registerService.register(login: login,
                                 password: password,
                                 name: name,
                                 age: Int(age),
                                 weight: Double(weight),
                                 height: Int(height)).subscribe(
            onSuccess: { [weak self] user in
                guard let self = self else { return }
                print(user)
            }, onError: { error in
                print(error)
            }).disposed(by: bag)
    }
    
    func backToLogin() {
        router.open(.back)
    }
}
