//
//  ViewController.swift
//  LocalNotification
//
//  Created by 安藤奨 on 2019/07/21.
//  Copyright © 2019 安藤奨. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var textFieldForTitle: UITextField!
    
    @IBOutlet weak var textFieldForContent: UITextField!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textFieldForTitle.delegate = self
        textFieldForContent.delegate = self
        // Do any additional setup after loading the view.
    }

    @IBAction func didClickButton(_ sender: UIButton) {
        
        let content = UNMutableNotificationContent()
        content.title = textFieldForTitle.text!
        content.body = textFieldForContent.text!
        content.sound = .default
        
        var notificationTime = DateComponents()
        let calendar = Calendar.current
        notificationTime.hour = calendar.component(.hour, from: datePicker.date)
        notificationTime.minute = calendar.component(.minute, from: datePicker.date)

        let trigger = UNCalendarNotificationTrigger(dateMatching: notificationTime, repeats: false)
        
        let request = UNNotificationRequest(identifier: "uuid", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textFieldForTitle.resignFirstResponder()
        textFieldForContent.resignFirstResponder()
        
        return true
    }
    
}

