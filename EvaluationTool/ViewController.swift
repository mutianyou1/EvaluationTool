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
class ViewController: UIViewController {
    private let app = UIApplication.sharedApplication().delegate as! AppDelegate
    lazy var logContentTF = UITextField(frame: CGRectMake(20, 80, kwidth - 40, 40))
    lazy var restTimeTF = UITextField(frame: CGRectMake(20, 200, kwidth - 40, 40))
//    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
//        super.init(nibName: "ViewController", bundle: NSBundle.mainBundle())
//        self.tabBarItem.selectedImage = UIImage(named: "person2")
//        self.tabBarItem.image = UIImage(named: "person1")
//        self.tabBarItem.title = "个人日志"
//    }
    init(sting :String){
                super.init(nibName: nil, bundle: nil)
                self.tabBarItem.selectedImage = UIImage(named: "person2")
                self.tabBarItem.image = UIImage(named: "person1")
                self.tabBarItem.title = "个人日志"
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
        self.navigationController?.presentViewController(LoginViewController(), animated: false, completion: nil)
        self.view.backgroundColor = UIColor.whiteColor()
        self.logContentTF.delegate = self
        self.restTimeTF.delegate = self
        logContentTF.borderStyle = .RoundedRect
        restTimeTF.borderStyle = .RoundedRect
        self.view.addSubview(logContentTF)
        self.view.addSubview(restTimeTF)
        let result = app.searchData()
        for log  in result {
            let item = log as! PersonLog as PersonLog!
             print(item.logContent)
             print(item.logTime)
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController:UITextFieldDelegate{
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if textField == logContentTF {
            app.savePersonalLog(textField.text!)
        }else{
           let log = PersonLogData()
           log.logTitle = textField.text!
            print(log.logTitle)
        }
        return true
    }

}
