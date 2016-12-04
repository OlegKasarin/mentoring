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
@property (weak, nonatomic) IBOutlet UIImageView *modelImageView;
@end

@implementation CarInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleLabel.text = [NSString stringWithFormat:@"%@", self.selectedCarModel];
    self.subTitle1.text = [NSString stringWithFormat:@"Since: %@", self.selectedCarModel.startManufacturingDate ? : @"now"];
    self.subTitle2.text = [NSString stringWithFormat:@"Till   : %@", self.selectedCarModel.endManufacturingDate ? : @"n/a"];
    self.subTitle3.text = [NSString stringWithFormat:@"%ld generation", (long)self.selectedCarModel.generationNumber];
    self.bottomLabel.text = [NSString stringWithFormat:@"Serial num: %@", self.selectedCarModel.serialNumber];
    self.modelImageView.image = self.selectedCarModel.modelImage;
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
