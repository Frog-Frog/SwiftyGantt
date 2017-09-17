//
//  Date+isEqual.swift
//  SwiftyGantt
//
//  Created by Tomosuke Okada on 2017/09/17.
//  Copyright © 2017年 TomosukeOkada. All rights reserved.
//

import Foundation

extension Date {
    func isEqual(_ date: Date) -> Bool {
        
        let calendar = Calendar(identifier: .gregorian)
        
        return calendar.isDate(self, inSameDayAs: date)
    }
}
