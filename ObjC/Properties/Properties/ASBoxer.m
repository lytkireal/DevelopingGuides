//
//  ASBoxer.m
//  Properties
//
//  Created by macbook air on 10/03/2018.
//  Copyright © 2018 Lytkin Artem. All rights reserved.
//

#import "ASBoxer.h"

@interface ASBoxer ()

@property (assign, nonatomic) NSInteger nameCount;

@end

@implementation ASBoxer

@synthesize name = _name;

- (instancetype)init
{
  self = [super init];
  if (self) {
    NSLog(@"ASBoxer is created.");
    self.nameCount = 0;
    self.name = @"Default";
    self.age = 30;
    self.height = 1.75f;
    self.weight = 75.f;
  }
  return self;
}

- (void)dealloc {
  NSLog(@"-> object is deallocated");
}

- (id)copyWithZone:(NSZone *)zone {
  ASBoxer *boxer = [[ASBoxer alloc] init];
  boxer.name = [self.name copy];
  boxer.age = self.age;
  boxer.height = self.height;
  boxer.weight = self.weight;
  return boxer;
}

- (void)setName:(NSString *) inputName {
  //NSLog(@"setter is called");
 
  _name = inputName;
}

- (NSString *)name {
  
  self.nameCount++;
  
  NSLog(@"name getter is called %ld times", self.nameCount);
  
  return _name;
}

- (NSInteger)age {
  NSLog(@"age getter is called");
  return _age;
}

- (NSInteger)howOldAreYou {
  return self.age;
}

@end
