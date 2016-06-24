//
//  LoginViewController.swift
//  EvaluationTool
//
//  Created by 潘元荣(外包) on 16/6/24.
//  Copyright © 2016年 潘元荣(外包). All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    private lazy var logoTitle = UILabel()
    private lazy var password = UILabel()
    private lazy var loginTF = UITextField()
    private var viewConstraints = [NSLayoutConstraint]()
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBarHidden = true
        self.view.backgroundColor =  UIColor.whiteColor()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logoTitle.text = "EvaluationTool"
        logoTitle.textColor = UIColor.lightGrayColor()
        password.text = "请输入密码"
        password.textColor = UIColor.redColor()
        loginTF.borderStyle = .RoundedRect
        self.view.addSubview(logoTitle)
        self.view.addSubview(loginTF)
        self.view.addSubview(password)
        self.setUpConstraints()
    }
 

    private func setUpConstraints() {
       self.loginTF.translatesAutoresizingMaskIntoConstraints = false
       self.logoTitle.translatesAutoresizingMaskIntoConstraints = false
        viewConstraints.removeAll()
        let top_title = NSLayoutConstraint.init(item: logoTitle, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant:kRESOLUTIONH * 80)
        let width_title = NSLayoutConstraint.init(item: logoTitle, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.Width, multiplier: 1.0, constant:kRESOLUTIONH * 120)
        let center_title = NSLayoutConstraint.init(item: logoTitle, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.CenterX, multiplier: 1.0, constant:0)
        let height_title = NSLayoutConstraint.init(item: logoTitle, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.Height, multiplier: 1.0, constant:kRESOLUTIONH * 40)
        let top_pwd = NSLayoutConstraint.init(item: password, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: logoTitle, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant:kRESOLUTIONH * 80)
        let width_pwd = NSLayoutConstraint.init(item: password, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.Width, multiplier: 1.0, constant:kRESOLUTIONH * 200)
        let center_pwd = NSLayoutConstraint.init(item: password, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.CenterX, multiplier: 1.0, constant:0)
        let height_pwd = NSLayoutConstraint.init(item: password, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.Height, multiplier: 1.0, constant:kRESOLUTIONH * 40)
        let top_input = NSLayoutConstraint.init(item: loginTF, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: password, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant:kRESOLUTIONH * 120)
        let width_input = NSLayoutConstraint.init(item: loginTF, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.Width, multiplier: 1.0, constant:-kRESOLUTIONH * 30)
        let center_input = NSLayoutConstraint.init(item: loginTF, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.CenterX, multiplier: 1.0, constant:0)
        let height_input = NSLayoutConstraint.init(item: loginTF, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.Height, multiplier: 1.0, constant:kRESOLUTIONH * 40)
        viewConstraints.append(top_title)
        viewConstraints.append(width_title)
        viewConstraints.append(height_title)
        viewConstraints.append(center_title)
        viewConstraints.append(top_pwd)
        viewConstraints.append(width_pwd)
        viewConstraints.append(height_pwd)
        viewConstraints.append(center_pwd)
        viewConstraints.append(top_input)
        viewConstraints.append(width_input)
        viewConstraints.append(height_input)
        viewConstraints.append(center_input)
        self.view.addConstraints(viewConstraints)
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
