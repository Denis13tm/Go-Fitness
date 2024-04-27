//
//  MockDataManager.swift
//  Go Fitness
//
//  Created by Otabek Tuychiev on 25/01/2023.
//

struct MockDataManager {
    static func createWorkouts(amount: Int = 5) {
        guard let dbManager = DatabaseManager.default else {
            return
        }
        
        for number in 1...amount {
            let model = WorkoutModel(title: "\(number) = Otabek Tuychiev")
            guard ((try? dbManager.workoutRepository.insert(model: model)) != nil) else {
                print("CCCCCC")
                return
            }
        }
        
    }
}
