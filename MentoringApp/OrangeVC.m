//
//  OrangeVC.m
//  MentoringApp
//
//  Created by apple on 09.10.16.
//  Copyright © 2016 OlegKasarin. All rights reserved.
//

#import "OrangeVC.h"

@interface OrangeVC ()

@end

@implementation OrangeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)Popbtn:(UIButton *)sender {
    if (self.navigationController) {
    [self.navigationController popViewControllerAnimated:YES];
    }
    else {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
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
