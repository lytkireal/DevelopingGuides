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
    safeString.addText(string: symbol)
    usualString.append(symbol)
  }
}

func taskHigh(_ symbol: String) {
  print("\(symbol) High priority = \(qos_class_self().rawValue)")
  safeString.addText(string: symbol)
  usualString.append(symbol)
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
// Pattern №3 - DispatchGroup usage
/*
class ViewWith4Image: UIView {
  
  public var image0: UIImageView
  public var image1: UIImageView
  public var image2: UIImageView
  public var image3: UIImageView
  
  public var image4: UIImageView
  public var image5: UIImageView
  public var image6: UIImageView
  public var image7: UIImageView
  
  public var imageViews: [UIImageView]
  
  override init(frame: CGRect) {
    image0 = UIImageView(frame: CGRect(x: 0, y: 0, width: frame.width/4, height: frame.height/4))
    image1 = UIImageView(frame: CGRect(x: frame.width/4, y: 0, width: frame.width/4, height: frame.height/4))
    image2 = UIImageView(frame: CGRect(x: 0, y: frame.height/4, width: frame.width/4, height: frame.height/4))
    image3 = UIImageView(frame: CGRect(x: frame.width/4, y: frame.height/4, width: frame.width/4, height: frame.height/4))
    
    image4 = UIImageView(frame: CGRect(x: 0, y: frame.height/2, width: frame.width/4, height: frame.height/4))
    image5 = UIImageView(frame: CGRect(x: frame.width/4, y: frame.height/2, width: frame.width/4, height: frame.height/4))
    image6 = UIImageView(frame: CGRect(x: 0, y: frame.height * 3/4, width: frame.width/4, height: frame.height/4))
    image7 = UIImageView(frame: CGRect(x: frame.width * 1/4, y: frame.height * 3/4, width: frame.width/4, height: frame.height/4))
    
    imageViews = [image0, image1, image2, image3, image4, image5, image6, image7]
    
    super.init(frame: frame)
    
    self.addSubview(image0)
    self.addSubview(image1)
    self.addSubview(image2)
    self.addSubview(image3)
    self.addSubview(image4)
    self.addSubview(image5)
    self.addSubview(image6)
    self.addSubview(image7)
    
    self.backgroundColor = UIColor.blue.withAlphaComponent(0.5)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

let view = ViewWith4Image(frame: CGRect(x: 0, y: 0, width: 400, height: 400))

PlaygroundPage.current.liveView = view

// Data model:
var imageURLs: [String] =
  [
    "http://www.planetware.com/photos-large/F/france-paris-eiffel-tower.jpg",
    "http://adriatic-lines.com/wp-content/uploads/2015/04/canal-of-Venice.jpg",
    "http://bestkora.com/IosDeveloper/wp-content/uploads/2016/12/Screen-Shot-2017-01-17-at-9.33.52-PM.png",
    "http://www.jpl.nasa.gov/images/cassini/20090202/pia03883-full.jpg",
    "http://www.planetware.com/photos-large/F/france-paris-eiffel-tower.jpg",
    "http://adriatic-lines.com/wp-content/uploads/2015/04/canal-of-Venice.jpg",
    "http://bestkora.com/IosDeveloper/wp-content/uploads/2016/12/Screen-Shot-2017-01-17-at-9.33.52-PM.png",
    "http://www.picture-newsletter.com/arctic/arctic-12.jpg"
]

var images: [UIImage] = []

let myDispatchGroup = DispatchGroup()
*/

/*
for i in 0...1
{
  DispatchQueue.global().async(group: myDispatchGroup)
  {
    if let url = URL(string: imageURLs[i])
    {
      let data = try? Data(contentsOf: url)
      
      if let imageData = data
      {
        let image = UIImage(data: imageData)
        images.append(image!)
        print("Finished index = \(i), priority = \(qos_class_self().rawValue)")
      }
    }
  }
}

for i in 2...3
{
  DispatchQueue.global(qos: .userInitiated).async(group: myDispatchGroup)
  {
    if let url = URL(string: imageURLs[i])
    {
      let data = try? Data(contentsOf: url)
      
      if let imageData = data
      {
        let image = UIImage(data: imageData)
        images.append(image!)
        print("Finished index = \(i), priority = \(qos_class_self().rawValue)")
      }
    }
  }
}

let workItem = DispatchWorkItem {
  for i in 0...3 {
    view.imageViews[i].image = images[i]
  }
}

myDispatchGroup.notify(queue: DispatchQueue.main, work: workItem)

*/
/*
let workItem = DispatchWorkItem {
  for i in 0...3 {
    view.imageViews[i].image = images[i]
  }
}

func asyncImageLoad (imageURL: URL,
                     runQueue: DispatchQueue,
                     completionQueue: DispatchQueue,
                     completionBlock: @escaping(UIImage?, Error?) -> () ) {
  runQueue.async {
    do {
      let data = try Data(contentsOf: imageURL)
      let image = UIImage(data: data)
      completionQueue.async {
        completionBlock(image, nil)
      }
    }
    catch let error
    {
      completionQueue.async {
        completionBlock(nil, error)
      }
    }
  }
}

func asyncGroup() {
  print("Group of async tasks")
  let group = DispatchGroup()
  
  for i in 0...1 {
    group.enter()
    asyncImageLoad(imageURL: URL(string:imageURLs[i])!,
                   runQueue: DispatchQueue.global(),
                   completionQueue: DispatchQueue.main,
                   completionBlock: { (receivedImage, error) in
                    guard let image = receivedImage else {return}
                    images.append(image)
                    group.leave()
    })
  }
  
  for i in 2...3 {
    DispatchQueue.global(qos: .userInitiated).async(group: group) {
      if let url = URL(string: imageURLs[i]) {
        if let data = try? Data(contentsOf: url) {
          let image = UIImage(data: data)
          images.append(image!)
        }
      }
    }
  }
  
  group.notify(queue: mainQueue, work: workItem)
}

func asyncUsual() {
  print("Usual of async tasks")
  for i in 4...7 {
    let urlOptional = URL(string: imageURLs[i-4])
    guard let url = urlOptional else {return}
    let urlRequest = URLRequest(url: url)
    let task = URLSession.shared.dataTask(with: urlRequest, completionHandler: { (data, response, error) in
      if let imageData = data {
        let image = UIImage(data: imageData)
        DispatchQueue.main.async {
          view.imageViews[i].image = image
        }
      }
    })
    
    task.resume()
  }
}

asyncGroup()
asyncUsual()
*/

//--------------------------------------------------------------------------------------------------------------------------------------------------------

// Patter №4 - thread-safe variables
PlaygroundPage.current.needsIndefiniteExecution = true

var view2 = QueuesView (frame: CGRect(x: 0, y: 0, width: 600, height: 500))
view2.numberLines = 10
view2.backgroundColor = UIColor.lightGray

view2.labels_[0].text  =  "     СИНХРОННОСТЬ  global (qos: .userInitiated) к playground"
view2.labels_[1].text  =  "     АСИНХРОННОСТЬ  global (qos: .userInitiated) к playground"
view2.labels_[2].text  =  "     СИНХРОННОСТЬ   .serial  к playground"
view2.labels_[3].text  =  "     АСИНХРОННОСТЬ  .serial  к playground"
view2.labels_[4].text  =  "     .serial Q1 - .userInitiated "
view2.labels_[5].text  =  "     .serial     Q1 - .userInitiated Q2 - .background"
view2.labels_[6].text  =  "     .concurrent Q - .userInitiated"
view2.labels_[7].text  =  "     .concurrent Q1 - .userInitiated  Q2 - .background"
view2.labels_[8].text  =  "     .concurrent Q1 - .userInitiated Q2 - .background asyncAfter (0.0)"
view2.labels_[9].text  =  "     .concurrent Q1 - .userInitiated Q2 - .background asyncAfter (0.1)"

PlaygroundPage.current.liveView = view2

var safeString = ThreadSafeString("")
var usualString = ""

// 1
print("-------------------------------------------------")
print("  Synchronicity .sync    ")
print("  Global .concurrent  Q1 - .userInitiated        ")
print("-------------------------------------------------")

safeString.setText(string: "")
usualString = ""

let duration0 = duration {
  userInitiatedQueue.sync {
    task("👮‍♀️")
  }
  task("👀")
}

sleep(1)
view2.labels[0].text = safeString.text + String(Float(duration0))
print("thread-safe = \(safeString)")
print("thread-unsafe = \(usualString)")


// 2
print("-------------------------------------------------")
print("  Asynchronicity .async    ")
print("  Global .concurrent  Q1 - .userInitiated        ")
print("-------------------------------------------------")

safeString.setText(string: "")
usualString = ""

let duration1 = duration {
  userInitiatedQueue.async {
    task("👮‍♀️")
  }
  task("👀")
}

sleep(1)
view2.labels[1].text = safeString.text + String(Float(duration1))
print("thread-safe = \(safeString.text)")
print("thread-unsafe = \(usualString)")

// 3
print("-------------------------------------------------")
print("  Synchronicity .sync    ")
print("  Private .serial  Q1 - no        ")
print("-------------------------------------------------")

safeString.setText(string: "")
usualString = ""

let myPrivateSerialQueue = DispatchQueue(label: "com.lytkin.myPrivateSerialQueue")

let duration2 = duration {
  myPrivateSerialQueue.sync {
    task("👮‍♀️")
  }
  task("👀")
}

sleep(1)
view2.labels[2].text = safeString.text + String(Float(duration2))
print("thread-safe = \(safeString.text)")
print("thread-unsafe = \(usualString)")

// 4
print("-------------------------------------------------")
print("  Asynchronicity .async    ")
print("  Private .serial  Q1 - no        ")
print("-------------------------------------------------")

safeString.setText(string: "")
usualString = ""

let duration3 = duration {
  myPrivateSerialQueue.async {
    task("👮‍♀️")
  }
  task("👀")
}

sleep(1)
view2.labels[3].text = safeString.text + String(Float(duration3))
print("thread-safe = \(safeString.text)")
print("thread-unsafe = \(usualString)")

// 5
print("-------------------------------------------------")
print("  Asynchronicity .async    ")
print("  Private .serial  Q1 - .userInitiated        ")
print("-------------------------------------------------")

safeString.setText(string: "")
usualString = ""

let myPrivateSerialUserInitiatedQueue = DispatchQueue(label: "com.lytkin.myPrivateConcurrentQueue", qos: .userInitiated)

let duration4 = duration {
  myPrivateSerialUserInitiatedQueue.async {
    task("👮‍♀️")
  }
  
  myPrivateSerialUserInitiatedQueue.async {
    task("👀")
  }
  
}

sleep(1)
view2.labels[4].text = safeString.text + String(Float(duration4))
print("thread-safe = \(safeString.text)")
print("thread-unsafe = \(usualString)")

// 6
print("-------------------------------------------------")
print("  Asynchronicity .async    ")
print("  Private .serial  Q1 - .userInitiated        ")
print("  Private .serial  Q2 - .background        ")
print("-------------------------------------------------")

safeString.setText(string: "")
usualString = ""

let myPrivateSerialBackgroundQueue = DispatchQueue(label: "com.lytkin.myPrivateConcurrentQueue", qos: .background)

let duration5 = duration {
  myPrivateSerialUserInitiatedQueue.async {
    task("👮‍♀️")
  }
  
  myPrivateSerialBackgroundQueue.async {
    task("👀")
  }
  
}

sleep(1)
view2.labels[5].text = safeString.text + String(Float(duration5))
print("thread-safe =   \(safeString.text)")
print("thread-unsafe = \(usualString)")

// 7
print("-------------------------------------------------")
print("  Asynchronicity .async    ")
print("  Private .concurrent  QoS - .userInitiated        ")
print("-------------------------------------------------")

safeString.setText(string: "")
usualString = ""

let myConcurrentUserInitiatedQueue = DispatchQueue(label: "com.lytkin.concQueue", qos: .userInitiated, attributes: .concurrent)

let duration6 = duration {
  myConcurrentUserInitiatedQueue.async {
    task("👮‍♀️")
  }
  
  myConcurrentUserInitiatedQueue.async {
    task("👀")
  }
}

sleep(1)
view2.labels[6].text = safeString.text + String(Float(duration5))
print("thread-safe =   \(safeString.text)")
print("thread-unsafe = \(usualString)")













