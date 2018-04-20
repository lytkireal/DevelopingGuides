//
//  Dancer.m
//  Protocols
//
//  Created by macbook air on 21/03/2018.
//  Copyright © 2018 Lytkin Artem. All rights reserved.
//

#import "Dancer.h"

@implementation Dancer

- (void)dance {
  
}

#pragma mark - Patient

- (BOOL)areYouOk {
  
  bool ok = arc4random() % 2;
  
  NSLog(@"Is dancer %@ ok? %@", self.name, ok ? @"YES" : @"NO");
  
  return ok;
}

- (void)takePill {
  NSLog(@"Dancer takes %@ a pill.", self.name);
}

- (void)takeShot {
  NSLog(@"Dancer takes %@ a shot.", self.name);
}



@end
