//
//  ViewControllerTwo.m
//  手势解锁
//
//  Created by slcf888 on 2017/11/9.
//  Copyright © 2017年 slcf888. All rights reserved.
//

#import "ViewControllerTwo.h"
#import "tableviewcontroller.h"
@interface ViewControllerTwo ()<CAAnimationDelegate>
@property (nonatomic, strong) UIButton *btn;
@property (nonatomic, strong) UIView *circleView;
@property (nonatomic, strong) CAShapeLayer *shapelayer;

@end

@implementation ViewControllerTwo

- (UIButton *)btn{
    if (!_btn) {
        _btn =[UIButton buttonWithType:UIButtonTypeCustom];
        _btn.frame =CGRectMake(60, 100, 80, 80);
        _btn.layer.cornerRadius =40;
        _btn.layer.masksToBounds =YES;
        _btn.backgroundColor =[UIColor greenColor];
    }
    return _btn;
}
- (UIView *)circleView{
    if (!_circleView) {
        _circleView =[[UIView alloc]initWithFrame:CGRectMake(240, 100, 80, 80)];
        _circleView.backgroundColor =[UIColor yellowColor];
    }
    return _circleView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor whiteColor];
    [self.view addSubview:self.btn];
    [self.view addSubview:self.circleView];
    UIButton *begin  = [UIButton buttonWithType:UIButtonTypeCustom];
    begin.frame = CGRectMake(50, HH-200, 100, 40);
    [begin setTitle:@"开始" forState:UIControlStateNormal];
    [begin addTarget:self action:@selector(beginAnimation) forControlEvents:UIControlEventTouchUpInside];
    begin.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:begin];
    [self.view addSubview:self.btn];
    [self shapeAnimation];
    
    UIButton *end  = [UIButton buttonWithType:UIButtonTypeCustom];
    end.frame = CGRectMake(200, HH-200, 100, 40);
    [end setTitle:@"跳转" forState:UIControlStateNormal];
    [end addTarget:self action:@selector(qiehuan) forControlEvents:UIControlEventTouchUpInside];
    end.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:end];
    // Do any additional setup after loading the view.
}
- (void)qiehuan{
    tableviewcontroller *vc =[[tableviewcontroller alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)beginAnimation{
    [self AnimationView];
    [self CircleAnimation];
}
// 图片围绕着圆圈转
- (void)shapeAnimation{
    UIImageView *image =[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"cd_cycleImage"]];
    image.frame =CGRectMake(50, 200, WW-100, WW-100);
    image.layer.cornerRadius =(WW-100)/2;
    //为防止加上按钮，无法切圆角
    image.layer.masksToBounds =YES;
    image.backgroundColor =[[UIColor lightGrayColor] colorWithAlphaComponent:0.2];
    //图片显示的样式
    image.contentMode =UIViewContentModeScaleAspectFill;
    //设置为no不可裁剪
    image.clipsToBounds =YES;
    [self.view addSubview:image];
    
    UIImageView *small =[[UIImageView alloc]initWithFrame:CGRectMake((WW-20)/2, 10, 20, 20)];
    small.image =[UIImage imageNamed:@"nodata"];
    [image addSubview:small];
    
//#####   添加动画      M_PI围绕旋转  byvalue相同起始值的改变
/*duration 动画的时长。  repeatDuration设置动画时间
 repeatCount 重复的次数。 beginTime开始的时间
 timingFunction动画的速度变化。  autoreverses结束时是否执行逆动画
 fromValue改变属性起始值。toValue改变属性结束值
 */
    //围绕y轴旋转 transform.rotation.y
    CABasicAnimation *monkeyAnimation =[CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    monkeyAnimation.toValue =[NSNumber numberWithFloat:2.0*M_PI];
    monkeyAnimation.duration =10.0f;
    monkeyAnimation.timingFunction =[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    monkeyAnimation.cumulative =NO;
    monkeyAnimation.removedOnCompletion =NO; //防止动画结束回到初始状态
    monkeyAnimation.repeatCount =FLT_MAX;  // 动画执行次数
    [image.layer addAnimation:monkeyAnimation forKey:@"Animatedkey"];   //添加动画
    image.layer.speed =3.0;
}
//弹球动画
- (void)AnimationView{
    CAKeyframeAnimation *animation =[CAKeyframeAnimation animation];
    //动画路径
    animation.keyPath =@"position";
    animation.duration =1.0;
    animation.delegate =self;
    //下落上弹点
    animation.values =@[[NSValue valueWithCGPoint:CGPointMake(100, 50)],
                        [NSValue valueWithCGPoint:CGPointMake(100, 280)],
                        [NSValue valueWithCGPoint:CGPointMake(100, 150)],
                        [NSValue valueWithCGPoint:CGPointMake(100, 280)],
                        [NSValue valueWithCGPoint:CGPointMake(100, 230)],
                        [NSValue valueWithCGPoint:CGPointMake(100, 280)],
                        [NSValue valueWithCGPoint:CGPointMake(100, 270)],
                        [NSValue valueWithCGPoint:CGPointMake(100, 280)]];
    //上下弹
    animation.timingFunctions =@[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn],
                                 [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut],
                                 [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn],
                                 [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut],
                                 [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn],
                                 [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut],
                                 [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
    animation.keyTimes =@[@0.0, @0.32, @0.52, @0.73, @0.84, @0.91, @0.96, @1.0];
    _btn.layer.position =CGPointMake(100, 268);
    [_btn.layer addAnimation:animation forKey:nil];
}

- (void)CircleAnimation{
    if (!_shapelayer) {
        _shapelayer =[CAShapeLayer layer];
        _shapelayer.frame =_circleView.bounds;
    }
    //贝塞尔
    UIBezierPath *path =[UIBezierPath bezierPathWithOvalInRect:_circleView.bounds];
    _shapelayer.path =path.CGPath;
    // 填充色
    _shapelayer.fillColor =[UIColor clearColor].CGColor;
    // 路径宽
    _shapelayer.lineWidth =2.0f;
    _shapelayer.strokeColor =[UIColor greenColor].CGColor;
    // 动画实现view层
    [_circleView.layer addSublayer:_shapelayer];
    
    CABasicAnimation *basicAnimation =[CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    basicAnimation.duration =3.0f;
    basicAnimation.timingFunction =[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    // 动画从开始到结束
    basicAnimation.fromValue =[NSNumber numberWithFloat:0.0f];
    basicAnimation.toValue =[NSNumber numberWithFloat:1.0f];
    basicAnimation.fillMode =kCAFillModeForwards;
    basicAnimation.removedOnCompletion =NO;
    [_shapelayer addAnimation:basicAnimation forKey:@"strokeEndAnimation"];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
