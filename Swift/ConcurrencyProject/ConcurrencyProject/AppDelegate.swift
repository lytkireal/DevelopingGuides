//
//  AppDelegate.swift
//  ConcurrencyProject
//
//  Created by macbook air on 12/04/2018.
//  Copyright © 2018 Lytkin Artem. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {



  func applicationDidFinishLaunching(_ aNotification: Notification) {
    // serial queue
    let mainQueue = DispatchQueue.main
    
    // concurrent queues
    let userInteractiveQueue = DispatchQueue.global(qos: .userInteractive)
    let userInitiatedQueue = DispatchQueue.global(qos: .userInitiated)
    let utilityQueue = DispatchQueue.global(qos: .utility)
    let backgroundQueue = DispatchQueue.global(qos: .background)
    
    let lastQueue = DispatchQueue(label: "com.example.serial-queue",
                                  attributes: [.concurrent, .initiallyInactive])
    
    let firstQueue = DispatchQueue(label: "queue1", qos: DispatchQoS.background)
    
    // default
    let defaultQueue = DispatchQueue.global()
    
    func task (_ symbol: String) {
      for i in 1...10 {
        print("\(symbol) \(i) . Priority = \(qos_class_self().rawValue)")
      }
    }
    
    func taskHigh(_ symbol: String) {
      print("\(symbol) High priority = \(qos_class_self().rawValue)")
    }
    
    
    userInitiatedQueue.sync {
      
      
      firstQueue.sync {
        task("😲")
      }
      
      task("😈")
    }
  }

  func applicationWillTerminate(_ aNotification: Notification) {
    // Insert code here to tear down your application
  }


}

