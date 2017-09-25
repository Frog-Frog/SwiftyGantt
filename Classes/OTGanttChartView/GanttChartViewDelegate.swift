//
//  GanttChartViewDelegate.swift
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

public protocol GanttChartViewDelegate: class {
    
    // Optional
    func ganttChartView(_ ganttChartView: GanttChartView, didVerticalScroll scrollView: UIScrollView)
    func ganttChartView(_ ganttChartView: GanttChartView, didHorizontalScroll scrollView: UIScrollView)
    
    // These method is only available when refleshControlEnabled is equal YES;
    func ganttChartView(_ ganttChartView: GanttChartView, scrolledPrevious scrollView: UIScrollView)
    func ganttChartView(_ ganttChartView: GanttChartView, scrolledNext scrollView: UIScrollView)
    
    func ganttChartView(_ ganttChartView: GanttChartView, backgroundColorForDate date: Date) -> UIColor
    
    func ganttChartView(_ ganttChartView: GanttChartView, tappedSection section: Int)
    func ganttChartView(_ ganttChartView: GanttChartView, tappedRowAtIndexPath indexPath: IndexPath)
    
    func ganttChartVuew(_ ganttChartView: GanttChartView, tappedProcessView processView: GanttChartProcessView, section: Int)
    func ganttChartVuew(_ ganttChartView: GanttChartView, tappedProcessView pointView: GanttChartPointView, section: Int)
    
    func ganttChartView(_ ganttChartView: GanttChartView, tappedProcessView processView: GanttChartProcessView, atIndexPath indexPath: IndexPath)
    func ganttChartView(_ ganttChartView: GanttChartView, tappedPointView pointView: GanttChartPointView, atIndexPath indexPath: IndexPath)

}

extension GanttChartViewDelegate {

    func ganttChartView(_ ganttChartView: GanttChartView, didVerticalScroll scrollView: UIScrollView) { }
    func ganttChartView(_ ganttChartView: GanttChartView, didHorizontalScroll scrollView: UIScrollView) { }
    
    func ganttChartView(_ ganttChartView: GanttChartView, scrolledPrevious scrollView: UIScrollView) { }
    func ganttChartView(_ ganttChartView: GanttChartView, scrolledNext scrollView: UIScrollView) { }
    
    func ganttChartView(_ ganttChartView: GanttChartView, backgroundColorForDate date: Date) -> UIColor { return UIColor.clear }
    
    func ganttChartView(_ ganttChartView: GanttChartView, tappedSection section: Int) { }
    func ganttChartView(_ ganttChartView: GanttChartView, tappedRowAtIndexPath indexPath: IndexPath) { }
    
    func ganttChartVuew(_ ganttChartView: GanttChartView, tappedProcessView processView: GanttChartProcessView, section: Int) {}
    func ganttChartVuew(_ ganttChartView: GanttChartView, tappedProcessView pointView: GanttChartPointView, section: Int) {}
    
    func ganttChartView(_ ganttChartView: GanttChartView, tappedProcessView processView: GanttChartProcessView, atIndexPath indexPath: IndexPath) {}
    func ganttChartView(_ ganttChartView: GanttChartView, tappedPointView pointView: GanttChartPointView, atIndexPath indexPath: IndexPath) {}
    
}
