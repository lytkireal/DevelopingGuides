//
//  AppDelegate.m
//  Properties
//
//  Created by macbook air on 10/03/2018.
//  Copyright © 2018 Lytkin Artem. All rights reserved.
//

#import "AppDelegate.h"
#import "ASBoxer.h"

@interface AppDelegate ()
@property (strong) dispatch_queue_t myQueue;
@property (strong) NSOperationQueue *operationQueue;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

//  ASBoxer *boxer = [[ASBoxer alloc] init];
  /*
  boxer.name = @"Mike";
  boxer.age = 26;
  boxer.height = 1.96f;
  boxer.weight = 85.6f;
  */
  
  //boxer.nameCount = 0;
  
//  [boxer setName:@"Makunoichi"];
//  [boxer setAge:24];
//  [boxer setHeight:1.88f];
//  [boxer setWeight:85.f];
//
//  NSLog(@"age = %ld", [boxer howOldAreYou]);
//
//  NSLog(@"name - %@", boxer.name);
//  NSLog(@"name - %@", [boxer name]);
  
//  NSLog(@"name - %@", boxer.name);
//  NSLog(@"age - %ld", (long)boxer.age);
//  NSLog(@"height - %f", boxer.height);
//  NSLog(@"weight - %f", boxer.weight);
  
  
//  NSLog(@"name - %@", [boxer name]);
//  NSLog(@"age - %ld", (long)[boxer age]);
//  NSLog(@"height - %f", [boxer height]);
//  NSLog(@"weight - %f", [boxer weight]);
  
  _myQueue = dispatch_queue_create("lala", DISPATCH_QUEUE_CONCURRENT);
  _myQueue.accessibilityLabel = @"lala";
  
  _operationQueue = [[NSOperationQueue alloc] init];
  _operationQueue.accessibilityLabel = @"_operationQueue";
  _operationQueue.name = @"operationQueue.name";
  
  [_operationQueue addOperationWithBlock:^{
    //[self p_testObject];
  }];
  
  
  
  dispatch_async(_myQueue, ^{
    //[self p_testObject];
  });
  
  dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
    [self p_testObject];
  });
  
  NSLog(@"%@", [NSOperationQueue currentQueue].underlyingQueue);
  
  NSLog(@"test is over");
  
  return YES;
}

- (void)p_testObject {
  NSLog(@"QUEUE = %@", [NSOperationQueue currentQueue].name);
  NSLog(@"QUEUE = %@", [NSOperationQueue currentQueue].accessibilityLabel);
  NSLog(@"QUEUE = %@", [NSOperationQueue currentQueue].accessibilityAttributedLabel);
  NSLog(@"-> Queue = %s", dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL));
  
  NSLog(@"Running on %@ thread", _myQueue.accessibilityLabel);
  printf("-> %s\n", [[NSThread currentThread].accessibilityLabel UTF8String]);
  printf("-> hello\n");
  
  ASBoxer *object = [[ASBoxer alloc] init];
  NSLog(@"object address %p", object);
  self.boxer = object;
  NSLog(@"boxer address %p", _boxer);
}


- (void)applicationWillResignActive:(UIApplication *)application {
  // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
  // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
  // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
  // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
  // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
  // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
  // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
