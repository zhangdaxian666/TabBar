//
//  TableViewCell.m
//  手势解锁
//
//  Created by slcf888 on 2017/11/9.
//  Copyright © 2017年 slcf888. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (UIImageView *)_image
{
    if (!__image) {
        __image =[[UIImageView alloc]initWithFrame:CGRectMake(10, 5, 40, 40)];
        __image.image =[UIImage imageNamed:@"nodata"];
        [self.contentView addSubview:__image];
    }
    return __image;
}
- (UILabel *)_Label
{
    if (!__Label) {
        __Label =[[UILabel alloc]initWithFrame:CGRectMake(70, 20, CGRectGetWidth(self.frame)-90, 70)];
        __Label.numberOfLines =0;
        __Label.font =[UIFont systemFontOfSize:15];
        [self.contentView addSubview:__Label];
    }
    CGRect rect =__Label.frame;
    rect.size.height =CGRectGetHeight(self.frame)-20-20;
    __Label.frame =rect;
    return __Label;
}
+ (CGFloat)cellHeigthWithLabel:(NSString *)Label
{
    CGSize size =[Label stringSizeWidthContentSize:CGSizeMake([[UIScreen mainScreen] bounds].size.width-90, MAXFLOAT) font:[UIFont systemFontOfSize:15]];
    return ceil(size.height)+40;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
