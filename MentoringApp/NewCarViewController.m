//
//  NewCarViewController.m
//  MentoringApp
//
//  Created by apple on 20.11.16.
//  Copyright © 2016 OlegKasarin. All rights reserved.
//

#import "NewCarViewController.h"

@interface NewCarViewController ()
@property (weak, nonatomic) IBOutlet UITextField *brandField;
@property (weak, nonatomic) IBOutlet UITextField *modelNameField;
@property (weak, nonatomic) IBOutlet UITextField *startDateField;
@property (weak, nonatomic) IBOutlet UITextField *endDateField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *generationControl;
@property (weak, nonatomic) IBOutlet UITextField *serialNumberField;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end

@implementation NewCarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
- (IBAction)AddNewModel:(UIBarButtonItem *)sender {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *startDate = [dateFormatter dateFromString:self.startDateField.text];
    NSDate *endDate = [dateFormatter dateFromString:self.endDateField.text];
    
    CarModel* newCarModel = [[CarModel alloc] initWithBrand:Honda modelName:self.modelNameField.text startManufacturingDate:startDate endManufacturingDate:endDate generationNumber:self.generationControl.selectedSegmentIndex+1 andSerialNumber:self.serialNumberField.text];
    newCarModel.modelImage = self.imageView.image;
    
    [self.delegate addNewCarModelViewController:self didFinishEnteringItem:newCarModel];
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)generateSerialNumber:(UIButton *)sender {
    NSString* aWMI = [NSString stringWithFormat:@"JA%u", arc4random() % 10];
    NSString* aVDS = [NSString stringWithFormat:@"ZZZ%uZ", arc4random() % 99];
    NSString* aVIS = [NSString stringWithFormat:@"%u", arc4random() % 999999];
    self.serialNumberField.text = [NSString stringWithFormat:@"%@%@%@", aWMI, aVDS, aVIS];
}

- (IBAction)selectPhoto:(UIButton *)sender {
    UIImagePickerController* picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:picker animated:YES completion:NULL];
}

- (IBAction)takePhoto:(UIButton *)sender {
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Error"
                                                                       message:@"Device has no camera"
                                                                preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
        [self presentViewController:alert animated:YES completion:nil];
    } else {
        UIImagePickerController* picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.allowsEditing = YES;
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        [self presentViewController:picker animated:YES completion:NULL];
    }
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        float actualHeight = chosenImage.size.height;
        float actualWidth = chosenImage.size.width;
        float maxHeight = 320.0; //640 - original
        float maxWidth = 320.0;
        float imgRatio = actualWidth/actualHeight;
        float maxRatio = maxWidth/maxHeight;
        float compressionQuality = 1; //50 percent compression
        if (actualHeight > maxHeight || actualWidth > maxWidth) {
            if (imgRatio < maxRatio) {
                //adjust width according to maxHeight
                imgRatio = maxHeight / actualHeight;
                actualWidth = imgRatio * actualWidth;
                actualHeight = maxHeight;
            }
            else if (imgRatio > maxRatio) {
                //adjust height according to maxWidth
                imgRatio = maxWidth / actualWidth;
                actualHeight = imgRatio * actualHeight;
                actualWidth = maxWidth;
            }
            else {
                actualHeight = maxHeight;
                actualWidth = maxWidth;
            }
        }
        CGRect rect = CGRectMake(0.0, 0.0, actualWidth, actualHeight);
        UIGraphicsBeginImageContext(rect.size);
        [chosenImage drawInRect:rect];
        UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
        NSData *imageData = UIImageJPEGRepresentation(img, compressionQuality);
        UIGraphicsEndImageContext();
        
        //set resized image
        dispatch_async(dispatch_get_main_queue(), ^{
            self.imageView.image = [UIImage imageWithData:imageData];
        });
    });

    [picker dismissViewControllerAnimated:YES completion:NULL];
}

//-(UIImage *)resizeImage:(UIImage *)image {
//    float actualHeight = image.size.height;
//    float actualWidth = image.size.width;
//    float maxHeight = 320.0; //640 - original
//    float maxWidth = 320.0;
//    float imgRatio = actualWidth/actualHeight;
//    float maxRatio = maxWidth/maxHeight;
//    float compressionQuality = 1; //50 percent compression
//    if (actualHeight > maxHeight || actualWidth > maxWidth) {
//        if (imgRatio < maxRatio) {
//            //adjust width according to maxHeight
//            imgRatio = maxHeight / actualHeight;
//            actualWidth = imgRatio * actualWidth;
//            actualHeight = maxHeight;
//        }
//        else if (imgRatio > maxRatio) {
//            //adjust height according to maxWidth
//            imgRatio = maxWidth / actualWidth;
//            actualHeight = imgRatio * actualHeight;
//            actualWidth = maxWidth;
//        }
//        else {
//            actualHeight = maxHeight;
//            actualWidth = maxWidth;
//        }
//    }
//    CGRect rect = CGRectMake(0.0, 0.0, actualWidth, actualHeight);
//    UIGraphicsBeginImageContext(rect.size);
//    [image drawInRect:rect];
//    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
//    NSData *imageData = UIImageJPEGRepresentation(img, compressionQuality);
//    UIGraphicsEndImageContext();
//    return [UIImage imageWithData:imageData];
//}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

@end
