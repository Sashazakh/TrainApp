//
//  MealPlan.swift
//  TrainApplication
//
//  Created by  Alexandr Zakharov on 07.05.2021.
//

import Foundation

struct WeekPlan: Decodable {
    let id: UUID
    let userId: UUID
    let monday: UUID?
    let tuesday: UUID?
    let wednesday: UUID?
    let thusday: UUID?
    let friday: UUID?
    let saturday: UUID?
    let sunday: UUID?
    
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case userId = "user_id"
        case monday = "monday_id"
        case tuesday = "tuesday_id"
        case wednesday = "wednesday_id"
        case thusday = "thusday_id"
        case friday = "friday_id"
        case saturday = "saturday_id"
        case sunday = "sunday_id"
    }
}
