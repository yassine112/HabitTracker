//
//  Habit.swift
//  Expense Tracker
//
//  Created by Yassine on 18/10/2024.
//

import Foundation

import Foundation

struct Habit: Identifiable, Codable {
    // MARK: - Properties
    let id: UUID                 // Unique identifier for the habit
    var name: String             // Name of the habit (e.g., "Morning Run")
    var description: String?     // Optional description of the habit
    var startDate: Date          // Date when the habit was started
    var frequency: Frequency     // How often the habit should occur (e.g., daily, weekly)
    var reminderTime: Date?      // Optional reminder time for the habit
    var isCompletedToday: Bool   // Tracks if the habit is completed for today
    var totalCompletions: Int    // Total number of times the habit was completed
    var streak: Int              // Current streak (consecutive completions)
    var lastCompletionDate: Date? // Date when the habit was last completed
    var completionDates: Set<Date> = []  // New property to log completion dates
    
    // MARK: - Methods
    
    // Map from HabitEntity to Habit struct
    static func from(entity: HabitEntity) -> Habit {
        .init(id: entity.id,
              name: entity.name,
              description: entity.habitDescription,
              startDate: entity.startDate,
              frequency: Frequency(rawValue: entity.frequency) ?? .daily,
              reminderTime: entity.reminderTime,
              isCompletedToday: entity.isCompletedToday,
              totalCompletions: entity.totalCompletions,
              streak: entity.streak,
              lastCompletionDate: entity.lastCompletionDate,
              completionDates: Set(entity.completionDates) // Convert array to Set<Date>
        )
    }
    
    // Map from Habit struct to HabitEntity storage model
    func toEntity() -> HabitEntity {
        let entity = HabitEntity(
            id: id,
            name: name,
            habitDescription: description,
            startDate: startDate,
            frequency: frequency.rawValue,
            reminderTime: reminderTime,
            isCompletedToday: isCompletedToday,
            totalCompletions: totalCompletions,
            streak: streak,
            lastCompletionDate: lastCompletionDate
        )
        entity.completionDates = Array(completionDates) // Convert Set<Date> to array for storage
        return entity
    }
    
    // Mark the habit as completed
    mutating func markAsCompleted() {
        let today = Calendar.current.startOfDay(for: Date())
        
        if lastCompletionDate != today {
            totalCompletions += 1
            streak += (isSameDay(as: lastCompletionDate) ? 1 : 0)
            lastCompletionDate = today
            isCompletedToday = true
            
            // Log the completion date
            completionDates.insert(today)
        }
    }
    
    // Reset the completion status for a new day
    mutating func resetForNewDay() {
        isCompletedToday = false
    }
    
    // Helper to compare dates without time components
    private func isSameDay(as date: Date?) -> Bool {
        guard let date = date else { return false }
        return Calendar.current.isDateInToday(date)
    }
}

// MARK: - Frequency Enum
enum Frequency: String, Codable, CaseIterable {
    case daily, weekly, monthly
}
