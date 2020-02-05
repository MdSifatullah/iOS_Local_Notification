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
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Get Permission
        center = UNUserNotificationCenter.current()
        center!.requestAuthorization(options: [.alert, .sound]) { (granted, error) in
            
        }
    }

    @IBAction func notificationBtn(_ sender: Any) {
        

        
        // Notification Content
        let content = UNMutableNotificationContent()
        content.title = "Hey! I am Notification"
        content.body = "Trial Local Notification"
        
        // Create trigger of notification
        let date = Date().addingTimeInterval(5)
        let dateComponent = Calendar.current.dateComponents([.year, .month, .day, .minute, .second], from: date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: false)
        
        //Create notification request
        let uuIdentifier = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuIdentifier, content: content, trigger: trigger)
        print(request)
        
        //Register the Request
        center!.add(request) { (error) in
            //error handle
        }
    }
    
}

