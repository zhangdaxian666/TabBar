//
//  ViewControllerFire.m
//  手势解锁
//
//  Created by slcf888 on 2017/11/14.
//  Copyright © 2017年 slcf888. All rights reserved.
//

#import "ViewControllerFire.h"
#import <SVProgressHUD.h>

@interface ViewControllerFire ()
{
    UIButton *btnTWO;
}
@property (weak, nonatomic) IBOutlet UIButton *popActionButton;
@property (nonatomic, readwrite) NSUInteger activityCount;
@end

@implementation ViewControllerFire

- (void)viewDidLoad {
    [super viewDidLoad];
    self.activityCount =0;
    [self addObserver:self forKeyPath:@"activityCount" options:NSKeyValueObservingOptionNew context:nil];
//    btnTWO =[UIButton buttonWithType:0];
//    btnTWO.backgroundColor =[UIColor yellowColor];
//    btnTWO.frame =CGRectMake(100, 100, 100, 100);
//    [btnTWO setTitle:@"123" forState:UIControlStateNormal];
//    [btnTWO setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
//    [btnTWO setTitleColor:[UIColor blackColor] forState:UIControlStateSelected|UIControlStateHighlighted];
//    [btnTWO addTarget:self action:@selector(btnTwo) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:btnTWO];
    // Do any additional setup after loading the view from its nib.
}
//- (void)btnTwo{
//    btnTWO.selected =YES;
//}
//蒙版   线程时间
- (IBAction)backview:(id)sender {
    [SVProgressHUD show];
    self.activityCount++;
    dispatch_time_t timer = dispatch_time(DISPATCH_TIME_NOW, 2 * NSEC_PER_SEC);
    dispatch_after(timer, dispatch_get_main_queue(), ^{
        [SVProgressHUD dismiss];
    });
}
- (IBAction)showWithStatus:(id)sender {
    [SVProgressHUD showWithStatus:@"Doing Stuff"];
    self.activityCount++;
}
- (IBAction)popActivity:(id)sender {
    [SVProgressHUD popActivity];
    if (self.activityCount !=0) {
        self.activityCount--;
    }
}
- (IBAction)showSuccessWithStatus:(id)sender {
//    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];
    [SVProgressHUD showSuccessWithStatus:@"Great Success"];
}

- (IBAction)showErrorWithStatus:(id)sender {
    [SVProgressHUD showErrorWithStatus:@"Failed With Error"];
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    if([keyPath isEqualToString:@"activityCount"]){
        unsigned long activityCount = [[change objectForKey:NSKeyValueChangeNewKey] unsignedLongValue];
        [self.popActionButton setTitle:[NSString stringWithFormat:@"popActivity - %lu", activityCount] forState:UIControlStateNormal];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/* // 准备初始化配置参数http://blog.csdn.net/bht890811/article/details/40952439
 https://www.cnblogs.com/zhangguoliang1992/p/4918684.html

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
