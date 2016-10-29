//
//  SecondViewController.m
//  MentoringApp
//
//  Created by apple on 9/25/16.
//  Copyright © 2016 OlegKasarin. All rights reserved.
//

#import "SecondViewController.h"
#import "NavigationController.h"

@interface SecondViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *actionBtn;
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)actionBtn:(UIButton *)sender {
    if (self.navigationController==nil) {
        [self dismissViewControllerAnimated:YES completion:nil];
    } else {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

@end
