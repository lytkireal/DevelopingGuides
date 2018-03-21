//
//  AppDelegate.m
//  DataTypes
//
//  Created by macbook air on 19/03/2018.
//  Copyright © 2018 Lytkin Artem. All rights reserved.
//

#import "AppDelegate.h"
#import "ASStudent.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  
  /*
  BOOL boolVar = YES;
  NSInteger intVal = 200;
  NSUInteger uIntVal = 40;
  CGFloat floatVal = 39.5f;
  double doubleVar = 5;
  
  NSNumber *boolObject = [NSNumber numberWithBool:boolVar];
  NSNumber *intObject = [NSNumber numberWithInteger:intVal];
  NSNumber *uIntObject = [NSNumber numberWithUnsignedInteger:uIntVal];
  NSNumber *floatObject = [NSNumber numberWithFloat:floatVal];
  NSNumber *doubleObject = [NSNumber numberWithDouble:doubleVar];
  
  NSArray *arr = [NSArray arrayWithObjects:boolObject, intObject, uIntObject, floatObject, doubleObject, nil];

  
  NSLog(@"boolVar = %d, intVal = %ld, uIntVal = %lu, floatVal = %f, doubleVar = %f", boolVar, (long)intVal, (unsigned long)uIntVal, floatVal, doubleVar);
  NSLog(@"boolVar = %d, intVal = %ld, uIntVal = %ld, floatVal = %f, doubleVar = %f",
        [[arr objectAtIndex:0] boolValue],
        [[arr objectAtIndex:1] integerValue],
        [[arr objectAtIndex:1] unsignedIntegerValue],
        [[arr objectAtIndex:1] floatValue],
        [[arr objectAtIndex:1] doubleValue]);
  */
  
  /*
  ASStudent *studentA = [[ASStudent alloc] init];
  studentA.name = @"Best Student";
  
  
  ASStudent *studentB = studentA;
  studentB.name = @"Bad student";
  
  printf("-> %s\n", [studentA.name UTF8String]);
  */
  
  
  /*
  NSInteger a = 24;  
  NSLog(@"a = %ld", a);
  
  NSInteger b = a;
  
  b = 5;
  NSLog(@"b = %ld", b);
  
  NSInteger *c = &a;
  NSLog(@"%p", &a);
  *c = 8;
  NSLog(@"a = %ld", a);
  
  [self test:a testVar:c];
  
  NSLog(@"a = %ld", a);
  */
  
  /*
  ASStudent *student = [[ASStudent alloc] init];
  student.gender = ASGenderMale;
  */
  /*
  // @TODO: - Structures
  CGPoint point;
  point.x = 10.f;
  point.y = 100.f;
  
  CGSize size;
  size.height = 200.4f;
  size.width = 100.5f;
  
  CGRect rect;
  rect.origin = point;
  rect.size = size;
  */
  
  /*
  CGPoint point1 = CGPointMake(0, 5);
  CGPoint point2 = CGPointMake(1, 5);
  CGPoint point3 = CGPointMake(3, 5);
  CGPoint point4 = CGPointMake(5, 10);
  CGPoint point5 = CGPointMake(4, 8);
  CGPoint point6 = CGPointMake(8, 1);
  
  NSArray *array2 = [NSArray arrayWithObjects:
                     [NSValue valueWithCGPoint:point1],
                     [NSValue valueWithCGPoint:point2],
                     [NSValue valueWithCGPoint:point3],
                     [NSValue valueWithCGPoint:point4],
                     [NSValue valueWithCGPoint:point5],
                     [NSValue valueWithCGPoint:point6],
                     nil];
  
  for (int i = 0; i < array2.count; i++) {
    NSLog(@"%d, %@", i, array2[i]);
  }
  
  for (NSValue *value in array2) {
    CGPoint point = [value CGPointValue];
    NSLog(@"%@", NSStringFromCGPoint(point));
  }
  */
  
  return YES;
}

- (int)test:(NSInteger) test testVar:(NSInteger *)testPointer {
  
  *testPointer += 200;
  
  test += 10;
  
  return (int)test;
}


@end


































