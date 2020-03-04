//
//  Expense.swift
//  Report-SwiftUI
//
//  Created by Sinbad on 3/3/20.
//  Copyright © 2020 Sinbad. All rights reserved.
//

import Foundation

struct Expense {
    var month: String = ""
    var budget: Float = 0.0
    var consumed: Float = 0.0
    var percentConsumed: Float = 0.0
    private static let months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
    
    static func getRandom() -> [Expense]{
        months.map { month in
            let budget = Float.random(in: 2000...30000)
            let consumed = Float.random(in: 2000...budget)
            let percenConsumed = consumed / budget
            return Expense(month: month, budget: budget, consumed: consumed, percentConsumed: percenConsumed)
        }
    }
}
