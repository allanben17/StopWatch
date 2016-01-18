//
//  ViewController.swift
//  myTimer
//
//  Created by Tianyi Ben on 2016-01-12.
//  Copyright © 2016 Tianyi Ben. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {
    
    var timer = NSTimer()
    var watch = StopWatch()
    var active = false
    var lapRecords = [String]()
    
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var lapTable: UITableView!
    @IBOutlet var startPauseButton: UIBarButtonItem!
    
    @IBAction func reset(sender: AnyObject) {
        active = false
        timer.invalidate()
        watch.reset()
        updateUI()
        startPauseButton.title = "Start"
        lapRecords.removeAll()
        lapTable.reloadData()
    }
    
    @IBAction func start(sender: AnyObject) {
        if active == false {
            active = true
            timer = NSTimer.scheduledTimerWithTimeInterval(0.001, target: self, selector: Selector("updateUI"), userInfo: nil, repeats: true)
            watch.start()
            startPauseButton.title = "Stop"
        } else {
            active = false
            timer.invalidate()
            watch.stop()
            updateUI()
            startPauseButton.title = "Start"
        }
    }
    
    @IBAction func lap(sender: AnyObject) {
        updateUI()
        lapRecords.append(timeLabel.text!)
        lapTable.reloadData()
    }
    
    func updateUI() {
        let time = watch.elapsedTimeInterval
        let hours = Int(time / 3600)
        let minutes = Int((time / 60) % 60)
        let seconds = Int(time % 60)
        let milliseconds = Int((time % 1) * 1000)
        timeLabel.text = String(format: "%02d:%02d:%02d.%03d", hours, minutes, seconds, milliseconds)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lapRecords.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .Default, reuseIdentifier: "Cell")
        let lapNum = lapRecords.count - indexPath.row - 1
        cell.textLabel?.text = String(format: "Lap %d: ", lapNum + 1) + lapRecords[lapNum]
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        timeLabel.font = UIFont.monospacedDigitSystemFontOfSize(31, weight: UIFontWeightRegular)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

