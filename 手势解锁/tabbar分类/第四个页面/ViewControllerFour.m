//
//  ViewControllerFour.m
//  手势解锁
//
//  Created by slcf888 on 2017/11/9.
//  Copyright © 2017年 slcf888. All rights reserved.
//

#import "ViewControllerFour.h"
#import "model.h"
#import "TableViewCellVC.h"
#import <MJExtension.h>
@interface ViewControllerFour ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) NSMutableArray *dataArr;
@property (nonatomic, readwrite) NSUInteger activityCount;
@end

@implementation ViewControllerFour

- (void)viewDidLoad {
    [super viewDidLoad];
    self.activityCount = 0;
    [self mytableView];
    // Do any additional setup after loading the view.
}
- (void)mytableView{
    UITableView*tableview=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    tableview.delegate=self;
    tableview.dataSource=self;
    //注册
    [tableview registerNib:[UINib nibWithNibName:@"TableViewCellVC" bundle:nil] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:tableview];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArr.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 110;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TableViewCellVC *cell =[tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    cell.Model =self.dataArr[indexPath.row];
    return cell;
}
// 懒加载
- (NSMutableArray *)dataArr
{//👉勾对号
    // 通过plist来创建一个模型数组
    if (!_dataArr) {
        _dataArr=[model mj_objectArrayWithFilename:@"books.plist"];
           }
    
    //
//    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"books" ofType:@"plist"];
//    NSMutableDictionary *data = [[NSMutableDictionary alloc] initWithContentsOfFile:plistPath];

    return _dataArr;
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
