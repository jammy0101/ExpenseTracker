//
//  AddExpenseView.swift
//  ExpenseTracker
//
//  Created by RASHID on 22/04/2026.
//

import SwiftUI
import Combine

struct AddExpenseView: View {
    @ObservedObject var vm: ExpenseViewModel
    @Environment(\.dismiss) var dismiss
    @State private var title = ""
    @State private var amountText = ""
    @State private var category = Category.food
    
    
    var amount: Double { Double(amountText) ?? 0}
    var isValid: Bool { !title.isEmpty && amount > 0 }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Details") {
                    TextField("Title", text: $title)
                    TextField("Amount (Rs)",text: $amountText)
                        .keyboardType(.decimalPad)
                }
                Section("Category"){
                    Picker("Category",selection: $category) {
                        ForEach(Category.allCases, id: \.self) { c in
                            Label(c.rawValue,systemImage: c.icon).tag(c)
                        }
                    }
                }
            }
            .navigationTitle("Add Expense")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading)  {Button("Cancel") {dismiss()}}
                ToolbarItem(placement: .topBarTrailing) {
                                   Button("Add") { vm.add(title: title, amount: amount, category: category); dismiss() }
                                   .disabled(!isValid).fontWeight(.semibold)
                               }
            }
        }
    }
}

#Preview {
    AddExpenseView(vm: ExpenseViewModel())
}
