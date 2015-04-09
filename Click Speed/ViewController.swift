//
//  ViewController.swift
//  Click Speed
//
//  Created by Zhijin Chen on 4/9/15.
//  Copyright (c) 2015 Zhijin Chen. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    var totalTime = 60
    var counter = 0
    var timeLeft = 0
    var isCounting = false
    var isEnd = false
    var timer : NSTimer = NSTimer()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.timeLeft = self.totalTime
        // Do any additional setup after loading the view.
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    override func viewDidAppear() {
        super.viewDidAppear()
        self.timeLeft = self.totalTime
        self.timeLabel.stringValue = String(self.totalTime)
    }
    
    func decreaseTime(){
        if self.timeLeft == 0 {
            self.timer.invalidate()
            self.isCounting = false
            self.isEnd = true
            return
        }
        self.timeLeft -= 1
        self.timeLabel.stringValue = String(self.timeLeft)
        
    }
    
    
   
    @IBOutlet weak var countLabel: NSTextField!
    @IBOutlet weak var timeLabel: NSTextField!
    
    @IBAction func clickPushed(sender: NSButton) {
        if self.isEnd {
            return
        }
        if !self.isCounting {
            self.timer = NSTimer.scheduledTimerWithTimeInterval(NSTimeInterval(1), target: self, selector: "decreaseTime", userInfo: nil, repeats: true)
            self.isCounting = true
        }
        
        counter += 1
        self.countLabel.stringValue = String(counter)
    }

    @IBAction func resetPushed(sender: NSButton) {
        counter = 0
        self.timeLeft = self.totalTime
        self.isEnd = false
        self.isCounting = false
        self.timer.invalidate()
        self.countLabel.stringValue = String(counter)
        self.timeLabel.stringValue = String(self.totalTime)

    }
}

