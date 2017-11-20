//
//  Myobject.h
//  手势解锁
//
//  Created by slcf888 on 2017/11/7.
//  Copyright © 2017年 slcf888. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CDTabBar : UITabBar

@property (nonatomic,copy) void(^didMiddBtn)(void);
@end
