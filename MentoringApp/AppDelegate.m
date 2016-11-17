//
//  AppDelegate.m
//  MentoringApp
//
//  Created by apple on 8/5/16.
//  Copyright © 2016 OlegKasarin. All rights reserved.
//

#import "AppDelegate.h"
#import "CarFactory.h"
#import "CarModel.h"
#import "CarsTableViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    CarFactory* hondaFactory = [CarFactory factoryWithName:@"Honda Manufacturing JA LTD."];
    CarModel* accord10 = [CarModel carModelWithBrand:Honda
                                          modelName:@"Accord"
                             startManufacturingDate:[NSDate dateWithTimeIntervalSince1970:[self timeIntervalForYear:2018]]
                               endManufacturingDate:nil
                                   generationNumber:10
                                    andSerialNumber:nil];
    CarModel* accord9 = [CarModel carModelWithBrand:Honda
                                          modelName:@"Accord"
                             startManufacturingDate:[NSDate dateWithTimeIntervalSince1970:[self timeIntervalForYear:2013]]
                               endManufacturingDate:[NSDate dateWithTimeIntervalSince1970:[self timeIntervalForYear:2018]]
                                   generationNumber:9
                                    andSerialNumber:nil];
    CarModel* accord8 = [CarModel carModelWithBrand:Honda
                                          modelName:@"Accord"
                             startManufacturingDate:[NSDate dateWithTimeIntervalSince1970:[self timeIntervalForYear:2008]]
                               endManufacturingDate:[NSDate dateWithTimeIntervalSince1970:[self timeIntervalForYear:2013]]
                                   generationNumber:8
                                    andSerialNumber:nil];
    CarModel* accord7 = [CarModel carModelWithBrand:Honda
                                          modelName:@"Accord"
                             startManufacturingDate:[NSDate dateWithTimeIntervalSince1970:[self timeIntervalForYear:2002]]
                               endManufacturingDate:[NSDate dateWithTimeIntervalSince1970:[self timeIntervalForYear:2007]]
                                   generationNumber:7
                                    andSerialNumber:nil];
    CarModel* civic10 = [CarModel carModelWithBrand:Honda
                                          modelName:@"Civic"
                             startManufacturingDate:[NSDate dateWithTimeIntervalSince1970:[self timeIntervalForYear:2015]]
                               endManufacturingDate:nil
                                   generationNumber:10
                                    andSerialNumber:nil];
    CarModel* civic8 = [CarModel carModelWithBrand:Honda
                                          modelName:@"Civic"
                             startManufacturingDate:[NSDate dateWithTimeIntervalSince1970:[self timeIntervalForYear:2006]]
                               endManufacturingDate:[NSDate dateWithTimeIntervalSince1970:[self timeIntervalForYear:2012]]
                                   generationNumber:8
                                    andSerialNumber:nil];
    CarModel* aCRX3 = [CarModel carModelWithBrand:Honda
                                         modelName:@"CR-X"
                            startManufacturingDate:[NSDate dateWithTimeIntervalSince1970:[self timeIntervalForYear:1992]]
                              endManufacturingDate:[NSDate dateWithTimeIntervalSince1970:[self timeIntervalForYear:1998]]
                                  generationNumber:3
                                   andSerialNumber:nil];
    
    [hondaFactory addNewModel:accord10] ? NSLog(@"<%@> model has been added to the '%@'", accord10, hondaFactory) : NSLog(@"<%@> model has NOT ", accord10);
    NSArray* models = [NSArray arrayWithObjects:accord9, accord8, accord7, civic10, civic8, nil];
    [hondaFactory addNewModels:models] ? NSLog(@"%@ models have been added", models) : NSLog(@"not added");
    [hondaFactory addNewModel:aCRX3] ? NSLog(@"<%@> model has been added.", aCRX3) : NSLog(@"<%@> has NOT been added.", aCRX3);
    
    NSLog(@"Manufacturing models: %@", [hondaFactory manufacturingModels]);
    NSLog(@"Archived models: %@", [hondaFactory archivedModels]);

    [hondaFactory produceCar:accord9 inCount:500] ? NSLog(@"Produced %@.", accord9) : NSLog(@"did not produced");
    [hondaFactory producedList];
    
    
    self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    CarsTableViewController *tableVC = [storyboard instantiateViewControllerWithIdentifier:@"CarsTableViewController"];
    tableVC.carList = [hondaFactory models];
    //self.window.rootViewController = tableVC;
    UINavigationController* navVC = [[UINavigationController alloc] initWithRootViewController:tableVC];
    self.window.rootViewController = navVC;
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (double)timeIntervalForYear:(NSInteger)year {
    return 60 * 60 * 24 * 366 * (year - 1970);
}
    
    
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
