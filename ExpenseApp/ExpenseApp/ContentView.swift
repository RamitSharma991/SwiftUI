//
//  ContentView.swift
//  ExpenseApp
//
//  Created by Ramit sharma on 05/11/19.
//  Copyright © 2019 Ramit sharma. All rights reserved.
//

import SwiftUI

struct ExpenseItem: Identifiable, Codable {
    let id = UUID()
    let name: String
    let type: String
    let amount: Int
}
class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]() {
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "items")
            }
        }
    }
    
    init() {
        if let items = UserDefaults.standard.data(forKey: "items") {
            let decoder = JSONDecoder()
            
            if let decoded = try? decoder.decode([ExpenseItem].self, from: items) {
                self.items = decoded
                return
            
            }
        }
        
        self.items = []
    }
}


struct ContentView: View {
    
    @ObservedObject var expenses = Expenses()
    @State private var showAddExpense = false

    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items) {
                    item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }
                        Spacer()
                        
                        Text("$\(item.amount)")
                    }
                }
            .onDelete(perform: removeItems)
            }
            .navigationBarTitle("iExpense").navigationBarItems(trailing: Button(action: {
                self.showAddExpense = true
//                let expense = ExpenseItem(name: "Test", type: "Personal", amount: 5)
//                self.expenses.items.append(expense)
            }){
                Image(systemName: "plus")
            })
                .sheet(isPresented: $showAddExpense) {
                    AddExpense(expenses: self.expenses)
            }
            
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
