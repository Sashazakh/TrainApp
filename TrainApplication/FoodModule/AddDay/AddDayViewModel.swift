//
//  AddDayViewModel.swift
//  TrainApplication
//
//  Created by  Alexandr Zakharov on 09.05.2021.
//

import Foundation
import RxSwift
import RxCocoa


protocol AddDayViewModelProtocol {
    func moduleDidLoad()
}

class AddDayViewModel: AddDayViewModelProtocol {
    private let userId: UUID
    private let foodService: FoodServiceProtocol
    private let bag = DisposeBag()
    private var weekPlan: WeekPlan?
    private let dayId: UUID?
    
    init(userId: UUID,
         foodService: FoodServiceProtocol,
         dayId: UUID?) {
        self.userId = userId
        self.foodService = foodService
        self.dayId = dayId
    }
    
    func moduleDidLoad() {
    }
}
