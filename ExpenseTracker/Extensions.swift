//
//  Extensions.swift
//  ExpenseTracker
//
//  Created by Mehmet Said Dede on 22.02.2024.
//

import Foundation
import SwiftUI

extension Color {
    
    static let customBackground = Color("Background")
    static let customIcon = Color("Icon")
    static let customtText = Color("Text")
    static let systemBackground = Color(uiColor: .systemBackground)
}

extension DateFormatter {
    static let allNumericUSA: DateFormatter = {
        print("Initializing DateFormatter")
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        
        return formatter
    }()
}


extension String {
    func dateParsed() -> Date {
        guard let parsedDate = DateFormatter.allNumericUSA.date(from: self) else { return Date() }
        
        return parsedDate
    }
}
