//
//  CarCell.m
//  MentoringApp
//
//  Created by apple on 01.11.16.
//  Copyright © 2016 OlegKasarin. All rights reserved.
//

#import "CarCell.h"

@interface CarCell ()
@property (weak, nonatomic) IBOutlet UILabel *carLabel;
@end

@implementation CarCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
