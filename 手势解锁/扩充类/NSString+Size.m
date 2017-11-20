//
//  NSString+Size.m
//  手势解锁
//
//  Created by slcf888 on 2017/11/6.
//  Copyright © 2017年 slcf888. All rights reserved.
//

#import "NSString+Size.h"

@implementation NSString (Size)

- (CGSize)stringSizeWidthContentSize:(CGSize)contentSize font:(UIFont *)font
{
    // 段落样式
    NSMutableParagraphStyle *paragraphStyle =[[NSMutableParagraphStyle alloc]init];
    // 以单词为现实单位，后面部分省略不显示
    paragraphStyle.lineBreakMode =NSLineBreakByWordWrapping;
    NSDictionary *attributes =@{NSFontAttributeName: font,NSParagraphStyleAttributeName:paragraphStyle.copy};
    CGSize size =[self boundingRectWithSize:contentSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
    
    return  size;
}
@end
