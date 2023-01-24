//
//  WorkoutViewModel.swift
//  Go Fitness
//
//  Created by Otabek Tuychiev on 24/01/2023.
//

import Foundation

struct WorkoutModel {
    static let tableName = "workout"
    let id: Int?
    let title: String
    
    init(id: Int? = nil, title: String) {
        self.id = id
        self.title = title
    }
}
