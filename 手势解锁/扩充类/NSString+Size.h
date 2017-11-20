//
//  NSString+Size.h
//  手势解锁
//
//  Created by slcf888 on 2017/11/6.
//  Copyright © 2017年 slcf888. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>
@interface NSString (Size)

- (CGSize)stringSizeWidthContentSize:(CGSize)contentSize font:(UIFont *)font;
@end
