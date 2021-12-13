//
//  DateHelper.swift
//  My Pharmacy
//
//  Created by Jat42 on 17/09/21.
//  Copyright © 2021 iOS Dev. All rights reserved.
//

import UIKit

class DateHelper: NSObject {
    
    static let shared = DateHelper()
    
    struct DateStrings {
        
        static let monthFormat = "MM"
        static let yearFormat = "yyyy"
        static let dayFormat = "dd"
        static let fullHourFormat = "HH"
        static let minuteFormate = "mm"
        
        static let serverTimeFormat = "HH:mm"
        static let serverDateFormat = "yyyy-MM-dd"
        static let appTimeFormat = "hh:mm a"
        static let appDateFormat  = "dd-MM-yyyy"
        static let serverDateFormat24 = "yyyy-MM-dd HH:mm:ss"
        static let appLongDateFormat = "dd-MM-yyyy hh:mm a"
        
    }
    
    private var currentUnixTime: TimeInterval {
        get {
            Date().timeIntervalSince1970
        }
    }
    
    func getDateComponentes(from date: Date) -> (year: Int, month: Int, day: Int) {
        
        let formatter = DateFormatter()
        
        formatter.dateFormat = DateStrings.yearFormat
        
        let year = Int(formatter.string(from: date)) ?? 2021
        
        formatter.dateFormat = DateStrings.monthFormat
        
        let month = Int(formatter.string(from: date)) ?? 01
        
        formatter.dateFormat = DateStrings.dayFormat
        
        let day = Int(formatter.string(from: date)) ?? 01
        
        return (year,month,day)
    }
    
    
    func getTimeComponents(timeIn24Hrs time: String) -> (hour: Int, minute: Int) {
        let hour = Int(time.components(separatedBy: ":").first!) ?? 00
        let minute = Int(time.components(separatedBy: ":").last!) ?? 00
        print(hour, minute)
        return (hour, minute)
    }
    
    
    func daysBetween(from start: Date,to end: Date) -> Int {
        return Calendar.current.dateComponents([.day], from: start, to: end).day!
    }
    
    
    func getNextDayComponents(from date: Date) -> (year: Int, month: Int, day: Int) {
        
        let nextDayDate = Calendar.current.date(byAdding: .day, value: 1, to: date) ?? Date()
        
        let formatter = DateFormatter()
        
        formatter.dateFormat = DateStrings.yearFormat
        
        let year = Int(formatter.string(from: nextDayDate)) ?? 2021
        
        formatter.dateFormat = DateStrings.monthFormat
        
        let month = Int(formatter.string(from: nextDayDate)) ?? 01
        
        formatter.dateFormat = DateStrings.dayFormat
        
        let day = Int(formatter.string(from: nextDayDate)) ?? 01
        
        return (year,month,day)
    }
    
    func getNextTimeComponents(timeInterval: Int) -> (hour: Int, minute: Int) {
        
        let nextTimeComponents = Calendar.current.date(byAdding: .hour, value: timeInterval, to: Date())!
        
        let formatter = DateFormatter()
        
        formatter.dateFormat = DateStrings.fullHourFormat
        
        let hour = Int(formatter.string(from: nextTimeComponents)) ?? 00
        
        formatter.dateFormat = DateStrings.minuteFormate
        
        let minute = Int(formatter.string(from: nextTimeComponents)) ?? 00
        
        return (hour, minute)
    }
    
    func getNextMonthYear() -> String {
        
        let nextYearDate = Calendar.current.date(byAdding: .year, value: 1, to: Date())!
        let formatter = DateFormatter()
        formatter.dateFormat = "\(DateStrings.monthFormat)-\(DateStrings.yearFormat)"
        return formatter.string(from: nextYearDate)
    }
    
    func get24HourTime(fromTime time: String) -> String {
        
        let formatter = DateFormatter()
        formatter.dateFormat = DateStrings.appTimeFormat
        let date = formatter.date(from: time)
        formatter.dateFormat = DateStrings.serverTimeFormat
        return formatter.string(from: date ?? Date())
    }
    
    func getFullTime(fromTime time: String) -> String {
        
        let formatter = DateFormatter()
        formatter.dateFormat = DateStrings.serverTimeFormat
        let date = formatter.date(from: time)
        formatter.dateFormat = DateStrings.appTimeFormat
        return formatter.string(from: date ?? Date())
    }
    
    func getFullTime(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = DateStrings.appTimeFormat
        return formatter.string(from: date)
    }
    
    func isTodaysDate(date: Date) -> Bool {
        
        let formatter = DateFormatter()
        formatter.dateFormat = DateStrings.appDateFormat
        
        if formatter.string(from: date) == formatter.string(from: Date()) {
            return true
        } else {
            return false
        }
    }
    
    func isSameDayDate(date1: Date, date2: Date) -> Bool {
        
        let formatter = DateFormatter()
        formatter.dateFormat = DateStrings.appDateFormat
        
        if formatter.string(from: date1) == formatter.string(from: date2) {
            return true
        } else {
            return false
        }
    }
    
    func isCurrentMonthDate(date: Date) -> Bool {
        
        let formatter = DateFormatter()
        formatter.dateFormat = DateStrings.monthFormat
        
        if formatter.string(from: date) == formatter.string(from: Date()) {
            return true
        } else {
            return false
        }
    }
    
    func isSimilarMonths(date1: Date, date2: Date) -> Bool {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "\(DateStrings.monthFormat)-\(DateStrings.yearFormat)"
        
        if formatter.string(from: date1) == formatter.string(from: date2) {
            return true
        } else {
            return false
        }
        
    }
    
    func createDateFromDateAndTime(time: String, date: Date) -> Date {
        
        let formatter = DateFormatter()
        formatter.dateFormat = DateStrings.appDateFormat
        let dateString = formatter.string(from: date)
        formatter.dateFormat = "\(DateStrings.appDateFormat) \(DateStrings.serverTimeFormat)"
        return formatter.date(from: "\(dateString) \(time)") ?? Date()
    }
    
    func getDateComponents(after: Int, to: Date) -> DateComponents {
        
        let nextDate = Calendar.current.date(bySetting: .hour, value: after, of: to) ?? Date()
        
        let formatter = DateFormatter()
        formatter.dateFormat = DateStrings.yearFormat
        
        let year = Int(formatter.string(from: nextDate)) ?? 2021
        
        formatter.dateFormat = DateStrings.monthFormat
        let month = Int(formatter.string(from: nextDate)) ?? 01
        
        formatter.dateFormat = DateStrings.dayFormat
        let day = Int(formatter.string(from: nextDate)) ?? 01
        
        formatter.dateFormat = DateStrings.fullHourFormat
        let hour = Int(formatter.string(from: nextDate)) ?? 00
        
        formatter.dateFormat = DateStrings.minuteFormate
        let minute = Int(formatter.string(from: nextDate)) ?? 00
        
        return DateComponents(
            calendar: .current,
            timeZone: .current,
            year: year,
            month: month,
            day: day,
            hour: hour,
            minute: minute
        )
    }
    
    func convertServerDate(oldDate: String?) -> String? {
        if oldDate == nil || oldDate! == "" {
            return nil
        }
        let formatter = DateFormatter()
        formatter.dateFormat = DateStrings.appDateFormat
        let date = formatter.date(from: oldDate!)
        formatter.dateFormat = DateStrings.serverDateFormat
        return formatter.string(from: date ?? Date())
    }
    
    func convertAppDate(oldDate: String?) -> String? {
        if oldDate == nil || oldDate! == "" {
            return nil
        }
        let formatter = DateFormatter()
        formatter.dateFormat = DateStrings.serverDateFormat24
        let date = formatter.date(from: oldDate!)
        formatter.dateFormat = DateStrings.appLongDateFormat
        return formatter.string(from: date!)
    }
    
    func convertAppDate(oldDate24: String?) -> String? {
        
        if oldDate24! == "" {
            return nil
        }
        
        let formatter = DateFormatter()
        formatter.dateFormat = DateStrings.serverDateFormat24
        let date = formatter.date(from: oldDate24!)
        formatter.dateFormat = DateStrings.appDateFormat
        return formatter.string(from: date ?? Date())
    }
    
    func getCurrentServerFormatDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = DateStrings.serverDateFormat24
        return formatter.string(from: Date())
    }
    
    func convertServerTime(appTime: String?) -> String? {
        if appTime! == "" {
            return nil
        }
        let formatter = DateFormatter()
        formatter.dateFormat = DateStrings.appTimeFormat
        let date = formatter.date(from: appTime!)
        formatter.dateFormat = DateStrings.serverTimeFormat
        return formatter.string(from: date ?? Date())
    }
    
    func spilt24HrsTime(timeIn24Hrs: String) -> (Int, Int) {
        print("24 Hrs time :: ",timeIn24Hrs)
        let first = Int(timeIn24Hrs.components(separatedBy: ":").first!)
        let second = Int(timeIn24Hrs.components(separatedBy: ":").last!)
        return (first!, second!)
    }
    
    func getDateDayString(date: String) -> String? {
        
        if date == "" {
            return ""
        }
        
        let calendar = Calendar.current
        let currentDate = calendar.startOfDay(for: Date())
        
        let previousDate = calendar.date(byAdding: .day, value: -1, to: currentDate)!
        
        let formatter = DateFormatter()
        formatter.dateFormat = DateStrings.serverDateFormat
        
        let serverDate = formatter.date(from: date) ?? Date()
        
        if serverDate == currentDate {
            return "Today"
        } else if serverDate == previousDate {
            return "Yesterday"
        } else {
            formatter.dateFormat = DateStrings.appDateFormat
            return formatter.string(from: serverDate)
        }
        
    }
    
    func convertServerTime(timeIn12Hrs: String) -> (Int, Int) {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        
        let time = formatter.date(from: timeIn12Hrs)
        formatter.dateFormat = "HH:mm"
        
        let convertedTime = formatter.string(from: time!)
        
        let first = Int(convertedTime.components(separatedBy: ":").first!)
        let second = Int(convertedTime.components(separatedBy: ":").last!)
        
        return (first!, second!)
    }
    
    func getAddDiseaseDateFormate(dateString: String) -> String {
        
        let formatter = DateFormatter()
        
        formatter.dateFormat = "HH:mm:ss"
        
        let convertedTime = formatter.string(from: Date())
        
        return "\(convertServerDate(oldDate: dateString) ?? "") \(convertedTime)"
    }
    
    func convertAppTime(serverTime: String?) -> String? {
        if serverTime! == "" {
            return nil
        }
        let formatter = DateFormatter()
        formatter.dateFormat = DateStrings.serverTimeFormat
        let date = formatter.date(from: serverTime!)
        formatter.dateFormat = DateStrings.appTimeFormat
        return formatter.string(from: date!)
    }
    
    func getTime() -> String {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "hh:mm:ss a"
        return dateFormater.string(from: Date())
    }
    
    // MARK: - Date & Time Picker -
    
    func openDatePicker(
        Message msg: String,
        Format format: String,
        Mode mode: UIDatePicker.Mode,
        YesActionTitle: String = Strings.doneButtonTitle,
        NoActionTitle: String = Strings.cancelOption,
        minimumDate: Date?,
        maximumDate: Date?,
        YesAction:@escaping ((String) -> Void),
        NoAction: ((UIAlertAction) -> Void)?
        
    ) {
        
        let datePicker = UIDatePicker()
        
        datePicker.datePickerMode = mode
        
        if let _ = minimumDate {
            datePicker.minimumDate = minimumDate!
        }
        
        if let _ = maximumDate {
            datePicker.maximumDate = maximumDate!
        }
        
        if #available(iOS 13.4, *) {
            datePicker.preferredDatePickerStyle = .wheels
        } else {
            // Fallback on earlier versions
        }
        
        let formatter = DateFormatter()
        
        formatter.dateFormat = format
        
        let dateChooserAlert = UIAlertController(title: "\(msg)", message: nil, preferredStyle: .alert)
        
        dateChooserAlert.view.addSubview(datePicker)
        
        dateChooserAlert.addAction(UIAlertAction(title: YesActionTitle, style: .default, handler: { action in
            YesAction(formatter.string(from: datePicker.date))
            
        }))
        
        dateChooserAlert.addAction(UIAlertAction(title: NoActionTitle, style: .cancel, handler: NoAction ))
        
        let height: NSLayoutConstraint = NSLayoutConstraint(item: dateChooserAlert.view!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 250)
        
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.topAnchor.constraint(equalTo: dateChooserAlert.view.topAnchor, constant: 35).isActive = true
        datePicker.bottomAnchor.constraint(equalTo: dateChooserAlert.view.bottomAnchor, constant: -50).isActive = true
        datePicker.leadingAnchor.constraint(equalTo: dateChooserAlert.view.leadingAnchor, constant: 50).isActive = true
        datePicker.trailingAnchor.constraint(equalTo: dateChooserAlert.view.trailingAnchor, constant: -50).isActive = true
        dateChooserAlert.view.addConstraint(height)
        
        AppConfig.rootVC?.present(dateChooserAlert, animated: true, completion: nil)
    }
    
    
}
