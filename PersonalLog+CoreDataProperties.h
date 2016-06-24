//
//  PersonalLog+CoreDataProperties.h
//  EvaluationTool
//
//  Created by 潘元荣(外包) on 16/6/24.
//  Copyright © 2016年 潘元荣(外包). All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "PersonalLog.h"

NS_ASSUME_NONNULL_BEGIN

@interface PersonalLog (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *logContent;
@property (nullable, nonatomic, retain) NSString *logTitle;
@property (nullable, nonatomic, retain) NSString *logTime;
@property (nullable, nonatomic, retain) NSString *restTime;

@end

NS_ASSUME_NONNULL_END
