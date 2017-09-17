//
//  Date+isContain.swift
//  SwiftyGantt
//
//  Created by Tomosuke Okada on 2017/09/17.
//  Copyright © 2017年 TomosukeOkada. All rights reserved.
//

import Foundation

extension Date {
    func isContain(from firstDate:Date, to lastDate:Date) -> Bool{
        
        let adjustSelf = self.adjustedZeroClock()
        let adjustFirstDate = firstDate.adjustedZeroClock()
        let adjustLastDate = lastDate.adjustedZeroClock()
        
        if adjustFirstDate <= adjustSelf && adjustSelf <= adjustLastDate {
            return true
        }
        
        return false
    }
}
