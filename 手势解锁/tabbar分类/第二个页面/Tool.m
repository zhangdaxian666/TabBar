//
//  Tool.m
//  手势解锁
//
//  Created by slcf888 on 2017/11/16.
//  Copyright © 2017年 slcf888. All rights reserved.
//  http://www.jianshu.com/p/ca676daf371f

#import "Tool.h"
#define IPHONE_WIDTH  ([UIScreen mainScreen].bounds.size.width)
@implementation Tool

+ (NSArray *)getlinesArrayOfStringinlabel:(UILabel *)label
{
    NSString *text =[label text];
    UIFont *font =[label font];
    CGRect rect =CGRectMake(label.frame.origin.x, label.frame.origin.y, IPHONE_WIDTH, label.frame.size.height);
    //coreText使用。     设置行间距
    CTFontRef myFont =CTFontCreateWithName((CFStringRef) ([font fontName]), [font pointSize], NULL);
    NSMutableAttributedString *attStr =[[NSMutableAttributedString alloc]initWithString:text];
    [attStr addAttribute:(NSString *)kCTFontAttributeName value:(__bridge id)myFont range:NSMakeRange(0, attStr.length)];
    CFRelease(myFont);
    CTFramesetterRef frameSetter =CTFramesetterCreateWithAttributedString((CFAttributedStringRef) attStr);
    CGMutablePathRef path =CGPathCreateMutable();
    CGPathAddRect(path, NULL, CGRectMake(0, 0, rect.size.width, 100000));
    CTFrameRef frame =CTFramesetterCreateFrame(frameSetter, CFRangeMake(0, 0), path, NULL);
    NSArray *lines =(NSArray *)CTFrameGetLines(frame);
    NSMutableArray *linesArray =[[NSMutableArray alloc]init];
    for (id line in lines) {
        CTLineRef lineRef =(__bridge CTLineRef)line;
        CFRange lineRange =CTLineGetStringRange(lineRef);
        NSRange range =NSMakeRange(lineRange.location, lineRange.length);
        NSString *lineString =[text substringWithRange:range];
        CFAttributedStringSetAttribute((CFMutableAttributedStringRef)attStr, lineRange, kCTKernAttributeName, (CFTypeRef)([NSNumber numberWithFloat:0.0]));
        CFAttributedStringSetAttribute((CFMutableAttributedStringRef)attStr, lineRange, kCTKernAttributeName, (CFTypeRef)([NSNumber numberWithInt:0.0]));
        [linesArray addObject:lineString];
    }
    CGPathRelease(path);
    CFRelease(frame);
    CFRelease(frameSetter);
    return (NSArray *)linesArray;
}
+ (NSAttributedString *)theRichText:(NSString *)string theRange:(NSUInteger)theRange changeRange:(NSInteger)changeRange color:(UIColor *)color
{
    NSMutableAttributedString *noteStr =[[NSMutableAttributedString alloc]initWithString:string];
    NSRange redRange =NSMakeRange(theRange, changeRange);
    [noteStr addAttribute:NSForegroundColorAttributeName value:color range:redRange];
    return noteStr;
}
@end
