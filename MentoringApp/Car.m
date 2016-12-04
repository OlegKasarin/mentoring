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

#pragma mark - NSCoding

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super init];
    if (self) {
        _color = [coder decodeObjectForKey:@"color"];
        _engineVersion = [coder decodeObjectForKey:@"engineVersion"];
        _transmissionVersion = [coder decodeObjectForKey:@"transmissionVersion"];
        _hp = [coder decodeFloatForKey:@"hp"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.color forKey:@"color"];
    [aCoder encodeObject:self.engineVersion forKey:@"engineVersion"];
    [aCoder encodeObject:self.transmissionVersion forKey:@"transmissionVersion"];
    [aCoder encodeFloat:self.hp forKey:@"hp"];
}
@end
