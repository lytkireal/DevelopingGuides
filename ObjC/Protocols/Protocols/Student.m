//
//  Student.m
//  Protocols
//
//  Created by macbook air on 21/03/2018.
//  Copyright © 2018 Lytkin Artem. All rights reserved.
//

#import "Student.h"

@implementation Student

- (void)study {
  
}

#pragma mark - Patient

- (BOOL)areYouOk {
  
  bool ok = arc4random() % 2;
  
  NSLog(@"Is Student %@ ok? %@", self.name, ok ? @"YES" : @"NO");
  
  return ok;
}

- (void)takePill {
  NSLog(@"Student takes %@ a pill.", self.name);
}

- (void)takeShot {
  NSLog(@"Student takes %@ a shot.", self.name);
}

- (NSString *)howIsYourJob {
  return @"My job is good!";
}

@end
