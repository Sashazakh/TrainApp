//
//  UserViewModel.swift
//  TrainApplication
//
//  Created by  Alexandr Zakharov on 06.05.2021.
//

import UIKit
import RxSwift
import RxCocoa

protocol UserViewModelProtocol {
    func moduleDidLoad()
    func updateValue(with type: UpdateType, value: String)
    var userData: Observable<User> { get }
}

class UserViewModel: UserViewModelProtocol {
    private let userId: UUID
    private let authService: AuthServiceProtocol
    private let userService: UserServiceProtocol
    private let userDataSibject = PublishSubject<User>()
    
    var userData: Observable<User> { userDataSibject.asObservable() }
    
    private let bag = DisposeBag()
    
    init(userId: UUID,
         authService: AuthServiceProtocol,
         userService: UserServiceProtocol) {
        self.userId = userId
        self.authService = authService
        self.userService = userService
    }
    
    func moduleDidLoad() {
        authService.getAuthUser(userId: userId).subscribe(onSuccess: { [weak self] user in
            guard let self = self else { return }
            self.userDataSibject.onNext(user)
        }, onError: { error in
            print(error)
        }).disposed(by: bag)
    }
    
    func updateValue(with type: UpdateType, value: String) {
        switch type {
        case .updateName:
            userService.updateName(id: userId, name: value).subscribe(onSuccess: { [weak self] user in
                guard let self = self else { return }
                self.userDataSibject.onNext(user)
            }, onError: { error in
                print("error")
            }
            ).disposed(by: bag)
        case .updateLogin:
            userService.updateLogin(id: userId, login: value).subscribe(onSuccess: { [weak self] user in
                guard let self = self else { return }
                self.userDataSibject.onNext(user)
            }, onError: { error in
                print("error")
            }
            ).disposed(by: bag)
        }
    }
}
