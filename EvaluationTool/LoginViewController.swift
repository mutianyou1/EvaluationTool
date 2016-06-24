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
        //self.view.backgroundColor =  UIColor.whiteColor()//70 37 03
        self.view.backgroundColor = UIColor(red: 170 / 255.0, green: 137 / 255.0, blue: 103 / 255 , alpha: 1.0)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        logoTitle.text = "EvaluationTool"
        logoTitle.textAlignment = .Center
        logoTitle.textColor = UIColor.lightGrayColor()
        password.text = "请输入正确密码"
        password.hidden = true
        password.textColor = UIColor.redColor()
        password.textAlignment = .Center
        loginTF.borderStyle = .RoundedRect
        loginTF.delegate = self
        loginTF.secureTextEntry = true
        self.view.addSubview(logoTitle)
        self.view.addSubview(password)
        self.view.addSubview(loginTF)
        self.setUpConstraints()
    }
 

    private func setUpConstraints() {
       self.loginTF.translatesAutoresizingMaskIntoConstraints = false
       self.logoTitle.translatesAutoresizingMaskIntoConstraints = false
       self.password.translatesAutoresizingMaskIntoConstraints = false
        viewConstraints.removeAll()
        let top_title = NSLayoutConstraint.init(item: logoTitle, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant:kRESOLUTIONH * 60)
        let width_title = NSLayoutConstraint.init(item: logoTitle, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.Width, multiplier: 1.0, constant:-kRESOLUTIONW * 40)
        let center_title = NSLayoutConstraint.init(item: logoTitle, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.CenterX, multiplier: 1.0, constant:0)
        let height_title = NSLayoutConstraint.init(item: logoTitle, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.Height, multiplier: 0.1, constant:0)
        let top_pwd = NSLayoutConstraint.init(item: password, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant:kRESOLUTIONH * 120)
        let width_pwd = NSLayoutConstraint.init(item: password, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.Width, multiplier: 1.0, constant:-kRESOLUTIONW * 40)
        let center_pwd = NSLayoutConstraint.init(item: password, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.CenterX, multiplier: 1.0, constant:0)
        let height_pwd = NSLayoutConstraint.init(item: password, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.Height, multiplier: 0.1, constant:0)
        let top_input = NSLayoutConstraint.init(item: loginTF, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.CenterY, multiplier: 1.0, constant:20 * kRESOLUTIONH)
        let width_input = NSLayoutConstraint.init(item: loginTF, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.Width, multiplier: 1.0, constant:-kRESOLUTIONW * 30)
        let center_input = NSLayoutConstraint.init(item: loginTF, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.CenterX, multiplier: 1.0, constant:0)
        let height_input = NSLayoutConstraint.init(item: loginTF, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.Height, multiplier: 0.08, constant:0)
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
    
}
extension LoginViewController :UITextFieldDelegate{
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if ((textField.text?.containsString("78")) == false){
           password.hidden = false
           let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
           animation.values = [-16,-8,0,16,8,0]
           animation.duration = 0.1
           animation.repeatCount = 2
           animation.removedOnCompletion = true
           password.layer.addAnimation(animation, forKey: "shake")
        }else{
           self.dismissViewControllerAnimated(true, completion: nil)
        }
        
        
        return true
    }
    
    
    
    
    
}
