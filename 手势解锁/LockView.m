//
//  LockView.m
//  手势解锁
//
//  Created by slcf888 on 2017/11/6.
//  Copyright © 2017年 slcf888. All rights reserved.
//

#import "LockView.h"

@interface LockView ()
@property (nonatomic, strong) NSMutableArray *selectBtnArray;
@property (nonatomic, assign) CGPoint fingrePoint;
@end

@implementation LockView
- (NSMutableArray *)selectBtnArray{
    if (!_selectBtnArray) {
        _selectBtnArray =[NSMutableArray array];
    }
    return _selectBtnArray;
}
- (void)awakeFromNib{
    [super awakeFromNib];
    [self initBnt];
}
- (void)initBnt{
    for (int i=0; i<9; i++) {
        UIButton *button =[UIButton buttonWithType:0];
        [button setImage:[UIImage imageNamed:@"normal"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"select"] forState:UIControlStateSelected];
        button.userInteractionEnabled =NO;
        button.tag =i;
        [self addSubview:button];
    }
}
- (void)layoutSubviews{
    [super layoutSubviews];
    CGFloat width =60;
    CGFloat margin =(self.frame.size.width -3*width)/4;
    for (int i=0; i<self.subviews.count; i++) {
        NSInteger row =i/3;
        NSInteger column =i%3;
        UIButton *btn =self.subviews[i];
        btn.frame =CGRectMake(margin+column*(margin+width), margin+row*(margin+width), width, width);
    }
}
// 一根手指或者多根手指开始触摸view（手指按下）
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self changeButtonSelectedStarwWidth:touches];
}
// 一根或者多根手指在view上移动（随着手指的移动，会持续调用改方法）
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self changeButtonSelectedStarwWidth:touches];
    self.fingrePoint =[self getCurrentTouchPoint:touches];
    [self setNeedsDisplay];
}
// 一根或者多根手指离开view（手指抬起）
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSString *string =@"";
    for (UIButton *button in self.selectBtnArray) {
        button.selected =NO;
        string =[string stringByAppendingString:[NSString stringWithFormat:@"%ld",button.tag]];
    }
    NSString *key =[[NSUserDefaults standardUserDefaults] objectForKey:@"HSS"];
    if (key) {
        NSString *message =@"";
        if ([key isEqualToString:string]) {
            message =@"OK了";
        }else{
            message = @"你错了";
        }
        UIAlertView *alert =[[UIAlertView alloc] initWithTitle:@"开始提示" message:message delegate:nil cancelButtonTitle:@"知道了" otherButtonTitles:nil, nil];
        [alert show];
    }else{
        [[NSUserDefaults standardUserDefaults]setObject:string forKey:@"HSS"];
    }
    [self.selectBtnArray removeAllObjects];
    [self setNeedsDisplay];
}
//其他的touchescancelled的方法是某个系统事件（例打电话呼入）打断触摸过程

// CGFloat： 浮点类型
// CGPoint： 一个二维坐标系的点
// CGSize： 一个矩形的宽高
// CGRect： 一个矩形的位置和大小
- (void)changeButtonSelectedStarwWidth:(NSSet <UITouch *>*)touches{
    CGPoint point = [self getCurrentTouchPoint:touches];
    UIButton *button = [self getCurrentButton:point];
    if (button&&button.selected ==NO) {
        button.selected =YES;
        [self.selectBtnArray addObject:button];
    }
}
- (CGPoint)getCurrentTouchPoint:(NSSet <UITouch *>*)touches{
    UITouch *touch =touches.anyObject;
    // 表示触摸在view这个试图的位置
    return [touch locationInView:self];
}
- (UIButton *)getCurrentButton:(CGPoint)point{
    for (UIButton *button in self.subviews) {
        if (CGRectContainsPoint(button.frame, point)) {
            return button;
        }
    }
    return nil;
}
-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    if (self.selectBtnArray.count) {
        UIBezierPath *path = [UIBezierPath bezierPath];
        for (int i = 0; i < self.selectBtnArray.count; i ++) {
            UIButton *button = self.selectBtnArray[i];
            if (i == 0) {
                [path moveToPoint:button.center];
            }else{
                [path addLineToPoint:button.center];
            }
        }
        [path addLineToPoint:self.fingrePoint];
        //画线宽度
        path.lineWidth = 6;
        [[UIColor whiteColor] set];
        path.lineJoinStyle = kCGLineCapRound;
        [path stroke];
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
