//
//  ViewController.m
//  Window
//
//  Created by macbook air on 08/03/2018.
//  Copyright © 2018 Lytkin Artem. All rights reserved.
//

#import "ViewController.h"
#import "IndoorsEngineWindow.h"
#import "Indoors3DEngineViewController.h"

@interface ViewController ()

//@property (strong, nonatomic) UIWindow *window;

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)makeWindowButtonTapped:(id)sender {
  IndoorsEngineWindow *window = [IndoorsEngineWindow sharedInstance];
  CGRect frame = [[UIScreen mainScreen] bounds];
  CGFloat width = CGRectGetWidth(frame);
  CGFloat height = CGRectGetHeight(frame);
  CGFloat x = CGRectGetMinX(frame);
  CGFloat y = CGRectGetMinY(frame) + 100;
  
  window.frame = CGRectMake(x, y, width, height);
  Indoors3DEngineViewController *viewController = Indoors3DEngineViewController.alloc.init;
  viewController.view.frame = UIScreen.mainScreen.bounds;
  viewController.view.backgroundColor = UIColor.magentaColor;
  viewController.overlayWindow = window;
  window.rootViewController = viewController;
  window.hidden = false;
}

@end
