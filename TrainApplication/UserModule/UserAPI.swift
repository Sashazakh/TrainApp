//
//  UserAPI.swift
//  TrainApplication
//
//  Created by  Alexandr Zakharov on 06.05.2021.
//

import Foundation
import Moya

enum UserAPI {
    case updateName(id: UUID, name: String)
    case updateLogin(id: UUID, login: String)
    case updateAge(id: UUID, age: Int)
}

extension UserAPI: TargetType {
    var baseURL: URL {
        return URL(string: "http://localhost:8080")!
    }
    
    var path: String {
        switch self {
        case .updateName:
            return "/update_name"
        case .updateLogin:
            return "/update_login"
        case .updateAge:
            return "/update_age"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .updateName, .updateLogin:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .updateName(let id, let name):
            return .requestParameters(
                parameters: ["id": id,
                             "new_name": name],
                encoding:   URLEncoding.queryString)
        case .updateLogin(let id, let login):
            return .requestParameters(
                parameters: ["id": id,
                             "new_login": login],
                encoding:   URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
    
    var sampleData: Data {
        return Data()
    }
}
