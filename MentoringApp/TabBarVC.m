//
//  TabBarVC.m
//  MentoringApp
//
//  Created by apple on 10/4/16.
//  Copyright © 2016 OlegKasarin. All rights reserved.
//

#import "TabBarVC.h"

@interface TabBarVC ()

@end

@implementation TabBarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    UIViewController* content = [self.storyboard instantiateViewControllerWithIdentifier:@"customVC"];
    [self addChildViewController:content];
    //content.view.frame = [self frameForContentController];
    //[self.view addSubview:self.currentClientView];
    [content didMoveToParentViewController:self];
    
    [self presentViewController:content animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
