//
//  Date+daysCount.swift
//  SwiftyGantt
//
//  Created by Tomosuke Okada on 2017/09/17.
//  Copyright © 2017年 TomosukeOkada. All rights reserved.
//

import Foundation

extension Date {
    func daysCount(to date:Date, isCountSelf: Bool) -> Int {
        
        let calendar = Calendar(identifier: .gregorian)
        
        let components = calendar.dateComponents([.day], from: self, to: date)
        
        let daysCount = components.day ?? 0
        
        return isCountSelf ? daysCount + 1 : daysCount
    }
}
