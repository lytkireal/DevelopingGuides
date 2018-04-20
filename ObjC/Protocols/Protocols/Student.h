//
//  Student.h
//  Protocols
//
//  Created by macbook air on 21/03/2018.
//  Copyright © 2018 Lytkin Artem. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Patient.h"

@interface Student : NSObject <Patient>

@property (strong, nonatomic) NSString *UniversityName;
@property (strong, nonatomic) NSString *name;

- (void)study;

@end
