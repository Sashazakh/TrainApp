//
//  FoodViewModel.swift
//  TrainApplication
//
//  Created by  Alexandr Zakharov on 07.05.2021.
//

import UIKit
import RxSwift
import RxCocoa

enum DayOfTheWeeks: Int, CaseIterable {
    case monday = 0, tuesday, wednesday, thusday, friday, saturday, sunday
    
    var info: String {
        switch self {
        case .monday:
            return "Monday"
        case .tuesday:
            return "Tuesday"
        case .wednesday:
            return "Wednesday"
        case .thusday:
            return "Thusday"
        case .friday:
            return "Friday"
        case .saturday:
            return "Saturday"
        case .sunday:
            return "Sunday"
        }
    }
}

protocol FoodViewModelProtocol {
    func moduleDidLoad()
    func selectedDay(day: DayOfTheWeeks)
}

class FoodViewModel: FoodViewModelProtocol {
    private let userId: UUID
    private let foodService: FoodServiceProtocol
    private let bag = DisposeBag()
    private var weekPlan: WeekPlan?
    private let router: FoodRouterProtocol
    
    init(userId: UUID,
         foodService: FoodServiceProtocol,
         router: FoodRouterProtocol) {
        self.userId = userId
        self.foodService = foodService
        self.router = router
    }
    
    func moduleDidLoad() {
        foodService.getWeekPlan(userId: userId).subscribe(onSuccess: { [weak self] weekPlan in
            guard let self = self else { return }
            self.weekPlan = weekPlan
            print(weekPlan)
        }, onError: { error in
            print(error)
        }).disposed(by: bag)
    }
    
    func selectedDay(day: DayOfTheWeeks) {
        switch day {
        case .monday:
            router.open(.showDay(userId: self.userId, dayId: weekPlan?.monday, title: day.info))
        case .tuesday:
            router.open(.showDay(userId: self.userId, dayId: weekPlan?.tuesday, title: day.info))
        default:
            return
        }
    }
}
