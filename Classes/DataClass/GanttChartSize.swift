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
    
    var dateAreaHeight: CGFloat = 60
    
    var dateWidth: CGFloat = 66
    var dateSeparatorWidth: CGFloat = 1
    var dateFontSize: CGFloat = 0
    var chartBorderWidth: CGFloat = 2
    
    var rowSeparatorWidth: CGFloat = 1
    var dotSeparatorWidth: CGFloat = 0
    
    var todayLineWidth: CGFloat = 2
    var todayFigureSize: CGSize = CGSize(width: 8, height: 8)
    
    var processAreaTopMargin: CGFloat = 0
    var processAreaUnderMargin: CGFloat = 0
    var pointAreaTopMargin: CGFloat = 0
    var pointAreaUnderMargin: CGFloat = 0
    
    var processViewHeight: CGFloat = 40
    var pointViewHeight: CGFloat = 40
    
    var minimumSectionProcessAreaHeight: CGFloat = 0
    var minimumSectionPointAreaHeight: CGFloat = 0
    
    var minimumRowProcessAreaHeight: CGFloat = 40
    var minimumRowPointAreaHeight: CGFloat = 0
    
    var minimumProcessViewWidthDays = 1
    var minimumPointViewWidthDays = 1
}
