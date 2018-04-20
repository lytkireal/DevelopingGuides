//
//  Patient.h
//  Protocols
//
//  Created by macbook air on 21/03/2018.
//  Copyright © 2018 Lytkin Artem. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Patient <NSObject>

@required
@property (strong, nonatomic) NSString *name;
- (BOOL)areYouOk;
- (void)takePill;
- (void)takeShot;

@optional
-(NSString *)howIsYourJob;


@end
