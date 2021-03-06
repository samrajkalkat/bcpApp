//
//  CalViewController.swift
//  bcpApp
//
//  Created by samraj on 8/2/16.
//  Copyright © 2016 Samraj. All rights reserved.
//

import CoreFoundation
import UIKit
import MBCalendarKit
import SwiftyJSON

var allEvents = [String : [CKCalendarEvent]]()

class CalViewController: CKCalendarViewController, CKCalendarViewDataSource{
    
    var data = NSMutableDictionary()
    
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        
        self.data = NSMutableDictionary()
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    override func viewWillAppear(animated: Bool) {
        
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        if let path = NSBundle.mainBundle().pathForResource("events", ofType: "json") {
            do {
                let data = try NSData(contentsOfURL: NSURL(fileURLWithPath: path), options: NSDataReadingOptions.DataReadingMappedIfSafe)
                let jsonObj = JSON(data: data)
                if jsonObj != JSON.null {
                    
                    var datesList = [String:String]()
                    
                    let jsonArray: [JSON] = jsonObj.arrayValue
                    
                    for (index, item) in jsonArray.enumerate() {
                        let eventDate = String(item["Start"])
                        
                        var day = ""
                        var month = ""
                        var year = ""
                        
                        //day
                        if eventDate.substringWithRange(eventDate.startIndex.advancedBy(8)...eventDate.startIndex.advancedBy(9)).hasPrefix("0") {
                            
                            day = eventDate.substringWithRange(eventDate.startIndex.advancedBy(9)...eventDate.startIndex.advancedBy(9))
                        }
                        
                        else {
                            day = eventDate.substringWithRange(eventDate.startIndex.advancedBy(8)...eventDate.startIndex.advancedBy(9))
                        }
                        
                        //month
                        if eventDate.substringWithRange(eventDate.startIndex.advancedBy(5)...eventDate.startIndex.advancedBy(6)).hasPrefix("0"){
                            month = eventDate.substringWithRange(eventDate.startIndex.advancedBy(6)...eventDate.startIndex.advancedBy(6))
                        }
                            
                        else {
                            month = eventDate.substringWithRange(eventDate.startIndex.advancedBy(5)...eventDate.startIndex.advancedBy(6))
                        }
                    
                        //year
                        year = eventDate.substringWithRange(eventDate.startIndex.advancedBy(0)...eventDate.startIndex.advancedBy(3))
                        
                        
                        
                      
                        // have a dictionary of type [ NSDate : [EventThing] ]
                        // Parse through all events & sort into dates.
                        // Parse through dictionary & set all events.
                        
                        
                        let description = String(item["Start"])
                        let key = description.substringWithRange(description.startIndex...eventDate.startIndex.advancedBy(9))
                        
                        let title : NSString = NSLocalizedString(String(item["Summary"]), comment: "")
                        let date : NSDate = NSDate(day: UInt(day)!, month: UInt(month)!, year: UInt(year)!)
                        let event : CKCalendarEvent = CKCalendarEvent(title: title as String, andDate: date, andInfo: nil)
                        
                        // if allEvents
                        
                        if allEvents[key] == nil {
            
                            allEvents[key] = [event]
                        }
                        else {
                            
                            allEvents[key]!.append(event)
                        }

                        
                    }
                    
                    for (eventDate,event) in allEvents {
                        
                        var eventDay = String()
                        var eventMonth = String()
                        var eventYear = String()
                
                        
                        //day
                        if eventDate.substringWithRange(eventDate.startIndex.advancedBy(8)...eventDate.startIndex.advancedBy(9)).hasPrefix("0") {
                            
                            eventDay = eventDate.substringWithRange(eventDate.startIndex.advancedBy(9)...eventDate.startIndex.advancedBy(9))
                        }
                            
                        else {
                            eventDay = eventDate.substringWithRange(eventDate.startIndex.advancedBy(8)...eventDate.startIndex.advancedBy(9))
                        }
                        
                        //month
                        if eventDate.substringWithRange(eventDate.startIndex.advancedBy(5)...eventDate.startIndex.advancedBy(6)).hasPrefix("0"){
                            eventMonth = eventDate.substringWithRange(eventDate.startIndex.advancedBy(6)...eventDate.startIndex.advancedBy(6))
                        }
                            
                        else {
                            eventMonth = eventDate.substringWithRange(eventDate.startIndex.advancedBy(5)...eventDate.startIndex.advancedBy(6))
                        }
                        
                        //year
                        eventYear = eventDate.substringWithRange(eventDate.startIndex.advancedBy(0)...eventDate.startIndex.advancedBy(3))
                        
                        let date : NSDate = NSDate(day: UInt(eventDay)!, month: UInt(eventMonth)!, year: UInt(eventYear)!)
                        
                        self.data[date] = event
                        
                    }
                    
                } else {
                    print("could not get json from file, make sure that file contains valid json.")
                }
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        } else {
            print("Invalid filename/path.")
        }

        
        var calendar: CKCalendarView = CKCalendarView()
        
        
        calendar.frame = CGRectOffset(self.view.frame, 0.0, 20.0);
        
        
        calendar.delegate = self
        calendar.dataSource = self
        
        // 3. Present the calendar
        self.view!.addSubview(calendar)
        
        
        
       
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //
    //  MARK: - CKCalendarDataSource
    //
    
    
    func calendarView(calendarView: CKCalendarView!, eventsForDate date: NSDate!) -> [AnyObject]! {
        
        return self.data.objectForKey(date) as! [AnyObject]!
    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
    
}



