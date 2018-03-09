//
//  ChildObject.m
//  Methods
//
//  Created by macbook air on 09/03/2018.
//  Copyright © 2018 Lytkin Artem. All rights reserved.
//

#import "ChildObject.h"

@implementation ChildObject

- (instancetype)init
{
  id result = [super init];
  if (self == result) {
    NSLog(@"Instance of ChildObject is initialized.");
  }
  return self;
}

- (NSString *)saySomeNumberString {
  return @"lalala";
}

- (NSString *)saySomething {
  return [super saySomeNumberString];
}

@end
