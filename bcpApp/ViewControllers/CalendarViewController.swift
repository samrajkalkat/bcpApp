//
//  CalendarViewController.swift
//  bcpApp
//
//  Created by samraj on 8/2/16.
//  Copyright © 2016 Samraj. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON
import MBCalendarKit



class CalendarViewController: UIViewController {
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
//        if let path = NSBundle.mainBundle().pathForResource("events", ofType: "json") {
//            do {
//                let data = try NSData(contentsOfURL: NSURL(fileURLWithPath: path), options: NSDataReadingOptions.DataReadingMappedIfSafe)
//                let jsonObj = JSON(data: data)
//                if jsonObj != JSON.null {
//                    
//                    
//                    for item in jsonObj.arrayValue {
//                        let date = String(item["Start"])
//                        let dateFormatter = NSDateFormatter()
//                        dateFormatter.dateFormat = "yyyy-MM-dd"
//                        var currentDateTime = NSDate()
//                        
//                        var eventDate = dateFormatter.dateFromString(date)
//                        
//                        if eventDate?.isLessThanDate(currentDateTime) == true
//                        {
//                             print(item["Summary"])
//                        }
//                       
//                    }
//                    
//                } else {
//                    print("could not get json from file, make sure that file contains valid json.")
//                }
//            } catch let error as NSError {
//                print(error.localizedDescription)
//            }
//        } else {
//            print("Invalid filename/path.")
//        }
//        
    }
    
}


extension NSDate {
    func isGreaterThanDate(dateToCompare: NSDate) -> Bool {
        //Declare Variables
        var isGreater = false
        
        //Compare Values
        if self.compare(dateToCompare) == NSComparisonResult.OrderedDescending {
            isGreater = true
        }
        
        //Return Result
        return isGreater
    }
    
    func isLessThanDate(dateToCompare: NSDate) -> Bool {
        //Declare Variables
        var isLess = false
        
        //Compare Values
        if self.compare(dateToCompare) == NSComparisonResult.OrderedAscending {
            isLess = true
        }
        
        //Return Result
        return isLess
    }
    
    func equalToDate(dateToCompare: NSDate) -> Bool {
        //Declare Variables
        var isEqualTo = false
        
        //Compare Values
        if self.compare(dateToCompare) == NSComparisonResult.OrderedSame {
            isEqualTo = true
        }
        
        //Return Result
        return isEqualTo
    }
    
    func addDays(daysToAdd: Int) -> NSDate {
        let secondsInDays: NSTimeInterval = Double(daysToAdd) * 60 * 60 * 24
        let dateWithDaysAdded: NSDate = self.dateByAddingTimeInterval(secondsInDays)
        
        //Return Result
        return dateWithDaysAdded
    }
    
    func addHours(hoursToAdd: Int) -> NSDate {
        let secondsInHours: NSTimeInterval = Double(hoursToAdd) * 60 * 60
        let dateWithHoursAdded: NSDate = self.dateByAddingTimeInterval(secondsInHours)
        
        //Return Result
        return dateWithHoursAdded
    }
}
