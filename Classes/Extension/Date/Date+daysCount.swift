//
//  Date+daysCount.swift
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
    func daysCount(to date:Date?, isCountSelf: Bool) -> Int {
        
        guard let date = date else {
            return 0
        }
        
        let calendar = Calendar(identifier: .gregorian)
        
        let components = calendar.dateComponents([.day], from: self, to: date)
        
        let daysCount = components.day ?? 0
        
        return isCountSelf ? daysCount + 1 : daysCount
    }
}
