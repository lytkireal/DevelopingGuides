//
//  Developer.m
//  Protocols
//
//  Created by macbook air on 21/03/2018.
//  Copyright © 2018 Lytkin Artem. All rights reserved.
//

#import "Developer.h"

@implementation Developer

- (void)work {
  
}


#pragma mark - Patient

- (BOOL)areYouOk {
  
  bool ok = arc4random() % 2;
  
  NSLog(@"Is developer %@ ok? %@", self.name, ok ? @"YES" : @"NO");
  
  return ok;
}

- (void)takePill {
  NSLog(@"Developer takes %@ a pill.", self.name);
}

- (void)takeShot {
  NSLog(@"Developer takes %@ a shot.", self.name);
}

@end
