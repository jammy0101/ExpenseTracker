//
//  ExpenseModel.swift
//  ExpenseTracker
//
//  Created by RASHID on 22/04/2026.
//


// Model
import SwiftUI

enum Category: String, CaseIterable {
    
    case food = "Food"
    case transport = "Transport"
    case shopping = "Shopping"
    case health = "Health"
    case other = "Other"
    
    var icon: String {
        switch self {
        case .food: return "fork.knife"
        case .transport: return "car.fill"
        case .shopping: return "bag.fill"
        case .health: return "heart.fill"
        case .other: return "ellipsis.circle.fill"
        }
    }
    
    var color: Color {
        switch self {
        case .food:      return .orange
        case .transport: return .blue
        case .shopping:  return .pink
        case .health:    return .red
        case .other:     return .gray
        }
    }
}

// OUTSIDE enum
struct Expense: Identifiable {
    let id = UUID()
    var title: String
    var amount: Double
    var category: Category
}
