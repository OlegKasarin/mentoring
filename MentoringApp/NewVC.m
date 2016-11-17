//
//  NewVC.m
//  MentoringApp
//
//  Created by apple on 29.10.16.
//  Copyright © 2016 OlegKasarin. All rights reserved.
//

#import "NewVC.h"

@interface NewVC ()
@property (weak, nonatomic) IBOutlet UILabel *currentOrientationLabel;
@property (weak, nonatomic) IBOutlet UILabel *currentCountOfRotationsLabel;
@property (readonly, nonatomic) NSInteger currentCountOfRotation;
@end

@implementation NewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
    _currentCountOfRotation++;
    self.currentCountOfRotationsLabel.text = [NSString stringWithFormat:@"Count: %ld", _currentCountOfRotation];
    NSString* orientation;
    switch (self.interfaceOrientation) {
        case 1:
        {
            orientation = @"Orientation Portrait";
            break;
        }
        case 2:
        {
            orientation = @"Orientation Portrait Upside Down";
            break;
        }
        case 3:
        {
            orientation = @"Orientation Landscape Right";
            break;
        }
        case 4:
        {
            orientation = @"Orientation Landscape Left";
            break;
        }
        default:
        {
            orientation = @"Orientation Unknown";
            break;
        }
    }
    self.currentOrientationLabel.text = orientation;
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
