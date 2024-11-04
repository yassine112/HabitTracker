//
//  HabitManager.swift
//  Expense Tracker
//
//  Created by Yassine on 18/10/2024.
//

import Foundation
import SwiftData

class HabitManager {
    let context: ModelContext
    
    init(context: ModelContext) {
        self.context = context
    }
    
    func upsertHabit(_ habit: Habit) {
            // Try to fetch an existing entity with the same ID
            let fetchDescriptor = FetchDescriptor<HabitEntity>(
                predicate: #Predicate { $0.id == habit.id }
            )
            
            if let existingEntity = try? context.fetch(fetchDescriptor).first {
                // Update the existing entity
                existingEntity.update(from: habit)
            } else {
                // Insert a new entity
                let newEntity = habit.toEntity()
                context.insert(newEntity)
            }

            saveContext()
        }
    
    func loadHabits() -> [Habit] {
        let fetchDescriptor = FetchDescriptor<HabitEntity>()
        let entities = (try? context.fetch(fetchDescriptor)) ?? []
        return entities.map { Habit.from(entity: $0) }
    }
    
    func removeHabit(_ habit: Habit) {
        let fetchDescriptor = FetchDescriptor<HabitEntity>(
            predicate: #Predicate { $0.id == habit.id }
        )
        if let entity = try? context.fetch(fetchDescriptor).first {
            context.delete(entity)
            saveContext()
        }
    }
    
    private func saveContext() {
        do {
            try context.save()
        } catch {
            print("Failed to save context: \(error)")
        }
    }
}
