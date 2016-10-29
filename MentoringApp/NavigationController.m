//
//  NavigationController.m
//  MentoringApp
//
//  Created by apple on 10/2/16.
//  Copyright © 2016 OlegKasarin. All rights reserved.
//

#import "NavigationController.h"

@interface NavigationController ()

@end

@implementation NavigationController

- (void)viewDidLoad {
    NSLog(@"NavigationController viewDidLoad");
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"NavigationController viewWillAppear");
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"NavigationController viewDidAppear");
    /*
    UIViewController* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"OrangeVC"];
    [self pushViewController:vc animated:YES];
     */
    [super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
