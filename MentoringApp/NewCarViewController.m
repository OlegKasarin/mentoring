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
    self.imageView.image = chosenImage;
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:NULL];
}


@end
