//
//  GanttChartPointView.swift
//  SwiftyGantt
//
//  Created by Tomosuke Okada on 2017/09/16.
//  Copyright © 2017年 TomosukeOkada. All rights reserved.
//

import UIKit

protocol GanttChartPointViewDelagate: class {
    func tappedGanttChartPointView(_ pointView: GanttChartPointView)
}

open class GanttChartPointView: UIView {
    
    weak var delegate: GanttChartPointViewDelagate?
    
    var indexPath: IndexPath?
    
    private(set) var date: Date
    
    open var figureType = FigureType.none
    open var isFill = true
    
    open var strokeColor = UIColor.red
    open var fillColor = UIColor.white
    
    open var figureLineWidth: CGFloat = 2
    open var figureSize: CGFloat = 12
    
    open var figureLeftMargin: CGFloat = 4
    open var figureRightMargin: CGFloat = 4
    
    open var title = ""
    open var fontSize: CGFloat = 12
    open var adjustFontSizeEnabled = false
    open var fontColor = UIColor.black
    open var titleBackgroundColor = UIColor.clear
    
    // MARK: - init
    public init(date: Date) {
        self.date = date
        super.init(frame: CGRect.zero)
        initialize()
    }
    
    
    @available(*, unavailable)
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func initialize() {
        backgroundColor = UIColor.clear
        prepareGesture()
    }
    
    
    // MARK: - Prepare
    private func prepareGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tappedChartPointView(_:)))
        addGestureRecognizer(tapGesture)
    }
    
    
    // MARK: - Draw
    override open func draw(_ rect: CGRect) {
        drawFigure(rect)
        drawTitle(rect)
    }
    
    
    private func drawFigure(_ rect: CGRect) {
        guard let path = createFigurePath(rect) else {
            return
        }
        
        GanttChartDrawingClass.draw(figurePath: path,
                                    strokeWidth: figureLineWidth,
                                    strokeColor: strokeColor,
                                    fillColor: fillColor)
    }
    
    
    private func createFigurePath(_ rect: CGRect) -> UIBezierPath? {
        let figureRect = CGRect(x: figureLeftMargin, y: (rect.height - figureSize)/2, width: figureSize, height: figureSize)
        
        switch figureType {
        case .none:
            return nil
        case .circle:
            return UIBezierPath(ovalIn: figureRect)
        case .triangle:
            return UIBezierPath(triangleIn: figureRect)
        case .diamond:
            return UIBezierPath(diamondIn: figureRect)
        case .square:
            return UIBezierPath(rect: figureRect)
        }
    }
    
    
    private func drawTitle(_ rect: CGRect) {
        let startTextX = figureType == .none ? 0 : figureLeftMargin + figureSize + figureRightMargin
        let titleWidth = rect.size.width - startTextX
        let titleHeight = title.size(attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: fontSize)]).height
        let startTextY = frame.size.height/2 - titleHeight/2
        
        let trimmingTitle = title.trimmingCharacters(in: NSCharacterSet.newlines)
        
        GanttChartDrawingClass.draw(trimmingTitle,
                                    rect: CGRect.init(x: startTextX, y: startTextY, width: titleWidth, height: titleHeight),
                                    font: UIFont.systemFont(ofSize: fontSize),
                                    fontColor: fontColor,
                                    backgroundColor: titleBackgroundColor,
                                    textAlignment: .left,
                                    lineBreakMode: .byClipping,
                                    isAdjustFontSize: adjustFontSizeEnabled)
    }
    
    
    // MARK: - Gesture
    @objc private func tappedChartPointView(_ gesture: UITapGestureRecognizer) {
        delegate?.tappedGanttChartPointView(self)
    }
}
