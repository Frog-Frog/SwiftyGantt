//
//  DateView.swift
//  SwiftyGantt
//
//  Created by Tomosuke Okada on 2017/09/16.
//  Copyright © 2017年 TomosukeOkada. All rights reserved.
//

import UIKit

class DateView: UIView {

    let colors = GanttChartColor.sharedInstance
    let sizes = GanttChartSize.sharedInstance
    
    // MARK: - Initialize
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }
    
    private func initialize() {
        backgroundColor = colors.dateAreaBackgroundColor
    }
    
    // MARK: - Draw
    override func draw(_ rect: CGRect) {
        drawDateString(rect)
        drawSeparator(rect)
        drawBorder(rect)
        
        GanttChartDrawingClass.drawDateSeparator(in: self, rect: rect, lineWidth: sizes.dateSeparatorWidth, color: colors.dateSeparatorColor)
    }
    
    private func drawDateString(_ rect: CGRect) {
        let showDateArray = GanttChartData.sharedInstance.showDateArray
        
        for (index, element) in showDateArray.enumerated() {
            var fontColor = colors.dateTextColor
            
            if element.isEqual(Date()) {
                let todayRect = CGRect(x: CGFloat(index) * sizes.dateWidth, y: 0, width: sizes.dateWidth, height: rect.size.height)
                let squarePath = UIBezierPath(rect: todayRect)
                colors.todayHiligtedBackgroundColor.setFill()
                squarePath.fill()
                fontColor = colors.todayHiligtedDateTextColor
            }
            
            var dateString = element.generateString(format: "dd")
            if dateString[dateString.startIndex] == "0" {
                dateString = dateString.substring(from: dateString.index(after: dateString.startIndex))
            }
            
            GanttChartDrawingClass.draw(dateString,
                                        rect: CGRect.init(x: CGFloat(index) * sizes.dateWidth,
                                                          y: rect.height/4 - sizes.dateFontSize/2,
                                                          width: sizes.dateWidth,
                                                          height: rect.height/2),
                                        font: UIFont.systemFont(ofSize: sizes.dateFontSize),
                                        fontColor: fontColor,
                                        backgroundColor: UIColor.clear,
                                        textAlignment: .center,
                                        lineBreakMode: .byClipping,
                                        isAdjustFontSize: true)
            
            let weekString = element.generateWeekString()
            
            GanttChartDrawingClass.draw(weekString,
                                        rect: CGRect.init(x: CGFloat(index) * sizes.dateWidth,
                                                          y: rect.height/4 * 3 - sizes.dateFontSize/2,
                                                          width: sizes.dateWidth,
                                                          height: rect.height/2),
                                        font: UIFont.systemFont(ofSize: sizes.dateFontSize),
                                        fontColor: fontColor,
                                        backgroundColor: UIColor.clear,
                                        textAlignment: .center,
                                        lineBreakMode: .byClipping,
                                        isAdjustFontSize: true)
        }
    }
    
    
    private func drawSeparator(_ rect: CGRect) {
        let linePath = UIBezierPath()
        linePath.lineWidth = sizes.dateSeparatorWidth
        colors.dateSeparatorColor.setStroke()
        
        let centerStartPoint = CGPoint(x: 0, y: rect.height/2)
        linePath.move(to: centerStartPoint)
        
        let centerEndPoint = CGPoint(x: rect.width, y: rect.height/2)
        linePath.addLine(to: centerEndPoint)
        
        linePath.stroke()
    }
    
    
    private func drawBorder(_ rect: CGRect) {
        let borderPath = UIBezierPath()
        borderPath.lineWidth = sizes.chartBorderWidth
        colors.chartBorderColor.setStroke()
        
        let underStartPoint = CGPoint(x: 0, y: rect.height - sizes.chartBorderWidth/2)
        borderPath.move(to: underStartPoint)
        
        let underEndPoint = CGPoint(x: rect.width, y: rect.height - sizes.chartBorderWidth/2)
        borderPath.addLine(to: underEndPoint)
        
        borderPath.stroke()
    }
}
