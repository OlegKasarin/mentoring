//
//  TheLastVC.m
//  MentoringApp
//
//  Created by apple on 22.10.16.
//  Copyright © 2016 OlegKasarin. All rights reserved.
//

#import "TheLastVC.h"
#import "OrangeVC.h"

@interface TheLastVC ()
@property (readonly, nonatomic) NSInteger rotationCount;
@end

@implementation TheLastVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
    _rotationCount++;
    //NSLog(@"count: %d", _rotationCount);
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(nullable id)sender {
    if ([segue.identifier isEqualToString:@"segueToVC"]) {
        OrangeVC* destVC = segue.destinationViewController;
        
        destVC.color = [UIColor blueColor];
        destVC.counter = _rotationCount;        
    }
}



- (IBAction)greenBtn:(UIButton *)sender {
    OrangeVC* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"OrangeVC"];
    [self presentViewController:vc animated:YES completion:^{
        vc.counter = _rotationCount;
    }];
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
