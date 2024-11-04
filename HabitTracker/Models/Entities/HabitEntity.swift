//
//  HabitEntity.swift
//  Expense Tracker
//
//  Created by Yassine on 18/10/2024.
//

import SwiftData
import Foundation


@Model
class HabitEntity {
    // MARK: - Properties
    var id: UUID // SwiftData treats 'id' as the primary key if declared
    var name: String
    var habitDescription: String? // Renamed to avoid conflict with 'description'
    var startDate: Date
    var frequency: String // Store Frequency enum as a raw string
    var reminderTime: Date?
    var isCompletedToday: Bool
    var totalCompletions: Int
    var streak: Int
    var lastCompletionDate: Date?
    var completionDates: [Date] // New property to log completion dates

    // MARK: - Initializer
    init(
        id: UUID = UUID(),
        name: String,
        habitDescription: String? = nil,
        startDate: Date = Date(),
        frequency: String,
        reminderTime: Date? = nil,
        isCompletedToday: Bool = false,
        totalCompletions: Int = 0,
        streak: Int = 0,
        lastCompletionDate: Date? = nil,
        completionDates: [Date] = []) {
            self.id = id
            self.name = name
            self.habitDescription = habitDescription
            self.startDate = startDate
            self.frequency = frequency
            self.reminderTime = reminderTime
            self.isCompletedToday = isCompletedToday
            self.totalCompletions = totalCompletions
            self.streak = streak
            self.lastCompletionDate = lastCompletionDate
            self.completionDates = completionDates
        }
}

extension HabitEntity {
    func update(from habit: Habit) {
        self.name = habit.name
        self.habitDescription = habit.description
        self.startDate = habit.startDate
        self.frequency = habit.frequency.rawValue
        self.reminderTime = habit.reminderTime
        self.isCompletedToday = habit.isCompletedToday
        self.totalCompletions = habit.totalCompletions
        self.streak = habit.streak
        self.lastCompletionDate = habit.lastCompletionDate
        self.completionDates = Array(habit.completionDates)
    }
}
