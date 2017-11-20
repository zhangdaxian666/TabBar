//
//  Tool.h
//  手势解锁
//
//  Created by slcf888 on 2017/11/16.
//  Copyright © 2017年 slcf888. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreText/CoreText.h>
@interface Tool : NSObject
+ (NSArray *)getlinesArrayOfStringinlabel:(UILabel *)label;

+ (NSAttributedString *)theRichText:(NSString *)string theRange:(NSUInteger)theRange changeRange:(NSInteger)changeRange color:(UIColor *)color;
@end
