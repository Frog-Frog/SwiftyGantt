//
//  GanttChartCommonClass.swift
//  SwiftyGantt
//
//  Created by Tomosuke Okada on 2017/09/16.
//  Copyright © 2017年 TomosukeOkada. All rights reserved.
//

import Foundation

class GanttChartCommonClass {
    
    class func foundSameDateIndex(from array: Array<Date>, date: Date?) -> Int? {
        guard let date = date else {
            return nil
        }
        
        let sortedArray = array.sorted(by: { $0 < $1 })
        return sortedArray.index(of: date)
    }
    
    
    class func isShowingProcess(from processStart: Date,to processLast: Date) -> Bool {
        let showDateArray = GanttChartData.sharedInstance.showDateArray
        
        guard let start = showDateArray.first else {
            return false
        }
        
        guard let last = showDateArray.last else {
            return false
        }
        
        let isContainStartDate = processStart.isContain(from: start, to: last)
        let isContainLastDate = processLast.isContain(from: start, to: last)
        
        if isContainStartDate || isContainLastDate {
            return true
        }
        
        if processStart < start &&  last < processLast {
            return true
        }
        
        return false
    }

}
