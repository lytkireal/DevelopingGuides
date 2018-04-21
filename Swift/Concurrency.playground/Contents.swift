//: Playground - noun: a place where people can play

import UIKit
import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

//--------------------------------------------------------------------------------------------------------------------------------------------------------
// Expepirment №1 - Global Queues

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

//--------------------------------------------------------------------------------------------------------------------------------------------------------

//--------------------------------------------------------------------------------------------------------------------------------------------------------
// Expepirment №2 - Async and sync
/*
userInitiatedQueue.sync {
  
  firstQueue.async {
    task("😲")
  }
  task("😈")
}
*/

// Race Condition
/*
 let serialQueue = DispatchQueue(label: "com.lytkin.serialQueue")
 let concurrentQueue = DispatchQueue(label: "com.lytkin.serialQueue", attributes: .concurrent)
 
 var value = "🤠"
 func changeValue(variant: inout Int) {
 print("\(value)")
 sleep(1)
 print("\(value)")
 value = value + "😘"
 print("\(value) - \(variant)")
 }
 
 var variant = 1
 
 serialQueue.async {
 changeValue(variant: &variant)
 }
 
 variant = 2
 value = "😅"
 
 serialQueue.sync {
 changeValue(variant: &variant)
 }
 
 
 value = "🤗"
 print("\(value)")
 */

//--------------------------------------------------------------------------------------------------------------------------------------------------------

//--------------------------------------------------------------------------------------------------------------------------------------------------------
// Expepirment №4 - Serial Queues with QoS (Quality of Service)
/*
print("-------------------------------------------------")
print("       Private .serial  Q1 - .userInitiated      ")
print("                        Q2 - .background         ")
print("-------------------------------------------------")

private let mySerialQueue1 = DispatchQueue(label: "com.lytkin.mySerialQueue1", qos: .userInitiated)
private let mySerialQueue2 = DispatchQueue(label: "com.lytkin.mySerialQueue2", qos: .background)

mySerialQueue2.async { task("😈") }
mySerialQueue1.async { task("😎") }
sleep(1)

print("-------------------------------------------------")
print("       Private .serial  Q1 - .utility      ")
print("                        Q2 - .background         ")
print("-------------------------------------------------")

private let mySerialQueue11 = DispatchQueue(label: "com.lytkin.mySerialQueue11", qos: .utility)
private let mySerialQueue22 = DispatchQueue(label: "com.lytkin.mySerialQueue22", qos: .background)

mySerialQueue22.async { task("😈") }
mySerialQueue11.async { task("😎") }
sleep(1)

print("-------------------------------------------------")
print("       AsyncAfter (userInteractive) on Q2        ")
print("       Private .serial  Q1 - .utility            ")
print("                        Q2 - .background         ")
print("-------------------------------------------------")

private let serialUtilityQueue = DispatchQueue(label: "com.lytkin.serialUtilityQueue", qos: .utility)
private let serialBackgroundQueue = DispatchQueue(label: "com.lytkin.serialBackgroundQueue", qos: .background)

serialBackgroundQueue.asyncAfter(deadline: .now() + 0.1, qos: .userInteractive) {
  task("😈")
}
serialUtilityQueue.async { task("😡") }
sleep(1)
*/
//--------------------------------------------------------------------------------------------------------------------------------------------------------

//--------------------------------------------------------------------------------------------------------------------------------------------------------
// Expepirment №5 - Private Concurrent Queues
/*
print("-------------------------------------------------")
print("    Private .concurrent  Q - .userInitiated      ")
print("-------------------------------------------------")

private let workerQueue = DispatchQueue(label: "com.lytkin.workerQueue", qos: .userInitiated, attributes: .concurrent)

workerQueue.async { task("😈") }
workerQueue.async { task("😎") }
sleep(1)

print("-------------------------------------------------")
print("    Private .concurrent  Q1 - .userInitiated     ")
print("            .concurrent  Q2 - .background        ")
print("-------------------------------------------------")

private let workerQueue1 = DispatchQueue(label: "com.lytkin.workerQueue1", qos: .utility, attributes: .concurrent)
private let workerQueue2 = DispatchQueue(label: "com.lytkin.workerQueue2", qos: .background, attributes: .concurrent)

workerQueue2.async { task("😈") }
workerQueue1.async { task("😎") }
sleep(1)

print("--------------------------------------------------------------------")
print("    Concurrent queue with execution after delay                     ")
print("    Private .concurrent  Q1 - .userInitiated .initiallyInactive     ")
print("--------------------------------------------------------------------")

private let workerQueueWithDelay = DispatchQueue(label: "com.lytkin.workerQueueWithDelay", qos: .utility, attributes: [.concurrent, .initiallyInactive])
workerQueueWithDelay.async { task("😈") }
workerQueueWithDelay.async { task("😎") }
sleep(1)

print("--------------------------------------------------------")
print("    Tasks are executed on concurrent queue after delay  ")
print("--------------------------------------------------------")
workerQueueWithDelay.activate()
sleep(1)
*/
//--------------------------------------------------------------------------------------------------------------------------------------------------------

//--------------------------------------------------------------------------------------------------------------------------------------------------------
// Expepirment №6 - DispatchWorkItem

/*
let highPriorityItem = DispatchWorkItem(qos: .userInteractive) {
  taskHigh("👺")
}


print("-------------------------------------------------")
print("    Private .concurrent  Q1 - .userInitiated     ")
print("            .concurrent  Q2 - .background        ")
print("-------------------------------------------------")

private let workerQueue11 = DispatchQueue(label: "com.lytkin.workerQueue11", qos: .utility, attributes: .concurrent)
private let workerQueue22 = DispatchQueue(label: "com.lytkin.workerQueue22", qos: .background, attributes: .concurrent)

workerQueue22.async { task("😈") }
workerQueue11.async { task("😎") }
workerQueue22.async(execute: highPriorityItem)
workerQueue11.async(execute: highPriorityItem)

sleep(1)
*/
let eiffelImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
let imageUrl: URL = URL(string: "http://www.planetware.com/photos-large/F/france-paris-eiffel-tower.jpg")!

PlaygroundPage.current.liveView = eiffelImageView

let queue = DispatchQueue.global(qos: .utility)

//queue.async {
//  if let data = try? Data(contentsOf: imageUrl) {
//    DispatchQueue.main.async {
//      let image = UIImage(data: data)
//      eiffelImageView.image = image
//      print("Show image data")
//    }
//    print("Did download image data")
//  }
//}

/*
func fetchImage2() {
  var data: Data?
  let queue = DispatchQueue.global(qos: .utility)
  
  let workItem = DispatchWorkItem { data = try? Data(contentsOf:imageUrl) }
  
  queue.async(execute: workItem)
  
  workItem.notify(queue: DispatchQueue.main) {
    if let imageData = data {
      eiffelImageView.image = UIImage(data: imageData)
    }
  }
}

fetchImage2()
*/
 
//--------------------------------------------------------------------------------------------------------------------------------------------------------
// Pattern №1 - Variants of a code that loads an image from network

// 1 - Classic variant
/*
func fetchImage1() {
  let queue = DispatchQueue.global(qos: .utility)
  queue.async {
    print("queue's priority = \(qos_class_self().rawValue)")
    if let imageData = try? Data(contentsOf: imageUrl) {
      DispatchQueue.main.async {
        eiffelImageView.image = UIImage(data: imageData)
        print("queue's priority = \(qos_class_self().rawValue)")
      }
    }
  }
}

fetchImage1()
*/

// 2 - URLSession
/*
func fetchImage2() {
  let task = URLSession.shared.dataTask(with: imageUrl) { (data, response, error) in
    print("queue's priority = \(qos_class_self().rawValue)")
    if (error == nil) {
      if let imageData = data {
        DispatchQueue.main.async {
          eiffelImageView.image = UIImage(data: imageData)
        }
      }
    } else {
      print("Error message - \(String(describing: error?.localizedDescription))")
      return
    }
  }
  task.resume()
}

fetchImage2()
*/

// 3 - DispatchWorkItem
/*
func fetchImage3() {
  var data: Data?
  let queue = DispatchQueue.global(qos: .utility)
  
  let workItem = DispatchWorkItem {
    data = try? Data(contentsOf: imageUrl)
    print("WorkItem is on queue with priority = \(qos_class_self().rawValue)")
  }
  
  queue.async(execute: workItem)
  
  workItem.notify(queue: DispatchQueue.main) {
    if let imageData = data {
      print("Callback priority = \(qos_class_self().rawValue)")
      eiffelImageView.image = UIImage(data: imageData)
    }
  }
}

fetchImage3()
*/

// 4 - own async func
/*
func asyncImageLoad(url: URL,
                    runQueue: DispatchQueue,
                    completionQueue: DispatchQueue,
                    completion: @escaping(UIImage?, Error?) -> () ) {
  
  runQueue.async {
    
    do
    {
      let data = try Data(contentsOf: url)
      
      completionQueue.async {
        completion(UIImage(data: data), nil)
      }
    }
    catch let error
    {
      completionQueue.async {
        completion(nil, error)
      }
    }
    
  }

}

func fetchImage4() {
  let queue = DispatchQueue.global(qos: .utility)
  asyncImageLoad(url: imageUrl, runQueue: queue, completionQueue: DispatchQueue.main) { (result, error) in
    guard let image = result else {return}
    eiffelImageView.image = image
  }
}
*/

//--------------------------------------------------------------------------------------------------------------------------------------------------------

//--------------------------------------------------------------------------------------------------------------------------------------------------------
// Pattern №2 - Concerns of image loading via a network for UITableView and UICollectionView by GCD









//--------------------------------------------------------------------------------------------------------------------------------------------------------





































