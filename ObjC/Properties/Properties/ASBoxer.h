//
//  ASBoxer.h
//  Properties
//
//  Created by macbook air on 10/03/2018.
//  Copyright © 2018 Lytkin Artem. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ASBoxer : NSObject

@property (strong, nonatomic) NSString *name;
@property (assign, nonatomic) NSInteger age;
@property (assign, nonatomic) CGFloat height;
@property (assign, nonatomic) CGFloat weight;

- (NSInteger)howOldAreYou;

@end
