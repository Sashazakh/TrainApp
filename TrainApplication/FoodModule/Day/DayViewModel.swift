//
//  DayViewModel.swift
//  TrainApplication
//
//  Created by  Alexandr Zakharov on 08.05.2021.
//

import Foundation

import UIKit
import RxSwift
import RxCocoa


protocol DayViewModelProtocol {
    func moduleDidLoad()
    func addDayTap()
    var foods: Observable<[Food]> { get }
}

class DayViewModel: DayViewModelProtocol {
    private let userId: UUID
    private let foodService: FoodServiceProtocol
    private let bag = DisposeBag()
    private var weekPlan: WeekPlan?
    private let dayId: UUID?
    private let foodsSubject = PublishSubject<[Food]>()
    private let router: DayRouterProtocol
    
    var foods: Observable<[Food]> { foodsSubject.asObservable() }
    
    
    init(userId: UUID,
         foodService: FoodServiceProtocol,
         dayId: UUID?,
         router: DayRouterProtocol) {
        self.userId = userId
        self.foodService = foodService
        self.dayId = dayId
        self.router = router
    }
    
    func moduleDidLoad() {
        guard let dayId = dayId else { return }
        foodService.getUserFood(dayId: dayId).subscribe(onSuccess: { [weak self] foods in
            guard let self = self else { return }
            self.foodsSubject.onNext(foods)
        }, onError: { error in
            print(error)
        }).disposed(by: bag)
    }
    
    func addDayTap() {
        router.open(.addDay(userId: userId, dayId: dayId))
    }
}
