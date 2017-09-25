//
//  GanttChartData.swift
//  SwiftyGantt
//
//  Created by Tomosuke Okada on 2017/09/17.
//  Copyright © 2017年 TomosukeOkada. All rights reserved.
//

import Foundation

class GanttChartData {
    static let sharedInstance = GanttChartData()
    
    var showDateArray = Array<Date>()
    
    var allSectionProcessHeightArray = Array<CGFloat>()
    var allSectionPointHeightArray = Array<CGFloat>()
    
    var allSectionProcessViewArray = Array<Array<GanttChartProcessView>>()
    var allSectionPointViewArray = Array<Array<GanttChartPointView>>()
    
    var allRowProcessHeightArray = Array<Array<CGFloat>>()
    var allRowPointHeightArray = Array<Array<CGFloat>>()
    
    var allRowProcessViewArray = Array<Array<Array<GanttChartProcessView>>>()
    var allRowPointViewArray = Array<Array<Array<GanttChartPointView>>>()
}
