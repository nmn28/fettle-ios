//
//  Date+Ext.swift
//  fettle
//
//  Created by Nicholas Nelson on 6/6/24.
//

import Foundation

extension Date {
    static var startOfDay: Date {
        Calendar.current.startOfDay(for: Date())
    }
    
    // Starts on Monday
    static var startOfWeek: Date {
        let calendar = Calendar.current
        var components = calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: Date())
        components.weekday = 2 // Monday
        
        return calendar.date(from: components)!
    }
    
    static var oneWeekAgo: Date {
        let calendar = Calendar.current
        let oneWeek = calendar.date(byAdding: .day, value: -6, to: Date())
        return calendar.startOfDay(for: oneWeek!)
    }
    
    static var oneMonthAgo: Date {
        let calendar = Calendar.current
        let oneMonth = calendar.date(byAdding: .month, value: -1, to: Date())
        return calendar.startOfDay(for: oneMonth!)
    }
    
    static var threeMonthsAgo: Date {
        let calendar = Calendar.current
        let threeMonths = calendar.date(byAdding: .month, value: -3, to: Date())
        return calendar.startOfDay(for: threeMonths!)
    }
    
    static var yearToDate: Date {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year], from: Date())
        
        return calendar.date(from: components)!
    }
    
    static var oneYearAgo: Date {
        let calendar = Calendar.current
        let oneYear = calendar.date(byAdding: .year, value: -1, to: Date())
        return calendar.startOfDay(for: oneYear!)
    }
}
