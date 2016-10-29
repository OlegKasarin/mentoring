//
//  CarFactory.h
//  MentoringApp
//
//  Created by apple on 8/5/16.
//  Copyright © 2016 OlegKasarin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CarModel.h"

@interface CarFactory : NSObject

@property (copy, readonly, nonatomic, nonnull) NSString* factoryName;
@property (copy, readonly, nonatomic, nullable) NSArray <CarModel*> *models;

#pragma mark - Factory initialization

+ (nonnull instancetype)factoryWithName:(nonnull NSString*)factoryName;
- (nonnull instancetype)initFactoryWithName:(nonnull NSString*)factoryName;

#pragma mark - List of models

// список выпускаемых моделей
- (nullable NSArray <CarModel*> *)manufacturingModels;
// список моделей снятых с производства
- (nullable NSArray <CarModel*> *)archivedModels;

#pragma mark - Adding a new model(s)

// добавляет новую модель, возвращает bool (добавилась или нет)
- (BOOL)addNewModel:(nonnull CarModel*)model;
// добавить список моделей, возвращает bool (добавилась или нет)
- (BOOL)addNewModels:(nonnull NSArray <CarModel*> *)models;

#pragma mark -

// дата последнего выпуска конкретной модели
- (nonnull NSDate*)dateOfLastArchivedModel: (nonnull CarModel*)model;

// количество выпущенных версий по модели снятой с производства
- (nonnull NSNumber*)countOfArchivedModels: (nonnull CarModel*)model;

#pragma mark - Car production

//произвести авто в численности count
- (BOOL)produceCar:(nonnull CarModel*)carModel inCount:(NSInteger)count;

- (void)producedList; //?

@end