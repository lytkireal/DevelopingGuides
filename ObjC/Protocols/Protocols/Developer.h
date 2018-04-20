//
//  Developer.h
//  Protocols
//
//  Created by macbook air on 21/03/2018.
//  Copyright © 2018 Lytkin Artem. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Patient.h"

@interface Developer : NSObject <Patient>

@property (assign, nonatomic) CGFloat experience;
@property (strong, nonatomic) NSString *name;

- (void)work;

@end
