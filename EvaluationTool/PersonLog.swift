//
//  PersonalLog.swift
//  EvaluationTool
//
//  Created by 潘元荣(外包) on 16/6/24.
//  Copyright © 2016年 潘元荣(外包). All rights reserved.
//

import Foundation
import CoreData

public class PersonLogData:NSObject {
    var logContent : String = ""
    var logTitle : String = ""
    var logTime : String = ""
    var restTime :String = ""
    override init() {
        super.init()
    }
}

@objc(PersonLog)
class PersonLog:NSManagedObject {
    @NSManaged var logContent : String
    @NSManaged var logTitle : String
    @NSManaged var logTime : String
    @NSManaged var restTime :String
}



