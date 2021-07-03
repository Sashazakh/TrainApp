//
//  FoodService.swift
//  TrainApplication
//
//  Created by  Alexandr Zakharov on 07.05.2021.
//

import Foundation
import Moya
import RxSwift

protocol FoodServiceProtocol {
    func getWeekPlan(userId: UUID) -> Single<WeekPlan>
    func getUserFood(dayId: UUID) -> Single<[Food]>
}

class FoodService: FoodServiceProtocol {
    private let provider = MoyaProvider<FoodAPI>()
    
    
    func getWeekPlan(userId: UUID) -> Single<WeekPlan> {
        return provider.rx
            .request(.getWeekPlan(userId: userId))
            .map(WeekPlan.self)
    }
    
    func getUserFood(dayId: UUID) -> Single<[Food]> {
        return provider.rx
            .request(.getUserFood(dayId: dayId))
            .map([Food].self)
    }
}
