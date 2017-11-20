//
//  Myobject.h
//  手势解锁
//
//  Created by slcf888 on 2017/11/7.
//  Copyright © 2017年 slcf888. All rights reserved.
//

#import "CDTabbarVC.h"
#import "CDNavigationVC.h"
#import "ViewControllerOne.h"
#import "ViewControllerTwo.h"
#import "ViewControllerThree.h"
#import "ViewControllerFour.h"
#import "ViewControllerFire.h"
#import "CDTabBar.h"
@interface CDTabbarVC ()
@property (nonatomic, strong) ViewControllerOne *oneVC;
@property (nonatomic, strong) ViewControllerTwo *twoVC;
@property (nonatomic, strong) ViewControllerThree *threeVC;
@property (nonatomic, strong) ViewControllerFour *fourVC;

@end

@implementation CDTabbarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self InitView];
    [self InitMiddleView];
}

- (void)InitMiddleView
{
    CDTabBar *tabBar = [[CDTabBar alloc] init];
    [self setValue:tabBar forKey:@"tabBar"];
        [tabBar setDidMiddBtn:^{
        ViewControllerFire *vc = [[ViewControllerFire alloc] init];
        CDNavigationVC *nav = [[CDNavigationVC alloc] initWithRootViewController:vc];
        [self presentViewController:nav animated:YES completion:nil];
    }];
}
- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    NSLog(@"xxx%@xxx", item.title);
   
}

- (void)InitView
{
    self.view.backgroundColor = [UIColor whiteColor];
    NSArray *titles = @[@"列表", @"动画", @"消息", @"我的"];
    NSArray *images = @[@"tabbar_home", @"tabbar_reward", @"tabbar_message_center", @"tabbar_profile"];
    NSArray *selectedImages = @[@"tabbar_home_selected", @"tabbar_reward_selected", @"tabbar_message_center_selected", @"tabbar_profile_selected"];
    ViewControllerOne * oneVc = [[ViewControllerOne alloc] init];
    self.oneVC = oneVc;
    ViewControllerTwo * twoVc = [[ViewControllerTwo alloc] init];
    self.twoVC = twoVc;
    ViewControllerThree * threeVc = [[ViewControllerThree alloc] init];
    self.threeVC = threeVc;
    ViewControllerFour * fourVc = [[ViewControllerFour alloc] init];
    self.fourVC = fourVc;
    NSArray *viewControllers = @[oneVc, twoVc, threeVc, fourVc];
    for (int i = 0; i < viewControllers.count; i++)
    {
        UIViewController *childVc = viewControllers[i];
        [self setVC:childVc title:titles[i] image:images[i] selectedImage:selectedImages[i]];
    }
}

- (void)setVC:(UIViewController *)VC title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    VC.tabBarItem.title = title;
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSForegroundColorAttributeName] = [UIColor blackColor];
    dict[NSFontAttributeName] = [UIFont systemFontOfSize:10];
    [VC.tabBarItem setTitleTextAttributes:dict forState:UIControlStateNormal];
    VC.tabBarItem.image = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    VC.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    CDNavigationVC *nav = [[CDNavigationVC alloc] initWithRootViewController:VC];
    [self addChildViewController:nav];
}

@end
