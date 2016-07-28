//
//  ManagementViewController.swift
//  EvaluationTool
//
//  Created by mutianyou1 on 16/6/26.
//  Copyright © 2016年 潘元荣(外包). All rights reserved.
//

import UIKit

class ManagementViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        self.navigationController?.navigationBar.barTintColor = UIColor.orangeColor()
        let lineView = MULineChart(frame: self.view.bounds)
        lineView.lineDataItem.xTitles = ["周一","周二","周三","周四","周五","周六","周日"]
        lineView.lineDataItem.yValues = [23.5,23.9,24.0,25.0,23.8,26.2,23.5]
        lineView.lineDataItem.yTitles = ["02:00","01:00","24:00","23:00","22:00"]
        lineView.lineDataItem.title = "作息时间"
        lineView.lineDataItem.maxY = 26.0
        lineView.lineDataItem.yInterval = 4
//
//        lineView.lineDataItem.yValues = [15,23,22.0,35,38.5,48,40]
//        lineView.lineDataItem.yTitles = ["50","40","30","20","10","0"]
//        lineView.lineDataItem.title = "销售额（万元）"
//        lineView.lineDataItem.maxY = 50.0
//        lineView.lineDataItem.yInterval = 50
        
        lineView.stroke()
        self.view.addSubview(lineView)
        let changeChartBtn = UIButton(type: .System)
        changeChartBtn.setTitle("饼状图", forState: .Normal)
        changeChartBtn.frame = CGRectMake(kwidth - 100,100, 100, 20)
        changeChartBtn.addTarget(self, action: "changeWithPieChartView:", forControlEvents: .TouchUpInside)
        self.view.addSubview(changeChartBtn)
        
        let changeBarChartBtn = UIButton(type: .System)
        changeBarChartBtn.setTitle("柱形图", forState: .Normal)
        changeBarChartBtn.frame = CGRectMake(kwidth - 100,120, 100, 20)
        changeBarChartBtn.addTarget(self, action: "changeWithPieChartView:", forControlEvents: .TouchUpInside)
        self.view.addSubview(changeBarChartBtn)
    }
    func changeWithPieChartView(sender:UIButton){
        if(sender.titleLabel?.text?.containsString("柱") != false){
           
        }else{
            let pieView = MUPieChart()
            pieView.frame = self.view.bounds
            pieView.pieChartDataItem.piePercentArray = [0.2,0.2,0.6]
            pieView.pieChartDataItem.title = "作息时间"
            pieView.pieChartDataItem.titles = ["晚睡","早睡","一般"]
            pieView.pieChartDataItem.fillColor = UIColor.greenColor()
            pieView.pieChartDataItem.strokeColor = UIColor.greenColor()
            pieView.stroke()
            self.view.addSubview(pieView)
            
        }
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nil, bundle: nil)
        self.tabBarItem.title = "功能中心"
        self.tabBarItem.image = UIImage(named: "teskMan2")
        self.tabBarItem.selectedImage = UIImage(named: "teskMan")
        
        
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
