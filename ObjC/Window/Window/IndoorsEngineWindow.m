//
//  IndoorsEngineWindow.m
//  Window
//
//  Created by macbook air on 08/03/2018.
//  Copyright © 2018 Lytkin Artem. All rights reserved.
//

#import "IndoorsEngineWindow.h"

@implementation IndoorsEngineWindow

- (instancetype)init {
  self = [super init];
  if (self) {
    
  }
  return self;
}

+ (instancetype)sharedInstance {
  static IndoorsEngineWindow *sharedInstance = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    sharedInstance = [IndoorsEngineWindow new];
  });
  return sharedInstance;
}

- (void)testMethod {

}

@end
