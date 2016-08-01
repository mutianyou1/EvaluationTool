//
//  MUBarChart.swift
//  EvaluationTool
//
//  Created by 潘元荣(外包) on 16/7/27.
//  Copyright © 2016年 潘元荣(外包). All rights reserved.
//

import UIKit


class MUBarChartDataItem: NSObject {
    var xTitles = [String]()
    var values = [CGFloat]()
    var yTitles = [String]()
    var maxY :CGFloat = 10
   
    var yInterval :CGFloat = 10
    var title = "abc"
    var strokeColor = UIColor(red: 46/255, green: 153/255, blue: 51/255, alpha: 1.0)
    var fillColor = UIColor(red: 46/255, green: 153/255, blue: 51/255, alpha: 1.0)
}

class MUBarChart: MUChart {
    let barChartDataItem  = MUBarChartDataItem()
    
    //计算属性
    var singleWidth :CGFloat {
        get{
         return (kwidth - 100)/(CGFloat.init(barChartDataItem.xTitles.count*2))
        }
    
    }
    
    
    
    override func stroke() {
       let layer = CAShapeLayer.init()
       UIGraphicsBeginImageContext(self.bounds.size)
       
      
       let singleWidth = (kwidth - 100)/(CGFloat.init(barChartDataItem.xTitles.count*2))
        for(var i = 1;i <= barChartDataItem.xTitles.count ; i++){
            let backView = UIView.init()
            backView.frame = CGRectMake(50 + (CGFloat.init(2 * i - 1)) * singleWidth, kChartBottomHeight, singleWidth, kheight - kChartBottomHeight - kChartBottomHeight)
            backView.backgroundColor = UIColor.lightGrayColor()
            backView.clipsToBounds = true
            self.addSubview(backView)
        }
        for(var  i = 1 ; i <= barChartDataItem.xTitles.count ;i++){
           let startPoint = CGPointMake(50 + (CGFloat.init(2 * i - 1) + 0.5) * singleWidth, kheight - kChartBottomHeight)
           let yValue = barChartDataItem.values[i-1]
           let endY = ((barChartDataItem.maxY - yValue) / (barChartDataItem.yInterval)) * (kheight - kChartBottomHeight - kChartBottomHeight)
           let subLayer = self.getSubLayer(startPoint, endY: endY + kChartBottomHeight)
           layer.addSublayer(subLayer)
        }
       
        UIGraphicsEndImageContext()
        self.layer.addSublayer(layer)
        

        
     
    }
    
    func getSubLayer(startPoint :CGPoint,endY :CGFloat) ->CAShapeLayer {
        let layer = CAShapeLayer.init()
        layer.lineWidth = self.singleWidth
        layer.strokeColor = barChartDataItem.strokeColor.CGColor
        layer.fillColor = barChartDataItem.fillColor.CGColor
        
        let path = UIBezierPath.init()
        path.lineWidth = self.singleWidth
        path.moveToPoint(startPoint)
        path.addLineToPoint(CGPointMake(startPoint.x, endY))
        path.stroke()
        path.fill()
        layer.path = path.CGPath
        
        //动画
        CATransaction.begin()
        let animation = CABasicAnimation.init(keyPath: "strokeEnd")
        animation.toValue = 1.0
        animation.fromValue = 0.0
        animation.duration = 2.0
        animation.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseInEaseOut)
        layer.addAnimation(animation, forKey: "barAnimation")
        CATransaction.commit()
        
        return layer
    
    }
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        let chartAxesData = MUChartAxesData()
        chartAxesData.isShowXDegrees = false
        chartAxesData.title = barChartDataItem.title
        chartAxesData.xTitles = barChartDataItem.xTitles
        chartAxesData.yTitles = barChartDataItem.yTitles
        chartAxesData.xTitleAlignment = NSTextAlignment.Right
        chartAxesData.targetView = self
        let charAxes = MUChartAxes.init(data: chartAxesData)
        charAxes.stroke(UIGraphicsGetCurrentContext()!)
    }


}
