//
//  AuthAPI.swift
//  TrainApplication
//
//  Created by  Alexandr Zakharov on 05.05.2021.
//

import Foundation
import Moya

enum AuthAPI {
    case isLoginExists(login: String)
    case checkPasswrod(login: String, password: String)
    case getAuthUser(id: UUID)
}

extension AuthAPI: TargetType {
    var baseURL: URL {
        return URL(string: "http://localhost:8080")!
    }
    
    var path: String {
        switch self {
        case .isLoginExists:
            return "/is_exists"
        case .checkPasswrod:
            return "/check_password"
        case .getAuthUser:
            return "/auth"
        }
    }
        var method: Moya.Method {
        switch self {
        case .isLoginExists, .checkPasswrod, .getAuthUser:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .isLoginExists(let login):
            return .requestParameters(
                parameters: ["login": login],
                encoding: URLEncoding.queryString)
        case .checkPasswrod(let login, let password):
            return .requestParameters(
                parameters: ["login": login, "password": password],
                encoding: URLEncoding.queryString)
        case .getAuthUser(let id):
            return .requestParameters(
                parameters: ["id": id],
                encoding: URLEncoding.queryString)
        default:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
    
    var sampleData: Data {
        return Data()
    }
}
