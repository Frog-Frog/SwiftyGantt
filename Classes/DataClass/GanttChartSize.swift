//
//  GanttChartSize.swift
//  SwiftyGantt
//
//  Created by Tomosuke Okada on 2017/09/16.
//  Copyright © 2017年 TomosukeOkada. All rights reserved.
//

import Foundation

public class GanttChartSize {
    
    static let sharedInstance = GanttChartSize()
    
    var showDateAreaHeight: CGFloat = 66
    var dateWidth: CGFloat = 0
    var dateSeparatorWidth: CGFloat = 0
    var dateFontSize: CGFloat = 0
    var chartBorderWidth: CGFloat = 0
    var rowSeparatorWidth: CGFloat = 0
    var dotSeparatorWidth: CGFloat = 0
    var todayLineWidth: CGFloat = 0
    var todayFigureSize: CGFloat = 0
    
    var processAreaTopMargin: CGFloat = 0
    var processAreaUnderMargin: CGFloat = 0
    var pointAreaTopMargin: CGFloat = 0
    var pointAreaUnderMargin: CGFloat = 0
    
    
    var processViewHeight: CGFloat = 0
    var pointViewHeight: CGFloat = 0
    
    var minimumSectionProcessAreaHeight: CGFloat = 0
    var minimumSectionPointAreaHeight: CGFloat = 0
    
    var minimumRowProcessAreaHeight: CGFloat = 0
    var minimumRowPointAreaHeight: CGFloat = 0
    
    var minimumProcessViewWidthDays = 1
    var minimumPointViewWidthDays = 1
    
}
