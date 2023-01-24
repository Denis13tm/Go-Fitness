//
//  DatabaseManager.swift
//  Go Fitness
//
//  Created by Otabek Tuychiev on 24/01/2023.
//

import SQLite
import Foundation

final class DatabaseManager {
    let db: Connection
    
    static let `default` = try? DatabaseManager()
    
    let workoutRepository: WorkoutRepository
    
    init() throws {
        guard let path = FileManager
            .default
            .urls(for: .documentDirectory, in: .userDomainMask)
            .first
        else {
            throw DatabaseError.couldNotFindPathToCreateDatabaseFileIn
        }
        
        db = try Connection(("\(path)db.sqlite3"))
        
        //To dropping all tables
        try WorkoutRepository.dropTable(in: db)
        
        //To create all tables
        workoutRepository = try WorkoutRepository(db: db)
        
    }
    
}

extension DatabaseManager {
    enum DatabaseError: Error {
        case couldNotFindPathToCreateDatabaseFileIn
    }
}
