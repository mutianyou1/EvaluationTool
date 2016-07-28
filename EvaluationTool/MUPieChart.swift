//
//  MUPieChart.swift
//  EvaluationTool
//
//  Created by 潘元荣(外包) on 16/7/27.
//  Copyright © 2016年 潘元荣(外包). All rights reserved.
//

import UIKit

class MUPieChartDataItem: NSObject {
    var numberOfParts : Int = 3
    var piePercentArray = [CGFloat]()
    var titles = [String]()
    var strokeColor = UIColor.redColor()
    var fillColor = UIColor.blackColor()
    var title = "abc"
}
class MUPieChart: MUChart {

    let pieChartDataItem = MUPieChartDataItem()
    
    override func stroke() {
        //绘图
        let chartLayer = CAShapeLayer.init()
        self.layer.addSublayer(chartLayer)
        
        UIGraphicsBeginImageContext(self.frame.size)
        
        var startPoint = CGPointMake(self.bounds.size.width * 0.5 , kChartBottomHeight)
        var angle :CGFloat = 0.0
       // let path = UIBezierPath.init(roundedRect: CGRectMake(50, kChartBottomHeight, kwidth - 100, kwidth - 100), cornerRadius: 360/(CGFloat.init(M_PI)))
        
        for(var i = 0; i < pieChartDataItem.titles.count; i++){
           
           
            let path = UIBezierPath.init()
            let _angle = (pieChartDataItem.piePercentArray[i] * 360.0)
            angle += _angle
            let toPoint = CGPointMake(sin(angle) * (kwidth * 0.5 - 50.0),kChartBottomHeight + (kwidth * 0.5 - 50.0) - cos(angle) * (kwidth * 0.5 - 50.0))
            
            path.addArcWithCenter(CGPointMake(self.bounds.size.width * 0.5 , kheight * 0.5), radius: kwidth * 0.5 - 50.0, startAngle: angle, endAngle: angle - _angle, clockwise: true)
            print(_angle,angle)
            //path.moveToPoint(startPoint)
            //path.addLineToPoint(toPoint)
            
            startPoint = toPoint
            path.fill()
            path.stroke()
            chartLayer.path = path.CGPath
         

        }
        
        //动画
        CATransaction.begin()
        let animation = CABasicAnimation.init(keyPath: "strokeEnd")
        animation.duration = 3
        animation.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseInEaseOut)
        animation.fromValue = 0.0
        animation.toValue = 1.0
        chartLayer.addAnimation(animation, forKey: "maskAnimation")
        CATransaction.commit()
        
        UIGraphicsEndImageContext()
      
        
    }
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        let axes = MUChartAxesData()
        axes.isShowAxes = false
        axes.isShowXDegrees = false
        axes.isShowYDegrees = false
        axes.targetView = self
        axes.title = pieChartDataItem.title
        let chartAxes = MUChartAxes.init(data: axes)
        chartAxes.stroke(UIGraphicsGetCurrentContext()!)
    }


}
