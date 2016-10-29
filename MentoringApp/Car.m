//
//  Car.m
//  MentoringApp
//
//  Created by apple on 8/5/16.
//  Copyright © 2016 OlegKasarin. All rights reserved.
//

#import "Car.h"

@implementation Car

+ (nonnull instancetype)carWithColor:(nonnull UIColor*)color engine:(NSString*)engine andTransmission:(NSString*)transmission {
    return [[Car alloc] initWithColor:color engine:engine andTransmission:transmission];
}

- (nonnull instancetype)initWithColor:(nonnull UIColor*)color engine:(NSString*)engine andTransmission:(NSString*)transmission {
    self = [self init];
    if (self) {
        _color = color;
        _engineVersion = engine;
        _transmissionVersion = transmission;
    }
    return self;
}

@end
