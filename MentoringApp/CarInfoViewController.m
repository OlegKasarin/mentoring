//
//  CarInfoViewController.m
//  MentoringApp
//
//  Created by apple on 15.11.16.
//  Copyright © 2016 OlegKasarin. All rights reserved.
//

#import "CarInfoViewController.h"

@interface CarInfoViewController ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *subTitle1;
@property (weak, nonatomic) IBOutlet UILabel *subTitle2;
@property (weak, nonatomic) IBOutlet UILabel *subTitle3;
@property (weak, nonatomic) IBOutlet UILabel *bottomLabel;
@end

@implementation CarInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //if ([self isViewLoaded]) {
        self.titleLabel.text = [NSString stringWithFormat:@"%@", self.selectedCarModel];
        self.subTitle1.text = [NSString stringWithFormat:@"Since: %@", self.selectedCarModel.startMonufacturingDate ? : @"now"];
        self.subTitle2.text = [NSString stringWithFormat:@"Till: %@", self.selectedCarModel.endMonufacturingDate ? : @"n/a"];
        self.subTitle3.text = [NSString stringWithFormat:@"%ld generation", self.selectedCarModel.generationNumber];
        self.bottomLabel.text = [NSString stringWithFormat:@"SerialNumber:%@", self.selectedCarModel.serialNumber];
    //}
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
