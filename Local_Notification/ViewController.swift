//
//  ViewController.swift
//  Local_Notification
//
//  Created by Md Sifat on 2/5/20.
//  Copyright © 2020 Md Sifat. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {
    var center : UNUserNotificationCenter?
    
    
    @IBOutlet var titleShowLbl: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var dateShowTextLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        titleShowLbl.text = "Selected Date : "
        // Get Permission
        center = UNUserNotificationCenter.current()
        center!.requestAuthorization(options: [.alert, .sound]) { (granted, error) in
            
        }
        
        
    }
    
    @IBAction func setDateBtn(_ sender: Any) {
        dateShowTextLbl.text = "\(datePicker.date)"
        // Notification Content
        let content = UNMutableNotificationContent()
        content.title = "Hey! I am 06"
        content.body = "Trial Local Notification"
        
        // Configure the recurring date.
        var dateComponents = DateComponents()
        dateComponents.calendar = Calendar.current
        
        let components = Calendar.current.dateComponents([.hour, .minute], from: datePicker.date)
        let hour = components.hour
        let minute = components.minute
        
        dateComponents.weekday = 5  // Thu
        dateComponents.hour = hour    // 14:00 hours
        dateComponents.minute = minute
        
        // Create the trigger as a repeating event.
        let trigger = UNCalendarNotificationTrigger(
            dateMatching: dateComponents, repeats: true)
        
        // Create the request
        let uuidString = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuidString,
                                            content: content, trigger: trigger)
        
        // Schedule the request with the system.
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.add(request) { (error) in
            if error != nil {
                // Handle any errors.
            }
        }
        
    }
    
}

