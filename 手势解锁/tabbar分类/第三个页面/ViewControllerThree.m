//
//  ViewControllerThree.m
//  手势解锁
//
//  Created by slcf888 on 2017/11/9.
//  Copyright © 2017年 slcf888. All rights reserved.
//

#import "ViewControllerThree.h"
#import "CollectionViewCell.h"
@interface ViewControllerThree ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSIndexPath *indexpath;
@end
static NSString *cellindentyfier =@"cellIndentyfier";
@implementation ViewControllerThree

- (void)viewDidLoad {
    [super viewDidLoad];
    UICollectionViewFlowLayout *layout =[[UICollectionViewFlowLayout alloc]init];
    [layout setScrollDirection:UICollectionViewScrollDirectionHorizontal]; //水平滑动  Vertical控制滑动分页用
    
    self.collectionView =[[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout];
    self.collectionView.delegate =self;
    self.collectionView.dataSource =self;
    self.collectionView.backgroundColor =[UIColor whiteColor];
    //注册
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:cellindentyfier];
    [self.view addSubview:self.collectionView];
    [self.collectionView registerNib:[UINib nibWithNibName:@"CollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:cellindentyfier];
    // Do any additional setup after loading the view.
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 2;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 4;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CollectionViewCell *cell =[collectionView dequeueReusableCellWithReuseIdentifier:cellindentyfier forIndexPath:indexPath];
    cell.contentView.backgroundColor =[UIColor whiteColor];
    cell.btnManinfo.tag =indexPath.section*100 +indexPath.row;
    [cell.btnManinfo addTarget:self action:@selector(btnMaInfoClick:) forControlEvents:UIControlEventTouchUpInside];
    cell.iconImageView.image =[UIImage imageNamed:@"book_9"];
    return cell;
}
- (void)btnMaInfoClick:(id)sender
{
    UIButton *tempBtn =(UIButton *)sender;
    NSInteger section =tempBtn.tag/100;
    NSInteger row =tempBtn.tag%100;
    switch (section) {
        case 0:
            if (row ==0) {
                NSLog(@"等0组等0个元素");
//                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示"message:@"怎么下去啊"preferredStyle:UIAlertControllerStyleAlert];
//   [self presentViewController:alert animated:YES completion:nil];
            }else{
                NSLog(@"等0组等%ld个元素",row);
            }
            break;
        case 1:
            if (row ==0) {
                NSLog(@"等1组等0个元素");
            }else{
                NSLog(@"等1组等1个元素");
            }
            break;
        default:
            break;
    }
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%@",indexPath);
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(150, 150);
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(25, 25);
}
//隐藏状态栏
-(BOOL)prefersStatusBarHidden
{
    return YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*http://www.jianshu.com/p/8025e598e9fd
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
