//
//  WorkoutDispatcher.swift
//  Go Fitness
//
//  Created by Otabek Tuychiev on 24/01/2023.
//

struct WorkoutDispatcher {
    private let workoutRepository: WorkoutRepository
    
    init() throws {
        guard let databaseManager = DatabaseManager.default else {
            throw WorkoutDispatcherError.couldNotGetDatabaseManagerInstance
        }
        
        guard let workoutRepository = try? WorkoutRepository(db: databaseManager.db) else {
            throw WorkoutDispatcherError.couldNotGetWorkoutRepositoryInstance
        }
        self.workoutRepository = workoutRepository
    }
    
    // Create a single workout model
    func create(request: CreateWorkoutRequest) throws -> CreateWorkoutResponse {
        let model = WorkoutModel(title: request.title)
        let persistedModel = try workoutRepository.insert(model: model)
        
        return CreateWorkoutResponse(workout: persistedModel)
    }
    
    // Get list of all workout models
    func list(request: ListWorkoutRequest) -> ListWorkoutResponse {
        let list = workoutRepository.list()
        return ListWorkoutResponse(list: list)
    }
    
}


extension WorkoutDispatcher {
    enum WorkoutDispatcherError: Error {
        case couldNotGetDatabaseManagerInstance
        case couldNotGetWorkoutRepositoryInstance
    }
}
