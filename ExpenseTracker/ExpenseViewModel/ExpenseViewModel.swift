//
//  ExpenseViewModel.swift
//  ExpenseTracker
//
//  Created by RASHID on 22/04/2026.
//

import Foundation
import SwiftUI
import Combine


//just like GetxController business logic
class ExpenseViewModel: ObservableObject {
    @Published var expense: [Expense] = [
        Expense(title: "Lunch", amount: 850, category: .food),
        Expense(title: "Uber", amount: 320, category: .transport)
    ]
    
    var total: Double {
        expense.reduce(0) { $0 + $1.amount}
    }
    
    
    func add(title: String , amount: Double, category: Category) {
        expense.insert(Expense(title: title, amount: amount, category: category), at: 0)
    }
    
    func delete(at offsets: IndexSet){
        expense.remove(atOffsets: offsets)
    }
}
