//
//  benchmark.m
//  EnumaritionCollections
//
//  Created by macbook air on 08/04/2018.
//  Copyright © 2018 Lytkin Artem. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{
  @autoreleasepool
  {
    
    
    static const NSUInteger arrayItems = 100000000000;
    
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:arrayItems];
    for (int i = 0; i < arrayItems; i++) [array addObject:@(i)];
    array = [array copy];
    
    CFTimeInterval start = CFAbsoluteTimeGetCurrent();
    
    // Naive for loop
    for (NSUInteger i = 0; i < [array count]; i++)
    {
      id object = array[i];
    }
    
    CFTimeInterval forLoop = CFAbsoluteTimeGetCurrent();
    NSLog(@"For loop: %g", forLoop - start);
    
    // Optimized for loop
    NSUInteger count = [array count];
    for (NSUInteger i = 0; i <  count; i++)
    {
      id object = array[i];
    }
    
    CFTimeInterval forLoopWithCountVar = CFAbsoluteTimeGetCurrent();
    NSLog(@"Optimized for loop: %g", forLoopWithCountVar - forLoop);
    
    // NSEnumerator
    id obj = nil;
    NSEnumerator *enumerator = [array objectEnumerator];
    while ((obj = [enumerator nextObject]))
    {
      
    }
    
    CFTimeInterval enumeratorLoop = CFAbsoluteTimeGetCurrent();
    NSLog(@"Enumerator: %g", enumeratorLoop - forLoopWithCountVar);
    
    // Fast enumeration
    for (id object in array)
    {
      
    }
    
    CFTimeInterval forInLoop = CFAbsoluteTimeGetCurrent();
    NSLog(@"For…in loop: %g", forInLoop - enumeratorLoop);
    
    // Block enumeration
    [array enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
      
    }];
    
    CFTimeInterval enumerationBlock = CFAbsoluteTimeGetCurrent();
    NSLog(@"Enumeration block: %g", enumerationBlock - forInLoop);
    
    // Concurrent enumeration
    [array enumerateObjectsWithOptions:NSEnumerationConcurrent
                            usingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                              
                            }];
    
    CFTimeInterval concurrentEnumerationBlock = CFAbsoluteTimeGetCurrent();
    NSLog(@"Concurrent enumeration block: %g",
          concurrentEnumerationBlock - enumerationBlock);
  }
  return 0;
}
