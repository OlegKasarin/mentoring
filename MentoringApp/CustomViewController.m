//
//  CustomViewController.m
//  MentoringApp
//
//  Created by apple on 9/25/16.
//  Copyright © 2016 OlegKasarin. All rights reserved.
//

#import "CustomViewController.h"
#import "SecondViewController.h"
#import "NavigationController.h"
#import "ViewCon.h"

@interface CustomViewController ()

@end

@implementation CustomViewController

- (void)loadView {
    NSLog(@"CustomViewController loadView");
    [super loadView];
}

- (void)viewDidLoad {
    NSLog(@"CustomViewController viewDidLoad");
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"CustomViewController viewWillAppear");
    self.view.backgroundColor = [UIColor orangeColor];
    [super viewWillAppear:animated];
}
- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"CustomViewController viewDidAppear");
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    NSLog(@"CustomViewController viewWillDisappear");
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
    NSLog(@"CustomViewController viewDidDisappear");
    //self.view = nil;
    [super viewDidDisappear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)buttonAction:(UIButton *)sender {
    NSLog(@"CustomViewController buttonAction");
    SecondViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"SecondViewController"];
    vc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    vc.modalPresentationStyle = UIModalPresentationFormSheet;
    [self presentViewController:vc animated:YES completion:nil];
    //[self showViewController:vc sender:nil]; -- ??
    /*
    typedef enum {
     UIModalTransitionStyleCoverVertical = 0,
     UIModalTransitionStyleFlipHorizontal,
     UIModalTransitionStyleCrossDissolve,
     UIModalTransitionStylePartialCurl,
     } UIModalTransitionStyle;
    //
    typedef NS_ENUM(NSInteger, UIModalPresentationStyle) {
        UIModalPresentationFullScreen = 0,
        UIModalPresentationPageSheet NS_ENUM_AVAILABLE_IOS(3_2) __TVOS_PROHIBITED,
        UIModalPresentationFormSheet NS_ENUM_AVAILABLE_IOS(3_2) __TVOS_PROHIBITED,
        UIModalPresentationCurrentContext NS_ENUM_AVAILABLE_IOS(3_2),
        UIModalPresentationCustom NS_ENUM_AVAILABLE_IOS(7_0),
        UIModalPresentationOverFullScreen NS_ENUM_AVAILABLE_IOS(8_0),
        UIModalPresentationOverCurrentContext NS_ENUM_AVAILABLE_IOS(8_0),
        UIModalPresentationPopover NS_ENUM_AVAILABLE_IOS(8_0) __TVOS_PROHIBITED,
        UIModalPresentationNone NS_ENUM_AVAILABLE_IOS(7_0) = -1,
    };
    */
}

- (IBAction)displayNavigVC:(UIButton *)sender {
    NavigationController* navC = [self.storyboard instantiateViewControllerWithIdentifier:@"navigationController"];
    [self presentViewController:navC animated:YES completion:nil];
}
- (IBAction)displayTabBar:(UIButton *)sender {
    UITabBarController* tabBarVC = [UITabBarController new];
    tabBarVC.view.backgroundColor = [UIColor redColor];

    UIViewController* xibVC = [[UIViewController alloc] initWithNibName:@"XibViewController" bundle:nil];
    [xibVC.tabBarItem setTitle:@"XIB"];

    UIViewController* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"SecondViewController"];
    [vc.tabBarItem setTitle:@"STORYBOARD"];
    
    UIViewController* uivc = [UIViewController new];
    uivc.view.backgroundColor = [UIColor yellowColor];
    [uivc.tabBarItem setTitle:@"CODE"];
    
    ViewCon* viewCon = [ViewCon new];
    [viewCon.tabBarItem setTitle:@"Custom"];
    
    tabBarVC.viewControllers = @[xibVC, vc, uivc, viewCon];

    [self presentViewController:tabBarVC animated:YES completion:nil];
}

- (IBAction)addChildVC:(UIButton *)sender {
    ViewCon* vv = [ViewCon new];
    [self addChildViewController:vv];
    vv.view.frame = self.view.frame;
    [self.view addSubview: vv.view];
    [vv didMoveToParentViewController:self];
}
@end
