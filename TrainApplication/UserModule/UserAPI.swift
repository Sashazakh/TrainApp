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
    case updateWeight(id: UUID, weight: Double)
    case updateHeight(id: UUID, height: Int)
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
        case .updateWeight:
            return "/update_weight"
        case .updateHeight:
            return "/update_height"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .updateName, .updateLogin, .updateAge, .updateWeight, .updateHeight:
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
        case .updateAge(let id, let age):
            return .requestParameters(
                parameters: ["id": id,
                             "new_age": age],
                encoding:   URLEncoding.queryString)
        case .updateWeight(let id, let weight):
            return .requestParameters(
                parameters: ["id": id,
                             "new_weight": weight],
                encoding:   URLEncoding.queryString)
        case .updateHeight(let id, let height):
            return .requestParameters(
                parameters: ["id": id,
                             "new_height": height],
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
