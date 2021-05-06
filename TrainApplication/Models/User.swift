//
//  User.swift
//  TrainApplication
//
//  Created by  Alexandr Zakharov on 05.05.2021.
//

import Foundation

struct User: Decodable {
    let id: UUID
    let login: String
    let password: String
    let name: String
    let age: Int?
    let weight: Double?
    let height: Int?
}
