//
//  Indoors3DEngineViewController.m
//  Window
//
//  Created by macbook air on 08/03/2018.
//  Copyright © 2018 Lytkin Artem. All rights reserved.
//

#import "Indoors3DEngineViewController.h"

@interface Indoors3DEngineViewController ()

@end

@implementation Indoors3DEngineViewController

- (void)dealloc {
  NSLog(@"Indoors3DEngineViewController was deallocated");
}

- (void)viewDidLoad {
  [super viewDidLoad];
  
  UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 200, 100)];
  button.backgroundColor = UIColor.brownColor;
  [button setTitle:@"Close game" forState:UIControlStateNormal];
  [button addTarget:self action:@selector(closeGame) forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:button];
}

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
  UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
  NSLog(@"%@", NSStringFromClass(window.class));
}

- (void)closeGame {
  _overlayWindow.hidden = YES;
  _overlayWindow.rootViewController = nil;
}

@end
