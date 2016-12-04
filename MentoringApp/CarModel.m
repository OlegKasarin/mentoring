//
//  CarModel.m
//  MentoringApp
//
//  Created by apple on 8/5/16.
//  Copyright © 2016 OlegKasarin. All rights reserved.
//

#import "CarModel.h"

@implementation CarModel

#pragma mark - Car Model Initialization

+ (nonnull instancetype)carModelWithBrand:(CarBrand)brand
                                modelName:(nonnull NSString*)modelName
                   startManufacturingDate:(NSDate*)startDate
                     endManufacturingDate:(NSDate*)endDate
                         generationNumber:(NSInteger)generationNumber
                          andSerialNumber:(NSString*)serialNumber {
    return [[CarModel alloc] initWithBrand:brand modelName:modelName startManufacturingDate:startDate endManufacturingDate:endDate generationNumber:generationNumber andSerialNumber:serialNumber];
}

- (nonnull instancetype)initWithBrand:(CarBrand)brand
                            modelName:(nonnull NSString*)modelName
               startManufacturingDate:(NSDate*)startDate
                 endManufacturingDate:(NSDate*)endDate
                     generationNumber:(NSInteger)generationNumber
                      andSerialNumber:(NSString*)serialNumber {
    self = [self init];
    if (self) {
        _brand = brand;
        _modelName = modelName;
        _startManufacturingDate = startDate;
        _endManufacturingDate = endDate;
        _generationNumber = generationNumber;
        _serialNumber = serialNumber;
    }
    return self;
}

- (nonnull instancetype)initWithModelName:(nonnull NSString*)modelName {
    return [self initWithBrand:Honda modelName:modelName startManufacturingDate:nil endManufacturingDate:nil generationNumber:0 andSerialNumber:[self randomSerialNumber]];
}

#pragma mark - NSCoding

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        _brand = [coder decodeIntegerForKey:@"brand"];
        _modelName = [coder decodeObjectForKey:@"modelName"];
        _startManufacturingDate = [coder decodeObjectForKey:@"startManufacturingDate"];
        _endManufacturingDate = [coder decodeObjectForKey:@"endManufacturingDate"];
        _generationNumber = [coder decodeIntegerForKey:@"generationNumber"];
        _serialNumber = [coder decodeObjectForKey:@"serialNumber"];
        _modelImage = [coder decodeObjectForKey:@"modelImage"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeInteger:self.brand forKey:@"brand"];
    [aCoder encodeObject:self.modelName forKey:@"modelName"];
    [aCoder encodeObject:self.startManufacturingDate forKey:@"startManufacturingDate"];
    [aCoder encodeObject:self.endManufacturingDate forKey:@"endManufacturingDate"];
    [aCoder encodeInteger:self.generationNumber forKey:@"generationNumber"];
    [aCoder encodeObject:self.serialNumber forKey:@"serialNumber"];
    [aCoder encodeObject:self.modelImage forKey:@"modelImage"];
}

#pragma mark -

- (BOOL)isEqualToModel:(nonnull CarModel*)carModel {
    if (!carModel) {
        return NO;
    }
    BOOL isEqualBrands = (![self carBrandString] && !carModel) || ([[self carBrandString] isEqual:[carModel carBrandString]]);
    BOOL isEqualModelNames = (!self.modelName && !carModel.modelName) || ([self.modelName isEqual:carModel.modelName]);
    BOOL isEqualGeneration = (!self.generationNumber && !carModel.generationNumber) || (self.generationNumber == carModel.generationNumber);
    return (isEqualBrands && isEqualModelNames && isEqualGeneration);
    
    //можно не писать проверку на nil, т.к. проперти NONNULL
}

- (NSString*)carBrandString {
    NSString* brandName;
    switch (self.brand) {
        case 0:
            brandName = @"Honda";
            break;
        case 1:
            brandName = @"BMW";
            break;
        case 2:
            brandName = @"Audi";
            break;
        case 3:
            brandName = @"Mazda";
            break;
        case 4:
            brandName = @"Mercedes";
            break;
        case 5:
            brandName = @"Porsche";
            break;
        default:
            brandName = @"Unknown";
            break;
    }
    return brandName;
}

- (NSString *)description {
        return [NSString stringWithFormat:@"%@ %@ %ld", [self carBrandString], _modelName, _generationNumber];
}

- (nonnull NSString*)randomSerialNumber {
    NSString* aWMI = [NSString stringWithFormat:@"JA%u", arc4random() % 10];
    NSString* aVDS = [NSString stringWithFormat:@"ZZZ%uZ", arc4random() % 99];
    NSString* aVIS = [NSString stringWithFormat:@"%u", arc4random() % 999999];    
    return [NSString stringWithFormat:@"%@%@%@", aWMI, aVDS, aVIS];
}

@end
