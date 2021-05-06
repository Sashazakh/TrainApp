//
//  RegisterService.swift
//  TrainApplication
//
//  Created by  Alexandr Zakharov on 05.05.2021.
//

import Foundation
import RxSwift
import Moya

protocol RegisterServiceProtocol {
    func register(login: String, password: String, name: String, age: Int?, weight: Double?, height: Int?) -> Single<User>
}

class RegisterService: RegisterServiceProtocol {
    private let provider = MoyaProvider<RegisterAPI>()    

    func register(login: String,
                  password: String,
                  name: String,
                  age: Int?,
                  weight: Double?,
                  height: Int?) -> Single<User> {
        return provider.rx
            .request(.register(login: login,
                               password: password,
                               name: name,
                               age: age,
                               weight: weight,
                               height: height))
            .filterSuccessfulStatusAndRedirectCodes()
            .map(User.self)
    }
}
