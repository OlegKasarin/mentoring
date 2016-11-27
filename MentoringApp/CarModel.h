//
//  CarModel.h
//  MentoringApp
//
//  Created by apple on 8/5/16.
//  Copyright © 2016 OlegKasarin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Car.h"

@interface CarModel : Car

//список автомобильных брендов
typedef NS_ENUM(NSInteger, CarBrand) {
    Honda, BMW, Audi, Mazda, Mercedes, Porsche
};
NS_ASSUME_NONNULL_BEGIN
@property (readonly, nonatomic) CarBrand brand; // Honda
@property (copy, readonly, nonatomic) NSString* modelName; // Accord Civic
@property (nonatomic, nullable) NSDate* startManufacturingDate;
@property (nonatomic, nullable) NSDate* endManufacturingDate;
@property (assign, nonatomic) NSInteger generationNumber; // 1 2 3
@property (copy, nonatomic) NSString* serialNumber; // WVWZZZ16ZEW563899

#pragma mark - Car Model Initialization

+ (instancetype)carModelWithBrand:(CarBrand)brand
                                modelName:(NSString*)modelName
                   startManufacturingDate:(nullable NSDate*)startDate
                     endManufacturingDate:(nullable NSDate*)endDate
                         generationNumber:(NSInteger)generationNumber
                          andSerialNumber:(nullable NSString*)serialNumber;

- (instancetype)initWithBrand:(CarBrand)brand
                            modelName:(NSString*)modelName
               startManufacturingDate:(nullable NSDate*)startDate
                 endManufacturingDate:(nullable NSDate*)endDate
                     generationNumber:(NSInteger)generationNumber
                      andSerialNumber:(nullable NSString*)serialNumber;
- (instancetype)initWithModelName:(NSString*)modelName;

#pragma mark -

- (BOOL)isEqualToModel:(CarModel*)carModel;
NS_ASSUME_NONNULL_END
@end
