//
//  ViewControllerOne.m
//  手势解锁
//
//  Created by slcf888 on 2017/11/9.
//  Copyright © 2017年 slcf888. All rights reserved.
//

#import "ViewControllerOne.h"
#import "TableViewCell.h"
#import "Myobject.h"
@interface ViewControllerOne ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableview;
@property (nonatomic, strong) NSArray *contentArray;

@end

@implementation ViewControllerOne
- (UITableView *)tableview{
    if (!_tableview) {
        _tableview =[[UITableView alloc]initWithFrame:CGRectMake(0, 0, WW, HH)];
        _tableview.delegate =self;
        _tableview.dataSource =self;
        _tableview.rowHeight =UITableViewAutomaticDimension;
        [_tableview registerClass:[TableViewCell class] forCellReuseIdentifier:@"TableViewCell"];
    }
    return _tableview;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _contentArray =[[NSArray alloc]initWithObjects:@"江湖梦",@"淡淡箫声淡淡愁",@"淡淡清酒醉南楼",@"半生轻狂半生癫",@"半由天命半随缘",@"绕梁余音出玉箫",@"曲终江湖任逍遥",@"写字楼里写字间，写字间中程序员；程序人员写程序，又将程序换酒钱；酒醒只在屏前坐，酒醉还来屏下眠；酒醉酒醒日复日，屏前屏下年复年；但愿老死电脑间，不愿鞠躬老板前；奔驰宝马贵者趣，公交自行程序员；别人笑我太疯癫，我笑自己命太贱；但见满街漂亮妹，哪个归得程序员;", nil];
    self.view.backgroundColor =[UIColor whiteColor];
    [self InitView];
    [_tableview reloadData];
    // Do any additional setup after loading the view.
}
- (void)InitView{
    [self.view addSubview:self.tableview];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _contentArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"TableViewCell" forIndexPath:indexPath];
    //添加右箭头
    cell.accessoryType =UITableViewCellAccessoryDisclosureIndicator;
    cell._image.image =[UIImage imageNamed:@"nodata"];
    cell._Label.text = _contentArray[indexPath.row];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [TableViewCell cellHeigthWithLabel:_contentArray[indexPath.row]];
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
