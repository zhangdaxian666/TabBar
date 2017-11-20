//
//  TableViewCell.h
//  手势解锁
//
//  Created by slcf888 on 2017/11/9.
//  Copyright © 2017年 slcf888. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell

@property (nonatomic, strong) UIImageView *_image;
@property (nonatomic, strong) UILabel *_Label;
+(CGFloat)cellHeigthWithLabel:(NSString *)Label;
@end
