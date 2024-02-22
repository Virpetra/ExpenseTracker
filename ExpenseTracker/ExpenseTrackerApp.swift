//
//  ExpenseTrackerApp.swift
//  ExpenseTracker
//
//  Created by Mehmet Said Dede on 22.02.2024.
//

import SwiftUI

@main
struct ExpenseTrackerApp: App {
   @StateObject var transactionListVM = TransactionListViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(transactionListVM)
        }
    }
}
