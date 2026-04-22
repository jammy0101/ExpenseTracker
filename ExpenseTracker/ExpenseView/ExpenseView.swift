//
//  ExpenseView.swift
//  ExpenseTracker
//
//  Created by RASHID on 22/04/2026.
//

import SwiftUI

struct ExpenseView: View {
    @StateObject var vm = ExpenseViewModel()
    @State private var showAdd =  false
    var body: some View {
        
        NavigationStack {
            VStack(spacing: 0) {
                VStack(spacing: 4) {
                    Text("Total Spent")
                        .font(.headline)
                        .foregroundColor(.white.opacity(0.75))
                    Text("Rs \(Int(vm.total))")
                        .font(.system(size: 44,weight: .bold)).foregroundColor(.white)
                }
                .frame(maxWidth: .infinity).padding(32)
                .background(LinearGradient(colors: [.orange , .blue],
                                           startPoint: .topLeading, endPoint: .bottomTrailing))
                
                List {
                    ForEach(vm.expense) { exp in
                        HStack(spacing: 14,) {
                            Image(systemName: exp.category.icon)
                                .foregroundColor(exp.category.color)
                                .frame(width: 36,height: 36)
                                .background(exp.category.color.opacity(0.12))
                                .cornerRadius(10)
                            
                            VStack(alignment: .leading,spacing: 2) {
                                Text(exp.title).font(.headline)
                                Text(exp.category.rawValue).font(.caption).foregroundColor(.gray)
                            }
                            Spacer()
                            Text("Rs \(Int(exp.amount))").font(.headline)
                        }
                        .padding(.vertical, 4)
                    }
                    .onDelete(perform: vm.delete)
                }
            }
            .navigationTitle("Expenses")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showAdd = true
                    }label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showAdd) {
                AddExpenseView(vm: vm)
            }
        }
    }
}

#Preview {
    ExpenseView()
}
