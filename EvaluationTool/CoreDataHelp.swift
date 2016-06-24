//
//  CoreDataHelp.swift
//  EvaluationTool
//
//  Created by 潘元荣(外包) on 16/6/24.
//  Copyright © 2016年 潘元荣(外包). All rights reserved.
//
import UIKit
import Foundation
import CoreData

class CoreDataHelper:NSObject {
    let store :CoreDataStore!
    override init() {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        store = appDelegate.cdStore
        super.init()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "contextDidSaveContext:", name: NSManagedObjectContextDidSaveNotification, object: nil)
        
    }
    deinit{
      NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    lazy var managedObjectContext: NSManagedObjectContext = {
        // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.) This property is optional since there are legitimate error conditions that could cause the creation of the context to fail.
        let coordinator = self.store.persistentStoreCoordinator
        var managedObjectContext = NSManagedObjectContext(concurrencyType: .MainQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = coordinator
        return managedObjectContext
    }()
    lazy  var backgroundContext:NSManagedObjectContext = {
      
       let coordinator = self.store.persistentStoreCoordinator
       var backgroundContext = NSManagedObjectContext(concurrencyType: .PrivateQueueConcurrencyType)
        backgroundContext.persistentStoreCoordinator = coordinator
       return backgroundContext
    
    }()
    // MARK: - Core Data Saving support
    
    func saveContext(context:NSManagedObjectContext) {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
                abort()
            }
        }
    }
    func saveContext(){
       self.saveContext(self.backgroundContext)
    }
    //响应通知
 private   func contextDidSaveContext(notification:NSNotification){
       let sender = notification.object as! NSManagedObjectContext!
        if sender == self.managedObjectContext {
            print("save on mainContex")
            self.managedObjectContext.performBlock({ () -> Void in
                self.managedObjectContext.mergeChangesFromContextDidSaveNotification(notification)
            })
        
        }else if sender == self.backgroundContext {
          print("save on backgroundContext ")
            self.backgroundContext.performBlock({ () -> Void in
                self.backgroundContext.mergeChangesFromContextDidSaveNotification(notification)
            })
        }else{
          print("save on otherContext")
          self.managedObjectContext.performBlock({ () -> Void in
            self.managedObjectContext.mergeChangesFromContextDidSaveNotification(notification)
          })
         self.backgroundContext.performBlock({ () -> Void in
            self.backgroundContext.mergeChangesFromContextDidSaveNotification(notification)
        })
        }
    }
    
}