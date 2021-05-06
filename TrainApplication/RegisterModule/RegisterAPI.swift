//
//  RegisterAPI.swift
//  TrainApplication
//
//  Created by  Alexandr Zakharov on 05.05.2021.
//

import Foundation

import Moya

enum RegisterAPI {
    case register(login: String, password: String, name: String, age: Int?, weight: Double?, height: Int?)
}

extension RegisterAPI: TargetType {
    var baseURL: URL {
        return URL(string: "http://localhost:8080")!
    }
    
    var path: String {
        switch self {
        case .register:
            return "register"
        }
    }
        var method: Moya.Method {
        switch self {
        case .register:
            return .post
        }
    }
    
    var task: Task {
        switch self {
        case .register(let login,
                       let password,
                       let name,
                       let age,
                       let weight,
                       let height):
            return .requestParameters(
                parameters: ["login": login,
                             "password": password,
                             "name": name,
                             "age": age,
                             "weight": weight,
                             "height": height],
                encoding: JSONEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
    
    var sampleData: Data {
        return Data()
    }
}
