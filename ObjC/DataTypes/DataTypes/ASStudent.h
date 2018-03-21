//
//  ASStudent.h
//  DataTypes
//
//  Created by macbook air on 19/03/2018.
//  Copyright © 2018 Lytkin Artem. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
  ASGenderMale,
  ASGenderFemale
} ASGender;

//typedef NSInteger workout;

@interface ASStudent : NSObject

@property (strong, nonatomic) NSString *name;
@property (assign, nonatomic) ASGender gender;

@end
