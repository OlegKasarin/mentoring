//
//  Car.h
//  MentoringApp
//
//  Created by apple on 8/5/16.
//  Copyright © 2016 OlegKasarin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Car : NSObject
NS_ASSUME_NONNULL_BEGIN
@property (readonly, nonatomic) UIColor* color;
@property (copy, readonly, nonatomic, nullable) NSString* engineVersion;
@property (copy, readonly, nonatomic, nullable) NSString* transmissionVersion;
@property (assign, readonly, nonatomic) float hp;

+ (instancetype)carWithColor:(UIColor*)color engine:(nullable NSString*)engine andTransmission:(nullable NSString*)transmission;
- (instancetype)initWithColor:(UIColor*)color engine:(nullable NSString*)engine andTransmission:(nullable NSString*)transmission;
NS_ASSUME_NONNULL_END
@end


