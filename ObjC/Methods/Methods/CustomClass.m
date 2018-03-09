//
//  CustomClass.m
//  Methods
//
//  Created by macbook air on 09/03/2018.
//  Copyright © 2018 Lytkin Artem. All rights reserved.
//

#import "CustomClass.h"

@implementation CustomClass

+ (void)methodOfClass {
  NSLog(@"Hello world from CustomClass's method of class");
}

- (instancetype)init
{
  self = [super init];
  if (self) {
    NSLog(@"Instance of Custom class is initialized.");
  }
  return self;
}

- (NSString *)saySomeNumberString {
  return [NSString stringWithFormat:@"%@", [NSDate date]];
}


- (NSString *)saySomething {
  
  NSString *string = [self saySomeNumberString];
  
  return string;
}


@end
