//
//  AppDelegate.m
//  NSArray
//
//  Created by macbook air on 19/03/2018.
//  Copyright © 2018 Lytkin Artem. All rights reserved.
//

#import "AppDelegate.h"

#include "ASObject.h"
#include "Child.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

  /*
  NSArray *array = [[NSArray alloc] initWithObjects:@"String 1", @"String 2", nil];
  
  for (NSString *string in array) {
    NSLog(@"%@", string);
  }
  */
  
  ASObject *obj1 = [[ASObject alloc] init];
  Child *obj2 = [[Child alloc] init];
  ASObject *obj3 = [[ASObject alloc] init];
  
  obj1.name = @"Mathew";
  obj2.name = @"Petr";
  obj2.lastName = @"Petrov";
  [obj3 setName: @"Yakov"];
  
  NSArray *array = [NSArray arrayWithObjects:obj1, obj2, obj3, nil];
  
  for (ASObject *obj in array) {
    NSLog(@"object name = %@", obj.name);
    [obj action];
    
    if ([obj isKindOfClass:[Child class]]) {
      NSLog(@"Last name = %@", ((Child *)obj).lastName);
    }
  }
  
  return YES;
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
