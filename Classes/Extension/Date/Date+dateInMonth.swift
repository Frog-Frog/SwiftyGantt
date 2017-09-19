//
//  Date+dateInMonth.swift
//  SwiftyGantt
//
//  Created by Tomosuke Okada on 2017/09/17.
//  Copyright © 2017年 TomosukeOkada. All rights reserved.
//
//  https://github.com/PKPK-Carnage/SwiftyGantt

/**
 [SwiftyGantt]
 
 Copyright (c) [2017] [Tomosuke Okada]
 
 This software is released under the MIT License.
 http://opensource.org/licenses/mit-license.ph
 */

import Foundation

extension Date {
    func firstDateInMonth() -> Date? {
        
        let calendar = Calendar(identifier: .gregorian)
        
        var components = calendar.dateComponents([.year, .month, .day, .weekday], from: self)
        
        components.day = 1;
        
        return calendar.date(from: components)
    }
    
    
    func lastDateInMonth() -> Date? {
        let calendar = Calendar(identifier: .gregorian)
        
        let date = self.firstDateInMonth()
        
        guard let firstDate = date else {
            return nil
        }
        
        let add = DateComponents(month: 1, day: -1)
        
        return calendar.date(byAdding: add, to: firstDate)
    }
}
