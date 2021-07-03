//
//  WeekAPI.swift
//  TrainApplication
//
//  Created by  Alexandr Zakharov on 07.05.2021.
//

import Foundation
import Moya

enum FoodAPI {
    case getWeekPlan(userId: UUID)
    case getUserFood(dayId: UUID)
}

extension FoodAPI: TargetType {
    var baseURL: URL {
        return URL(string: "http://localhost:8080")!
    }
    
    var path: String {
        switch self {
        case .getWeekPlan:
            return "/get_week_plan"
        case .getUserFood:
            return "/get_user_food"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getWeekPlan, .getUserFood:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getWeekPlan(let id):
            return .requestParameters(
                parameters: ["user_id": id],
                encoding:   URLEncoding.queryString)
        case .getUserFood(let id):
            return .requestParameters(
                parameters: ["day_id": id],
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
