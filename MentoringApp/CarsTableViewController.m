//
//  CarsTableViewController.m
//  MentoringApp
//
//  Created by apple on 01.11.16.
//  Copyright © 2016 OlegKasarin. All rights reserved.
//

#import "CarsTableViewController.h"
#import "CarCell.h"
#import "CarInfoViewController.h"
#import "CarModel.h"

@interface CarsTableViewController ()

@end

@implementation CarsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.carList count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CarCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CarCell" forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"%@", self.carList[indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSLog(@"Selected cell is '%@'", self.carList[indexPath.row]);
    CarInfoViewController* carInfoVC = [self.storyboard instantiateViewControllerWithIdentifier:@"CarInfoViewController"];
    carInfoVC.selectedCarModel = self.carList[indexPath.row];
    [self.navigationController pushViewController:carInfoVC animated:YES];
}

#pragma mark - Navigation
 
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(nullable id)sender NS_AVAILABLE_IOS(5_0) {
    if ([segue.identifier isEqualToString:@"segueForCarInfo"]) {
        CarInfoViewController* destVC = segue.destinationViewController;
        
        CarCell* selectedCell = sender;
        NSIndexPath* selectedIndexPath = [self.tableView indexPathForCell: selectedCell];
        destVC.selectedCarModel = self.carList[selectedIndexPath.row];
    }
}



@end
