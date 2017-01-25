//
//  ViewController.swift
//  SecureQueue
//
//  Created by jdkizer9 on 01/10/2017.
//  Copyright (c) 2017 jdkizer9. All rights reserved.
//

import UIKit
import SecureQueue
import OMHClient

class ViewController: UIViewController {

    
    func printQueueHead(_ queue: SecureQueue) {
        do {
            guard let head = try queue.getFirstElement(),
                let pamPointDict = head.1 as? [String: Any] else {
                    print("Queue is empty!!")
                    return
            }
            
            print(head.0)
            print(pamPointDict)
        } catch let error as NSError {
            print(error.debugDescription)
        }
    }
    
    func getQueueHeadID(_ queue: SecureQueue) -> String?  {
        do {
            guard let head = try queue.getFirstElement() else {
                print("Queue is empty!!")
                return nil
            }
            
            return head.0
        } catch let error as NSError {
            print(error.debugDescription)
            return nil
        }
    }
    
    
    func queueTests() {
        
        let pam = PAMSample()
        pam.affectArousal = 1
        pam.affectValence = 2
        pam.negativeAffect = 3
        pam.positiveAffect = 4
        pam.mood = "awesome!!"
        
        let allowedClasses: [AnyClass] = [NSDictionary.self]
        
        if let queue = SecureQueue(directoryName: "OMHDatapointQueue", allowedClasses: allowedClasses) {
            
            do {
                printQueueHead(queue)
                
                try queue.addElement(element: pam.toDict() as NSDictionary)
                
                printQueueHead(queue)
                
                try queue.addElement(element: pam.toDict() as NSDictionary)
                
                printQueueHead(queue)
                
            } catch let error as NSError {
                print(error.debugDescription)
            }
            
        }
        
        if let queue = SecureQueue(directoryName: "OMHDatapointQueue", allowedClasses: allowedClasses) {
            
            do {
                printQueueHead(queue)
                
                if let headID = self.getQueueHeadID(queue) {
                    try queue.removeElement(elementId: headID)
                }
                
                printQueueHead(queue)
                
                if let headID = self.getQueueHeadID(queue) {
                    try queue.removeElement(elementId: headID)
                }
                
                printQueueHead(queue)
                
                if let headID = self.getQueueHeadID(queue) {
                    try queue.removeElement(elementId: headID)
                }
                
            } catch let error as NSError {
                print(error.debugDescription)
            }
            
        }
        
        if let queue = SecureQueue(directoryName: "OMHDatapointQueue", allowedClasses: allowedClasses) {
            
            do {
                printQueueHead(queue)
                
                try queue.addElement(element: pam.toDict() as NSDictionary)
                
                printQueueHead(queue)
                
                try queue.addElement(element: pam.toDict() as NSDictionary)
                
                printQueueHead(queue)
                
            } catch let error as NSError {
                print(error.debugDescription)
            }
            
        }
        
        if let queue = SecureQueue(directoryName: "OMHDatapointQueue", allowedClasses: allowedClasses) {
            
            do {
                
                printQueueHead(queue)
                
                try queue.clear()
                
                printQueueHead(queue)
                
                if let headID = self.getQueueHeadID(queue) {
                    try queue.removeElement(elementId: headID)
                }
                
                printQueueHead(queue)
                
                if let headID = self.getQueueHeadID(queue) {
                    try queue.removeElement(elementId: headID)
                }
                
                printQueueHead(queue)
                
                if let headID = self.getQueueHeadID(queue) {
                    try queue.removeElement(elementId: headID)
                }
                
            } catch let error as NSError {
                print(error.debugDescription)
            }
            
        }
        
        if let queue = SecureQueue(directoryName: "OMHDatapointQueue", allowedClasses: allowedClasses) {
            
            do {
                printQueueHead(queue)
                
                try queue.addElement(element: pam.toDict() as NSDictionary)
                
                printQueueHead(queue)
                
                try queue.addElement(element: pam.toDict() as NSDictionary)
                
                printQueueHead(queue)
                
            } catch let error as NSError {
                print(error.debugDescription)
            }
            
        }
        
        if let queue = SecureQueue(directoryName: "OMHDatapointQueue", allowedClasses: allowedClasses) {
            
            do {
                printQueueHead(queue)
                
                if let headID = self.getQueueHeadID(queue) {
                    try queue.removeElement(elementId: headID)
                }
                
                printQueueHead(queue)
                
                if let headID = self.getQueueHeadID(queue) {
                    try queue.removeElement(elementId: headID)
                }
                
                printQueueHead(queue)
                
                if let headID = self.getQueueHeadID(queue) {
                    try queue.removeElement(elementId: headID)
                }
                
            } catch let error as NSError {
                print(error.debugDescription)
            }
            
        }
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.queueTests()
        
    }
    
    func mapTests() {
        
        let pam = PAMSample()
        pam.affectArousal = 1
        pam.affectValence = 2
        pam.negativeAffect = 3
        pam.positiveAffect = 4
        pam.mood = "awesome!!"
        
        let allowedClasses: [AnyClass] = [NSDictionary.self]
        
        guard let documentsPath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).first else {
            return
        }
        
        let directoryName = documentsPath.appending("testDirectory")
        
        if let secureMap = SecurePersistentMap(directoryName: directoryName, allowedClasses: allowedClasses) {
            //            debugPrint(secureMap)
            
            (0...10).forEach({ (index) in
                do {
                    try secureMap.addValue(pam.toDict() as NSDictionary, forKey: UUID().uuidString)
                } catch let error as NSError {
                    print(error.localizedDescription)
                }
            })
            
            do {
                try print("items in map: \(secureMap.keys().count)")
                print("items in memory: \(secureMap.keysInMemory().count)")
                //                try secureMap.removeAll()
                //                try print(secureMap.keys())
            } catch let error as NSError {
                print(error.localizedDescription)
            }
            
            
            
            
            
            //            do {
            //
            //                if !secureMap.contains(key: key) {
            //                    try secureMap.addValue(pam, forKey: key)
            //                }
            //
            //                let value = try secureMap.getValue(forKey: key) as? OMHDataPoint
            //                let value2 = try secureMap.getValue(forKey: key) as? OMHDataPoint
            //                debugPrint(value?.toDict())
            //
            //            } catch let error as NSError {
            //                print(error.localizedDescription)
            //                return
            //            }
            
            
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

