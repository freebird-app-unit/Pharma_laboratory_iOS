//
//  LogHelper.swift
//  My Pharmacy
//
//  Created by Jat42 on 17/09/21.
//  Copyright © 2021 iOS Dev. All rights reserved.
//

import Foundation

//static func m(_ items: Any..., separator: String = " ", terminator: String = "\n") {
//    #if DEBUG
//    if isLogging {
//        items.forEach {
//            Swift.print("🟢 \($0)", separator: separator, terminator: terminator)
//            write("🟢 \(Date()): \($0) \n")
//        }
//    }
//    #endif
//}

class Logger: NSObject {
    
    private static let isLogging = AppConfig.appMode == .development ? true : false
    
    //static let loginTag = "\(DateHelper().getTime()) : LoginVC -> "
    
    static let universalTag = "File: \(#file) Method: \(#function) line: \(#line) "
    
    static func print(_ items: Any..., separator: String = " ", terminator: String = "\n") {
        if isLogging {
            items.forEach {
                Swift.print("⚪️ \($0)", separator: separator, terminator: terminator)
                write("⚪️ \(Date()): \($0) \n")
            }
        }
    }
    
    static func m(_ items: Any..., separator: String = " ", terminator: String = "\n") {
        if isLogging {
            items.forEach {
                Swift.print("🟢 \($0)", separator: separator, terminator: terminator)
                write("🟢 \(Date()): \($0) \n")
            }
        }
    }
    
    static func d(_ items: Any..., separator: String = " ", terminator: String = "\n") {
        if isLogging {
            items.forEach {
                Swift.print("🟡 \($0)", separator: separator, terminator: terminator)
                write("🟡 \(Date()): \($0) \n")
            }
        }
    }
    
    static func e(_ items: Any..., separator: String = " ", terminator: String = "\n") {
        if isLogging {
            items.forEach {
                Swift.print("🔴 \($0)", separator: separator, terminator: terminator)
                write("🔴 \(Date()): \($0) \n")
                
            }
        }
    }
    
    private static func write(_ string: String) {
        let fm = FileManager.default
        let log = fm.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("MHCLLogs.txt")
        if let handle = try? FileHandle(forWritingTo: log) {
            handle.seekToEndOfFile()
            handle.write(string.data(using: .utf8)!)
            handle.closeFile()
        } else {
            try? string.data(using: .utf8)?.write(to: log)
        }
    }
    
}



