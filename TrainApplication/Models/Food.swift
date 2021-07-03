//
//  Food.swift
//  TrainApplication
//
//  Created by  Alexandr Zakharov on 09.05.2021.
//

import Foundation

struct Food: Decodable {
    let id: UUID
    let name: String
    let callories: Int
    let time: Double
}
