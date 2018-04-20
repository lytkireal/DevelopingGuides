//
//  AppDelegate.m
//  DataTypes
//
//  Created by macbook air on 19/03/2018.
//  Copyright © 2018 Lytkin Artem. All rights reserved.
//

#import "AppDelegate.h"
#import "ASStudent.h"

typedef struct {
  float heightInMeters;
  int weightInKilos;
} Person;

float bodyMassIndex (Person person) {
  return person.weightInKilos / (person.heightInMeters * person.heightInMeters);
};

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
  

  // @MARK: - Struct
  /*
  typedef struct MyPoint {
    float w,x,y,z;
  } MyPoint;
  
  Person mikey;
  mikey.heightInMeters = 1.77f;
  mikey.weightInKilos = 75;
  
  Person aaron;
  aaron.heightInMeters = 1.99f;
  aaron.weightInKilos = 90;
  
  printf("->mikey is %.2f meters tall\n", mikey.heightInMeters);
  printf("mikey weighs %d kilograms\n", mikey.weightInKilos);
  printf("->aaron is %.2f meters tall\n", aaron.heightInMeters);
  printf("aaron weighs %d kilograms\n", mikey.weightInKilos);
  
  float bmi;
  bmi = bodyMassIndex(mikey);
  printf("mikey's bmi = %.2f\n", bmi);
  
  bmi = bodyMassIndex(aaron);
  printf("aaron's bmi = %.2f\n", bmi);
  */
  // *challenge
  long secondsSince1970 = time(NULL);
  printf("It has been %ld seconds since 1970\n", secondsSince1970);
  
  struct tm now;
  localtime_r(&secondsSince1970, &now);
  printf("The time is %d-%d-%d\n", now.tm_mday, now.tm_mon + 1, now.tm_year - 100 + 2000);
  
  return YES;
}

- (int)test:(NSInteger) test testVar:(NSInteger *)testPointer {
  
  *testPointer += 200;
  
  test += 10;
  
  return (int)test;
}


@end


































