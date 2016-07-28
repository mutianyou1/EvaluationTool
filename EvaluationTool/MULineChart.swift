//
//  MULineChart.swift
//  EvaluationTool
//
//  Created by 潘元荣(外包) on 16/7/26.
//  Copyright © 2016年 潘元荣(外包). All rights reserved.
//

import UIKit

let kChartBottomHeight :CGFloat = 200
class MULineChartDataItem: NSObject {
    
    var lineColor = UIColor.greenColor()
    var axesColor = UIColor.lightGrayColor()
    
    //var maxX :CGFloat = 1.9
    var maxY :CGFloat = 10
    var xInterval :CGFloat = 10
    var yInterval :CGFloat = 10
    
    var title : String = "abc"
    var xTitles = [String]()
    var yTitles = [String]()
    var yValues = [NSObject]()
    
    
    
    
    
    
    
}
class MULineChart: MUChart {
    var lineDataItem = MULineChartDataItem.init()
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func stroke() {
       // lineDataItem.xTitles = ["周一","周二","周三","周四","周五","周六","周日"]
       // lineDataItem.yTitles = [10,29,40,35,42,23,48]
       // lineDataItem.maxY = 50
        //lineDataItem.yInterval = 5
        let xCount = CGFloat.init(integerLiteral: lineDataItem.xTitles.count)
        let minx = (kwidth - 100)/xCount
        //绘图
        let chartLayer: CAShapeLayer = CAShapeLayer()
        chartLayer.lineCap = kCALineCapRound
        chartLayer.lineJoin = kCALineJoinRound
        chartLayer.fillColor = UIColor.whiteColor().CGColor
        chartLayer.strokeColor = self.lineDataItem.lineColor.CGColor
        chartLayer.lineWidth = 2.0
        chartLayer.strokeStart = 0.0
        chartLayer.strokeEnd = 1.0
        self.layer.addSublayer(chartLayer)

        //画线段
         UIGraphicsBeginImageContext(self.bounds.size)
        let path = UIBezierPath.init()
        for(var i = 1 ;i <= lineDataItem.xTitles.count;i++){
            
            let yValue  = CGFloat.init(lineDataItem.yValues[i-1] as! Float)
            let yPoint =  ((lineDataItem.maxY - yValue)/(lineDataItem.yInterval)) * (kheight - kChartBottomHeight - kChartBottomHeight)
            let point = CGPointMake(minx * CGFloat.init(i) + 50,yPoint + kChartBottomHeight )
            if (i == 1 ){
               path.moveToPoint(point)
            }else{
               path.addLineToPoint(point)
            }
        }
        path.stroke()
        chartLayer.path = path.CGPath
        
        //动画
        CATransaction.begin()
        let pathAnimation = CABasicAnimation.init(keyPath: "strokeEnd")
        pathAnimation.duration = 3.0
        pathAnimation.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseInEaseOut)
        pathAnimation.fromValue = 0.0
        pathAnimation.toValue = 1.0
        chartLayer.addAnimation(pathAnimation, forKey: "strokeEndAnimation")
        CATransaction.commit()
        UIGraphicsEndImageContext()
        
        
        
        
        
        
        
        
    }

    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
       super.drawRect(rect)
       let data = MUChartAxesData()
        data.yTitles = lineDataItem.yTitles
        data.xTitles = lineDataItem.xTitles
        data.title =  lineDataItem.title
        data.targetView = self
        let axes = MUChartAxes.init(data: data)
        axes.stroke(UIGraphicsGetCurrentContext()!)
    }


}
