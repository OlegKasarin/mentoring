//
//  CarsTableViewController.m
//  MentoringApp
//
//  Created by apple on 01.11.16.
//  Copyright © 2016 OlegKasarin. All rights reserved.
//

#import "CarsTableViewController.h"
#import "CarInfoViewController.h"
#import "NewCarViewController.h"
#import "CarModel.h"

@interface CarsTableViewController ()
@end

static NSString* kCarList = @"carList";

@implementation CarsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self loadCarList];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Add a new model

- (IBAction)addNewModel:(UIBarButtonItem *)sender {
    NewCarViewController* newCarVC = [self.storyboard instantiateViewControllerWithIdentifier:@"NewCarViewController"];
    newCarVC.delegate = self;
    [self.navigationController pushViewController:newCarVC animated:YES];
}

#pragma mark - Save and Load

-(void)saveCarList {
    NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
    NSData* dataSave = [NSKeyedArchiver archivedDataWithRootObject:self.carList];
    [userDefaults setObject:dataSave forKey:kCarList];
    [userDefaults synchronize];
}

- (void)loadCarList {
    NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
    NSData* data = [userDefaults objectForKey:kCarList];
    if (data) {
        self.carList = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.carList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //CarCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CarCell" forIndexPath:indexPath];
    UITableViewCell *cell = [[UITableViewCell alloc] init];
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

- (void)addNewCarModelViewController:(NewCarViewController *)controller didFinishEnteringItem:(CarModel *)newCarModel {
    NSLog(@"New model '%@' is added", newCarModel);
    self.carList = [self.carList arrayByAddingObject:newCarModel];
    [self.tableView reloadData];
    [self saveCarList];
}

#pragma mark - Navigation
/*
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(nullable id)sender NS_AVAILABLE_IOS(5_0) {
    if ([segue.identifier isEqualToString:@"segueForCarInfo"]) {
        CarInfoViewController* destVC = segue.destinationViewController;
        
        CarCell* selectedCell = sender;
        NSIndexPath* selectedIndexPath = [self.tableView indexPathForCell: selectedCell];
        destVC.selectedCarModel = self.carList[selectedIndexPath.row];
    }
}
*/

@end
