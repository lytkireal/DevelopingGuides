//
//  AppDelegate.m
//  Protocols
//
//  Created by macbook air on 21/03/2018.
//  Copyright © 2018 Lytkin Artem. All rights reserved.
//

#import "AppDelegate.h"
#import "Patient.h"
#import "Student.h"
#import "Dancer.h"
#import "Developer.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  
  dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
    Dancer *dancer1 = [[Dancer alloc] init];
    dancer1.name = @"dancer1";
    Dancer *dancer2 = [[Dancer alloc] init];
    dancer2.name = @"dancer2";
    
    Student *student1 = [[Student alloc] init];
    student1.name = @"student1";
    Student *student2 = [[Student alloc] init];
    student2.name = @"student2";
    Student *student3 = [[Student alloc] init];
    student3.name = @"student3";
    
    Developer *developer1 = [[Developer alloc] init];
    developer1.name = @"developer1";
    
    NSObject *fakeObject = [NSObject new];
    
    NSArray *patients = @[fakeObject,dancer1,dancer2,student1,student2,student3,developer1];
    
    for (id<Patient> patient in patients) {
      
      if ([patient conformsToProtocol:@protocol(Patient)]) {
        NSLog(@"Patient name = %@", patient.name);
        if ([patient respondsToSelector:@selector(howIsYourJob)]) {
          NSLog(@"How is your job? %@", [patient howIsYourJob]);
        }
        if (![patient areYouOk]) {
          [patient takePill];
          if (![patient areYouOk]) {
            [patient takeShot];
          }
        }
        
      } else {
        NSLog(@"fake!!!");
      }
      

    }
  });
  

  
  return YES;
}




@end
