//
//  GanttChartViewDataSource.swift
//  SwiftyGantt
//
//  Created by Tomosuke Okada on 2017/09/16.
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

public protocol GanttChartViewDataSource: class {
    
    // Required
    func startDate(in ganttChartView: GanttChartView) -> Date
    func lastDate(in ganttChartView: GanttChartView) -> Date
    
    func ganttChartView(_ ganttChartView: GanttChartView, numberOfRowsInSection section: Int) -> Int
    
    func ganttChartView(_ ganttChartView: GanttChartView, numberOfProcessViewsInIndexPath indexPath: IndexPath) -> Int
    func ganttChartView(_ ganttChartView: GanttChartView, chartProcessViewAtIndexPath indexPath: IndexPath, processNo: Int) -> GanttChartProcessView
    
    
    // Optional
    func numberOfSections(in ganttChartView: GanttChartView) -> Int
    
    func ganttChartView(_ ganttChartView: GanttChartView, numberOfPointViewsInSection section: Int) -> Int
    func ganttChartView(_ ganttChartView: GanttChartView, chartPointViewAtSection section: Int, pointNo: Int) -> GanttChartPointView
    
    func ganttChartView(_ ganttChartView: GanttChartView, numberOfProcessViewsInSection section: Int) -> Int
    func ganttChartView(_ ganttChartView: GanttChartView, chartProcessViewAtSection section: Int, pointNo: Int) -> GanttChartProcessView
    
    func ganttChartView(_ ganttChartView: GanttChartView, numberOfPointViewsInIndexPath indexPath: IndexPath) -> Int
    func ganttChartView(_ ganttChartView: GanttChartView, chartPointViewAtIndexPath indexPath: IndexPath, pointNo: Int) -> GanttChartPointView
    
}

extension GanttChartViewDataSource {
    
    func numberOfSections(in ganttChartView: GanttChartView) -> Int { return 1 }
    
    func ganttChartView(_ ganttChartView: GanttChartView, numberOfPointViewsInSection section: Int) -> Int { return 0 }
    func ganttChartView(_ ganttChartView: GanttChartView, chartPointViewAtSection section: Int, pointNo: Int) -> GanttChartPointView { return }
    
    func ganttChartView(_ ganttChartView: GanttChartView, numberOfProcessViewsInSection section: Int) -> Int { return 0 }
    func ganttChartView(_ ganttChartView: GanttChartView, chartProcessViewAtSection section: Int, pointNo: Int) -> GanttChartProcessView { return }
    
    func ganttChartView(_ ganttChartView: GanttChartView, numberOfPointViewsInIndexPath indexPath: IndexPath) -> Int { return 0 }
    func ganttChartView(_ ganttChartView: GanttChartView, chartPointViewAtIndexPath indexPath: IndexPath, pointNo: Int) -> GanttChartPointView { return }
    
}
