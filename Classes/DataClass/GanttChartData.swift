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
    
    private var showDateArray = Array<Date>()
    
    private var allSectionProcessViewArray = Array<Array<GanttChartProcessView>>()
    private var allSectionPointViewArray = Array<Array<GanttChartPointView>>()
    private var allSectionProcessHeightArray = Array<CGFloat>()
    private var allSectionPointHeightArray = Array<CGFloat>()
    
    private var allRowProcessViewArray = Array<Array<Array<GanttChartProcessView>>>()
    private var allRowPointViewArray = Array<Array<Array<GanttChartPointView>>>()
    private var allRowProcessHeightArray = Array<Array<CGFloat>>()
    private var allRowPointHeightArray = Array<Array<CGFloat>>()
    
}
