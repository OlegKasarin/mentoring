//
//  CarFactory.m
//  MentoringApp
//
//  Created by apple on 8/5/16.
//  Copyright © 2016 OlegKasarin. All rights reserved.
//

#import "CarFactory.h"

@interface CarFactory ()
@property (copy, readonly, nonatomic) NSArray <NSMutableDictionary*>* modelsDict;
@end

@implementation CarFactory

#pragma mark - Factory initialization

+ (nonnull instancetype)factoryWithName:(nonnull NSString*)factoryName {
    return [[CarFactory alloc]initFactoryWithName:factoryName];
}

- (nonnull instancetype)initFactoryWithName:(nonnull NSString*)factoryName {
    self = [self init];
    if (self) {
        _factoryName = factoryName;
    }
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _models = [NSArray array];
        _modelsDict = [NSArray array];
    }
    return self;
}

#pragma mark - List of models

/* возвращает список моделей, при isArchived:
YES - список невыпускаемых моделей (архив)
NO - список выпускаемых моделей
*/
- (nonnull NSArray <CarModel*> *)listOfModelsIsArchived:(BOOL)isArchived {
    NSArray* archivedModels = [NSArray array];
    NSArray* monufacturingModels = [NSArray array];
    for (CarModel* currentModel in self.models) {
        if ([currentModel.endMonufacturingDate compare:[NSDate date]] == NSOrderedAscending) {
            archivedModels = [archivedModels arrayByAddingObject:currentModel];
        }
        else
            if ([currentModel.startMonufacturingDate compare:[NSDate date]] == NSOrderedAscending && (!currentModel.endMonufacturingDate || [currentModel.endMonufacturingDate compare:[NSDate date]] == NSOrderedDescending)) {
            monufacturingModels = [monufacturingModels arrayByAddingObject:currentModel];
            }
    }
    return (isArchived) ? archivedModels : monufacturingModels;
}

// список выпускаемых моделей
- (nullable NSArray <CarModel*> *)manufacturingModels {
    return [self listOfModelsIsArchived:NO];
}
// список моделей снятых с производства
- (nullable NSArray <CarModel*> *)archivedModels {
    return [self listOfModelsIsArchived:YES];
}

#pragma mark - Adding a new model(s)

// добавляет новую модель, возвращает bool (добавилась или нет)
- (BOOL)addNewModel:(nonnull CarModel*)model {
    _models = [_models arrayByAddingObject:model];
    _modelsDict = [_modelsDict arrayByAddingObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:model, @"model", @0, @"count", nil]];
    
    return YES;
}
// добавить список моделей, возвращает bool (добавилась или нет)
- (BOOL)addNewModels:(nonnull NSArray <CarModel*> *)models {
    _models = [_models arrayByAddingObjectsFromArray:models];
    for (CarModel* currentModel in models) {
        _modelsDict = [_modelsDict arrayByAddingObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:currentModel, @"model", @0, @"count", nil]];
    }
    return YES;
}

// возвращает список всех поколений конкретной модели
- (nonnull NSArray*)listOfGenerationForCurrentModelName:(CarModel*)model {
    NSArray* generationsOfModel = [NSArray array];
    for (CarModel* currentModel in self.models) {
        if ([currentModel isEqualToModel:model]) {
            generationsOfModel = [generationsOfModel arrayByAddingObject:currentModel];
        }
    }
    return generationsOfModel;
}

#pragma mark -

// дата последнего выпуска конкретной модели
- (nonnull NSDate*)dateOfLastArchivedModel: (nonnull CarModel*)model {
    CarModel* lastArchivedModel;
    for (CarModel* currentModel in [self listOfGenerationForCurrentModelName:model]) {
        if (currentModel.endMonufacturingDate && ([lastArchivedModel.endMonufacturingDate compare:currentModel.endMonufacturingDate] == NSOrderedAscending)) {
            lastArchivedModel = currentModel;
        }
    }
    return lastArchivedModel.endMonufacturingDate;
}
// количество выпущенных версий по модели снятой с производства
- (nonnull NSNumber*)countOfArchivedModels: (nonnull CarModel*)model {
    for (NSDictionary* currentDict in _modelsDict) {
        if ([[currentDict objectForKey:@"model"] isEqualToModel:model]) {
            return [currentDict objectForKey:@"count"];
        }
    }
    return @0;
}

#pragma mark - Car production

//произвести авто в численности count
- (BOOL)produceCar:(nonnull CarModel*)carModel inCount:(NSInteger)count {
    for (NSMutableDictionary* currentDict in _modelsDict) {
        if ([[currentDict objectForKey:@"model"] isEqualToModel:carModel]) {
            count+= [[currentDict objectForKey:@"count"] integerValue];
            [currentDict setObject:[NSNumber numberWithInt:count] forKey:@"count"];
            return YES;
        }
    }
    NSLog(@"Sorry, we haven't this model. Please add it through <addNewModel> method");
    return NO;
}

- (void)producedList {
    NSLog(@"=== PRODUCED LIST ===");
    for (NSMutableDictionary* currentDict in _modelsDict) {
        NSLog(@"%@ : %@", [currentDict valueForKey:@"model"], [currentDict valueForKey:@"count"]);
    }
}

#pragma mark -

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@", _factoryName];
}
@end
