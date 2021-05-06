//
//  UserService.swift
//  TrainApplication
//
//  Created by  Alexandr Zakharov on 06.05.2021.
//

import Foundation
import Moya
import RxSwift

protocol UserServiceProtocol {
    func updateName(id: UUID, name: String) -> Single<User>
    func updateLogin(id: UUID, login: String) -> Single<User>
}

class UserService: UserServiceProtocol {
    private let provider = MoyaProvider<UserAPI>()

    
    func updateName(id: UUID, name: String) -> Single<User> {
        return provider.rx
            .request(.updateName(id: id, name: name))
            .map(User.self)
    }
    
    func updateLogin(id: UUID, login: String) -> Single<User> {
        return provider.rx
            .request(.updateLogin(id: id, login: login))
            .map(User.self)
    }
}

