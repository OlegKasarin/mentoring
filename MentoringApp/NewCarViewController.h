//
//  NewCarViewController.h
//  MentoringApp
//
//  Created by apple on 20.11.16.
//  Copyright © 2016 OlegKasarin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CarModel.h"

@class NewCarViewController;

@protocol NewCarViewControllerDelegate <NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate>
- (void)addNewCarModelViewController:(nonnull NewCarViewController *)controller didFinishEnteringItem:(nonnull CarModel *)newCarModel;
@end

@interface NewCarViewController : UITableViewController
@property (nullable, nonatomic, weak) id <NewCarViewControllerDelegate> delegate;
@end




//uiImagePicker
//how to save pic
//NSFileManager

//commit
