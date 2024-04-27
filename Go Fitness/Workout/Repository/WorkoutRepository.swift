//
//  WorkoutRepository.swift
//  Go Fitness
//
//  Created by Otabek Tuychiev on 24/01/2023.
//

import SQLite

final class WorkoutRepository {    
    private let db: Connection
    private let table: Table
    
    //Columns
    private let id = Expression<Int64>("id")
    private let title = Expression<String>("title")
    
    static func dropTable(in db: Connection) throws {
        try db.execute("DROP TABLE '\(WorkoutModel.tableName)'")
        print("Dropped Table: \(WorkoutRepository.self)")
    }
    
    init(db: Connection) throws {
        self.db = db
        self.table = Table(WorkoutModel.tableName)
        try setup()
    }
    
    //MARK: - Private
    
    private func setup() throws {
        try db.run(table.create(ifNotExists: true) { table in
            table.column(id, primaryKey: true)
            table.column(title)
        })
        print("CREATE TABLE (if it didn't exist): \(WorkoutModel.tableName)")
    }
    
    //MARK: - Public
    
    func insert(model: WorkoutModel) throws -> WorkoutModel {
        let insert = table.insert(title <- model.title)
        let rowID = try db.run(insert)
        
        return WorkoutModel(id: Int(rowID), title: model.title)
    }
    
    func list() -> [WorkoutModel] {
        do {
            return try db.prepare(table).map { workout in
                return WorkoutModel(id: Int(workout[id]), title: workout[title])
            }
        } catch {
            print("\(self): Couldn't get list of workout from database.")
            return []
        }
    }
    
    
}
