//
//  ViewController.swift
//  date-util
//
//  Created by Wallace Baldenebre on 04/10/21.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let originalDate = "2021-10-04"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd"
        let targetDate = dateFormatter.date(from: originalDate)?.onlyDate ?? Date()
        
        let today = Date().onlyDate
        print("LOG >> HOJE: \(today)")
        print("LOG >> DATA ALVO: \(targetDate)")
        print(" ")
        
        if today > targetDate  {
            print("LOG >> DEPOIS da data")
        } else {
            print("LOG >> ANTES ou IGUAL a data")
        }
    }
}

extension Date {
    var onlyDate: Date {
        get {
            let calender = Calendar.current
            let dateComponents = calender.dateComponents([.year, .month, .day], from: self)
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy:MM:dd"
            let date = calender.date(from: dateComponents)
            let stringDate = dateFormatter.string(from: date!)
            return dateFormatter.date(from: stringDate)!
        }
    }
}
