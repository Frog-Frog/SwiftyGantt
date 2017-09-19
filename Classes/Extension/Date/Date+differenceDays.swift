//
//  Date+differenceDays.swift
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
    /**
     Create New Date from the month of the instantiated Date. That is argument days before(-) or after(+).
     
     @param days nagative value(-) -> before, positive value(+) -> after
     @return created Date
     */
    func difference(days: Int) -> Date? {
        
        let calendar = Calendar(identifier: .gregorian)
        
        var components = calendar.dateComponents([.year, .month, .day, .weekday], from: self)
        
        guard let currentDay = components.day else {
            return nil
        }
        
        components.day = currentDay + days
        
        return calendar.date(from: components)
    }
}
