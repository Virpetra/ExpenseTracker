//
//  RecentTransactionList.swift
//  ExpenseTracker
//
//  Created by Mehmet Said Dede on 22.02.2024.
//

import SwiftUI

struct RecentTransactionList: View {
    @EnvironmentObject var transactionListVM: TransactionListViewModel
    
    var body: some View {
        VStack {
            HStack {
                //MARK: Header Title
                Text("Recent Transactions")
                    .bold()
                
                Spacer()
                
                //MARK: Header Link
                NavigationLink {
                    
                }label: {
                    HStack(spacing: 4) {
                        Text("See All")
                        Image(systemName: "chevron.right")
                    }
                    .foregroundColor(Color.customtText)
                }
            }
            .padding(.top)
        }
        .padding()
        .background(Color.systemBackground)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: Color.primary.opacity(0.2), radius: 10, x: 0, y: 5)
    }
}

#Preview {
    RecentTransactionList()
}
