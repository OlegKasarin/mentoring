//
//  CarsTableViewController.h
//  MentoringApp
//
//  Created by apple on 01.11.16.
//  Copyright © 2016 OlegKasarin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CarModel;

@interface CarsTableViewController : UITableViewController
@property (copy, nonatomic, nullable) NSArray <CarModel*> *carList;
@end
