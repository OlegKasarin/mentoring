//
//  CarsTableViewController.h
//  MentoringApp
//
//  Created by apple on 01.11.16.
//  Copyright © 2016 OlegKasarin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewCarViewController.h"

@class CarModel;

@interface CarsTableViewController : UITableViewController <NewCarViewControllerDelegate>
@property (copy, nonatomic, nullable) NSArray <CarModel*> *carList;
@end
