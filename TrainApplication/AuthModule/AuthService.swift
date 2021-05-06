//
//  AuthService.swift
//  TrainApplication
//
//  Created by  Alexandr Zakharov on 05.05.2021.
//

import Foundation
import RxSwift
import Moya

protocol AuthServiceProtocol {
    func checkExists(login: String) -> Completable
    func checkPassword(login: String, password: String) -> Single<User>
    func getAuthUser(userId: UUID) -> Single<User>
}

class AuthService: AuthServiceProtocol {
    private let provider = MoyaProvider<AuthAPI>()
    
    func checkExists(login: String) -> Completable {
        return provider.rx
            .request(.isLoginExists(login: login))
            .filterSuccessfulStatusAndRedirectCodes()
            .asObservable().ignoreElements()
    }
    
    func checkPassword(login: String, password: String) -> Single<User> {
        return provider.rx
            .request(.checkPasswrod(login: login, password: password))
            .filterSuccessfulStatusAndRedirectCodes()
            .map(User.self)
    }
    
    func getAuthUser(userId: UUID) -> Single<User> {
        return provider.rx
            .request(.getAuthUser(id: userId))
            .map(User.self)
    }
}
