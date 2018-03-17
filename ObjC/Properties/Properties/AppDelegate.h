//
//  AppDelegate.h
//  Properties
//
//  Created by macbook air on 10/03/2018.
//  Copyright © 2018 Lytkin Artem. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ASBoxer;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (copy, nonatomic, getter=getBoxer) ASBoxer *boxer;
//@property (weak, nonatomic) ASBoxer *boxer;
//@property (weak, nonatomic) ASBoxer *boxer;

@end

