//
//  StopWatch.swift
//  myTimer
//
//  Created by Tianyi Ben on 2016-01-17.
//  Copyright © 2016 Tianyi Ben. All rights reserved.
//

import Foundation

class StopWatch {
    private var startTime: NSDate?
    private var accumulatedTime: NSTimeInterval = 0.0
    private var active = false
    
//    private func timeIntervalToString(Ti: NSTimeInterval) -> String? {
//        let dateFormatter = NSDateComponentsFormatter()
//        dateFormatter.zeroFormattingBehavior = .Pad
//        dateFormatter.allowedUnits = [NSCalendarUnit.Hour, NSCalendarUnit.Minute, NSCalendarUnit.Second, NSCalendarUnit.Nanosecond]
//        return dateFormatter.stringFromTimeInterval(Ti)
//    }
    
    var elapsedTimeInterval: NSTimeInterval {
        get {
            return accumulatedTime + NSDate().timeIntervalSinceDate(startTime ?? NSDate())
        }
    }
    
//    var elapsedTimeString: String {
//        get {
//            return timeIntervalToString(elapsedTimeInterval) ?? "0:00:00"
//        }
//    }
    
    func start() {
        if active == false {
            active = true
            startTime = NSDate()
        }
    }
    
    func stop() {
        active = false
        accumulatedTime += NSDate().timeIntervalSinceDate(startTime ?? NSDate())
        startTime = nil
    }
    
    func reset() {
        active = false
        accumulatedTime = 0.0
        startTime = nil
    }
}