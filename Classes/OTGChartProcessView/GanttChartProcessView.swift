//
//  GanttChartProcessView.swift
//  SwiftyGantt
//
//  Created by Tomosuke Okada on 2017/09/16.
//  Copyright © 2017年 TomosukeOkada. All rights reserved.
//

import UIKit

protocol GanttChartProcessViewDelegate: class {
    func tappedChartProcessView(_ chartProcessView: GanttChartProcessView)
}

open class GanttChartProcessView: UIView {
    
    weak var delegate: GanttChartProcessViewDelegate?
    
    var indexPath: IndexPath?
    var processNo: Int?
    
    var dateArray = Array<Date>()
    let showDateArray = GanttChartData.sharedInstance.showDateArray
    
    let sizes = GanttChartSize.sharedInstance
    
    var titleLabel = UILabel(frame: CGRect.zero)
    
    open var title = ""
    open var titleTrackingEnabled = false
    open var fontSize: CGFloat = 12
    open var adjustFontSizeEnabled = false
    open var fontColor = UIColor.black
    open var titleBackgroundColor = UIColor.clear
    
    open var figureType = FigureType.none
    open var figureLineWidth: CGFloat = 2
    open var figureSize: CGFloat = 12
    
    open var figureLeftMargin: CGFloat = 4
    open var figureRightMargin: CGFloat = 4
    
    open var isFill = false
    open var strokeColor = UIColor.red
    open var fillColor = UIColor.white
    
    open var lineWidth: CGFloat = 4
    
    open var isDotLine = false
    open var dotLineWidth: CGFloat = 1
    open var dotBlankWidth: CGFloat = 8
    open var dotSolidLineWidth: CGFloat = 8
    
    open var startRatio: CGFloat = 0 {
        didSet {
            if startRatio < 0 || 1 < startRatio {
                startRatio = 0
            }
        }
    }
    
    open var finishRatio: CGFloat = 1 {
        didSet {
            if finishRatio < 0 || 1 < finishRatio {
                finishRatio = 1
            }
        }
    }
    
    
    // MARK: - init
    init(dateArray: Array<Date>) {
        super.init(frame: CGRect.zero)
        self.dateArray = dateArray
    }
    
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    
    @available(*, unavailable)
    public required init?(coder aDecoder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
    }
    
    
    func initialize() {
        prepareGesture()
    }
    
    
    func prepareGesture() {
        let gesture = UITapGestureRecognizer.init(target: self, action: #selector(tappedProcessView(_:)))
        addGestureRecognizer(gesture)
    }
    
    
    // MARK: - LifeCycle
    open override func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)
        
        if titleTrackingEnabled && !title.isEmpty {
            putTitleLabel()
        }
    }
    
    
    func putTitleLabel() {
        let titleStartX = calculateTitleStartX()
        let titleStartY = frame.size.height/2 + lineWidth/2
        
        let isContainFirstDate = dateArray.first?.isContain(from: showDateArray.first, to: showDateArray.last) ?? false
        let isContainLastDate = dateArray.last?.isContain(from: showDateArray.first, to: showDateArray.last) ?? false
        
        let firstDate = isContainFirstDate ? dateArray.first : showDateArray.first
        let lastDate = isContainLastDate ? dateArray.last : showDateArray.last
        
        var daysCount = firstDate?.daysCount(to: lastDate, isCountSelf: true) ?? 0
        
        daysCount = sizes.minimumProcessViewWidthDays > daysCount ? sizes.minimumProcessViewWidthDays : daysCount
        
        let maxTitleWidth = CGFloat(daysCount) * sizes.dateWidth - titleStartX
        
        let titleSize = title.size(attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: fontSize)])
        
        let textWidth = titleSize.width > maxTitleWidth ? maxTitleWidth : titleSize.width
        
        titleLabel.frame = CGRect.init(x: titleStartX, y: titleStartY, width: textWidth, height: titleSize.height)
        titleLabel.text = title
        titleLabel.lineBreakMode = .byTruncatingTail
        titleLabel.textAlignment = .left
        titleLabel.font = UIFont.systemFont(ofSize: fontSize)
        titleLabel.textColor = fontColor
        titleLabel.backgroundColor = titleBackgroundColor
        titleLabel.adjustsFontSizeToFitWidth = adjustFontSizeEnabled
        
        addSubview(titleLabel)
    }
    
    
    func calculateTitleStartX() -> CGFloat {
        let isContain = dateArray.first?.isContain(from: showDateArray.first, to: showDateArray.last) ?? false
    
        if isContain {
            if figureType == .none {
                return figureLeftMargin + figureSize + figureRightMargin
            } else {
                let dateWidth = GanttChartSize.sharedInstance.dateWidth
                
                return dateWidth * startRatio
            }
        } else {
           return 0
        }
    }
    
    
    // MARK: - draw
    override open func draw(_ rect: CGRect) {
        super.draw(rect)
        drawProcessLine(rect)
        drawFigure(rect)
        if !titleTrackingEnabled {
            drawTitle(rect)
        }
    }
    
    
    func drawProcessLine(_ rect: CGRect) {
        
        let firstDateIndex = GanttChartCommonClass.foundSameDateIndex(from: showDateArray, date: dateArray.first) ?? 0
        let lastDateIndex = GanttChartCommonClass.foundSameDateIndex(from: showDateArray, date: dateArray.last) ?? showDateArray.count - 1
        
        for i in firstDateIndex...lastDateIndex {
            var startX = sizes.dateWidth * CGFloat(i)
            var finishX = sizes.dateWidth
            
            if i == firstDateIndex {
                startX = figureType == .none ? sizes.dateWidth * startRatio : figureLeftMargin + figureSize/2
            }
            
            if i == lastDateIndex {
                finishX = figureType == .none ? sizes.dateWidth * finishRatio : finishX
            }
            
            let sameIndex = GanttChartCommonClass.foundSameDateIndex(from: dateArray, date: showDateArray[i])
            if sameIndex == nil && isDotLine {
                let dotLinePath = UIBezierPath()
                dotLinePath.lineWidth = dotLineWidth
                strokeColor.setStroke()
                
                let lineTopY = rect.size.height/2 - lineWidth/2 + dotLineWidth/2
                dotLinePath.move(to: CGPoint(x: startX, y: lineTopY))
                dotLinePath .addLine(to: CGPoint(x: finishX, y: lineTopY))
                
                let lineBottomY = rect.size.height/2 + lineWidth/2 - dotLineWidth/2
                dotLinePath.move(to: CGPoint(x: startX, y: lineBottomY))
                dotLinePath.addLine(to: CGPoint(x: finishX, y: lineBottomY))
                
                let dashPattern = [dotSolidLineWidth,dotBlankWidth]
                dotLinePath.setLineDash(dashPattern, count: 2, phase: 0)
                
                dotLinePath.stroke()
            } else {
                let linePath = UIBezierPath()
                linePath.lineWidth = lineWidth
                strokeColor.setStroke()
                
                linePath.move(to: CGPoint(x: startX, y: rect.size.height/2))
                linePath.addLine(to: CGPoint(x: finishX, y: rect.size.height/2))
                
                linePath.stroke()
            }
        }
    }
    
    
    func drawFigure(_ rect: CGRect) {
        let figureRect = CGRect.init(x: figureLeftMargin, y: (rect.size.height - figureSize)/2, width: figureSize, height: figureSize)
        switch figureType {
        case .circle:
            GanttChartDrawingClasse.draw(circleIn: figureRect,
                                         strokeWidth: figureLineWidth,
                                         strokeColor: strokeColor,
                                         fillColor: fillColor)
        case .triange:
            GanttChartDrawingClasse.draw(circleIn: figureRect,
                                         strokeWidth: figureLineWidth,
                                         strokeColor: strokeColor,
                                         fillColor: fillColor)
        case.square:
            GanttChartDrawingClasse.draw(squareIn: figureRect,
                                         strokeWidth: figureLineWidth,
                                         strokeColor: strokeColor,
                                         fillColor: fillColor)
        case.diamond:
            GanttChartDrawingClasse.draw(diamondIn: figureRect,
                                         strokeWidth: figureLineWidth, strokeColor: strokeColor,
                                         fillColor: fillColor)
        default:
            return
        }
    }

    
    func drawTitle(_ rect: CGRect) {
        let titleStartX = calculateTitleStartX()
        let titleStartY = rect.size.height/2 + lineWidth/2
        let titleWidth = rect.size.width - titleStartX
        let titleHeight = rect.size.height - titleStartY
        
        let trimmingTitle = title.trimmingCharacters(in: NSCharacterSet.newlines)
        
        GanttChartDrawingClasse.draw(trimmingTitle,
                                     rect: CGRect.init(x: titleStartX, y: titleStartY, width: titleWidth, height: titleHeight),
                                     font: UIFont.systemFont(ofSize: fontSize),
                                     fontColor: fontColor,
                                     backgroundColor: titleBackgroundColor,
                                     textAlignment: .left,
                                     lineBreakMode: .byTruncatingTail,
                                     isAdjustFontSize: adjustFontSizeEnabled)
    }
    
    
    // MARK: - Gesture
    func tappedProcessView(_ gesture: UITapGestureRecognizer) {
        delegate?.tappedChartProcessView(self)
    }
    
    // MARK: - Tracking
    func trackingTitleLabel(_ x: CGFloat) {
        if !titleTrackingEnabled || !subviews.contains(titleLabel) {
            return
        }
        
        let titleStartX = frame.origin.x + calculateTitleStartX()
        
        let isContainFirstDate = dateArray.first?.isContain(from: showDateArray.first, to: showDateArray.last) ?? false
        let isContainLastDate = dateArray.last?.isContain(from: showDateArray.first, to: showDateArray.last) ?? false
        
        let firstDate = (isContainFirstDate) ? dateArray.first : showDateArray.first
        let lastDate = (isContainLastDate) ? dateArray.last : showDateArray.last
        
        let processLineLength = CGFloat(firstDate?.daysCount(to: lastDate, isCountSelf: true) ?? 0) * sizes.dateWidth
        let lineEndPoint = frame.origin.x + lineWidth
        
        if titleStartX < x && x < lineEndPoint {
            if titleLabel.frame.size.width > processLineLength {
                return;
            }
            
            var newX = x - frame.origin.x
            newX = newX + titleLabel.frame.size.width > processLineLength ? processLineLength - titleLabel.frame.size.width : newX
            
            titleLabel.frame.origin.x = newX
        } else if titleStartX > x {
            titleLabel.frame.origin.x = calculateTitleStartX()
        } else if lineEndPoint < x {
            
            if titleLabel.frame.size.width > processLineLength {
                return;
            }
            
            titleLabel.frame.origin.x = processLineLength - titleLabel.frame.size.width
        }
    }
}
