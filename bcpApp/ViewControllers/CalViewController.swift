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



@IBDesignable class CalViewController: CKCalendarViewController, CKCalendarViewDataSource{
    
    var data : NSMutableDictionary
    
    required init?(coder aDecoder: NSCoder) {
        
        data = NSMutableDictionary()
        
        super.init(coder: aDecoder)
       
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        
        self.data = NSMutableDictionary()
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var calendar: CKCalendarView = CKCalendarView()
        
   
        calendar.delegate = self
        calendar.dataSource = self
        // 3. Present the calendar
        self.view!.addSubview(calendar)

//        var calendar: CKCalendarViewController = CKCalendarViewController()
//        
//        self.presentViewController(calendar, animated: true) {
//            
//        }
    
        // Do any additional setup after loading the view.
        
        //
        //  Step 0 : Wire up the data source and delegate
        //
        
        self.delegate = self
        self.dataSource = self

        
        
        
        let title : NSString = NSLocalizedString("Demo", comment: "YOLO")
        let date = NSDate()
        let event : CKCalendarEvent = CKCalendarEvent(title: title as String, andDate: NSDate(), andInfo: nil)
        
        //
        //  Step 2 : Add the events to the cache array
        //
        
        self.data[date] = [event]
        
        calendar.reloadAnimated(true)
        
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
