//
//  ViewController.swift
//  EvaluationTool
//
//  Created by 潘元荣(外包) on 16/6/24.
//  Copyright © 2016年 潘元荣(外包). All rights reserved.
//(https://github.com/kevinzhow/PNChart/) 绘图demo

import UIKit

let kwidth = UIScreen.mainScreen().bounds.size.width
let kheight = UIScreen.mainScreen().bounds.size.height
let kRESOLUTIONW : CGFloat = kwidth / 375.0
let kRESOLUTIONH : CGFloat = kheight / 667.0
let identifier = "logCell"
class ViewController: UIViewController {
    private let app = UIApplication.sharedApplication().delegate as! AppDelegate
    lazy var logContentTF = UITextField(frame: CGRectMake(20, 80, kwidth - 40, 40))
    lazy var restTimeTF = UITextField(frame: CGRectMake(20, 200, kwidth - 40, 40))
    private let tableView = UITableView.init(frame: CGRectMake(0, 280, kwidth, kheight-280), style: .Plain)
    private lazy var logArray = [PersonLogData]()
    private lazy var  dateFormatter : NSDateFormatter = {
       let formatter = NSDateFormatter()
        formatter.dateFormat = "YYYY-MM-dd HH:mm"
       return formatter
    }()
    
    init(sting :String){
                super.init(nibName: nil, bundle: nil)
                self.tabBarItem.selectedImage = UIImage(named: "person2")
                self.tabBarItem.image = UIImage(named: "person1")
                self.tabBarItem.title = "个人日志"
                self.tabBarController?.tabBarItem.badgeValue = "4"
        
    }
    required init?(coder aDecoder: NSCoder) {
       fatalError("not init")
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.view.backgroundColor = UIColor.whiteColor()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.barTintColor = UIColor.orangeColor()
        self.navigationController?.presentViewController(LoginViewController(), animated: false, completion: nil)
        self.view.backgroundColor = UIColor.whiteColor()
        self.logContentTF.delegate = self
        self.restTimeTF.delegate = self
        logContentTF.borderStyle = .RoundedRect
        restTimeTF.borderStyle = .RoundedRect
        let btn = UIButton(type: .ContactAdd)
        btn.addTarget(self, action: "clickAddLog", forControlEvents: .TouchUpInside)
        btn.frame = CGRectMake(0, 0, 20, 20)
        let item = UIBarButtonItem.init(customView: btn)
        self.navigationItem.rightBarButtonItems = [item]
        
        tableView.separatorStyle = .None
        tableView.registerClass(LogTableViewCell.self, forCellReuseIdentifier: identifier)
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
        self.view.addSubview(logContentTF)
        self.view.addSubview(restTimeTF)
        let result = app.searchData()
        for log  in result {
            let item = log as! PersonLog as PersonLog!
             print(item.logContent)
             print(item.logTime)
             let logData = PersonLogData()
            logData.logContent = item.logContent
            logData.logTime = item.logTime
            logData.logTitle = item.logTitle
            if logData.logTitle.isEmpty {
               logData.logTitle = "title"
            }
            if logData.logTime.isEmpty {
               logData.logTime = "2016-06-27 09:00"
            }
            logArray.append(logData)
        }
    }
    
    @objc
    private func clickAddLog() {
      print("addLog")
       let string = "23"
        let intd = Int.init(string)
        print( intd)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController:UITextFieldDelegate{
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        let loga = PersonLogData()
        let date = NSDate(timeIntervalSinceNow: NSTimeInterval.init(0.0))
        let index = textField.text?.startIndex
        
        if textField == logContentTF {
            loga.logContent = textField.text!
            if textField.text?.characters.count < 5 {
              return true
            }
            loga.logTitle = (textField.text?.substringToIndex((index?.advancedBy(5))!))!
            
            loga.logTime = dateFormatter.stringFromDate(date)
            //let dateString = dateFormatter.stringFromDate(date)
            //字符串截取
            //let range = Range(start: dateString.startIndex.advancedBy(11), end: dateString.endIndex)
            //loga.restTime = dateFormatter.stringFromDate(date).substringWithRange(range)
            let max :UInt32 = 26
            let min :UInt32 = 23
            var hour = arc4random_uniform(max - min) + min
            let mine = arc4random() % 60
            if hour == 25 {
                hour -= 24
            }
            var rest = String.init(stringInterpolationSegment: hour)
            rest.appendContentsOf(":")
            if mine < 10 {
              rest.appendContentsOf("0")
            }
            rest.appendContentsOf(String.init(stringInterpolationSegment: mine))
            loga.restTime = rest
            print(loga.restTime)
            print(loga.logTitle)
            print(loga.logTime)
            print(loga.logContent)
            app.savePersonalLog(loga)
        }else{
            let log = PersonLogData()
            log.logTitle = textField.text!
            print(dateFormatter.stringFromDate(date))
            
        }
        return true
    }
}

extension ViewController :UITableViewDataSource,UITableViewDelegate{

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return logArray.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(identifier, forIndexPath: indexPath) as! LogTableViewCell
        if cell.isKindOfClass(NSNull.self) {
           cell = LogTableViewCell(frame: CGRectZero)
        }
        let log = logArray[indexPath.row] 
        cell.setPersonLogData(log)
        return cell
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        var height :CGFloat = 0.0
        let log = logArray[indexPath.row]
        let heightModel = MUHeightForCell.init()
        height += heightModel.heightForCellWithString(log.logTitle, type: ViewType.titleLable)
        height += heightModel.heightForCellWithString(log.logContent, type: ViewType.contentLabel)
        height += 20
        return height
    }




}
