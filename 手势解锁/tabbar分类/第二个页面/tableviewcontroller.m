//
//  tableviewcontroller.m
//  手势解锁
//
//  Created by slcf888 on 2017/11/16.
//  Copyright © 2017年 slcf888. All rights reserved.
//

#import "tableviewcontroller.h"
#import "TableViewVCCell.h"
#define LOAD_NIB(_NibName_) [[NSBundle mainBundle] loadNibNamed:_NibName_ owner:nil options:nil][0]
@interface tableviewcontroller ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) NSMutableArray *info;
@property (nonatomic, strong) UITableView *tableview;
@end

@implementation tableviewcontroller

- (void)viewDidLoad {
    [super viewDidLoad];
    //防止报错，注册cell
    _tableview =[[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    _tableview.delegate =self;
    [_tableview registerClass:[TableViewVCCell class] forCellReuseIdentifier:@"TableViewVCCell"];
    _tableview.dataSource =self;
//    _tableview.rowHeight =UITableViewAutomaticDimension;
    _tableview.estimatedRowHeight =120;
    [self.view addSubview:_tableview];
    self.info =[NSMutableArray array];
    [self.info addObject:@{@"content":@"听说白雪公主在逃跑",@"isChoice":@"NO"}];
    [self.info addObject:@{@"content":@"锄禾日当午汗滴禾下土谁知盘中餐粒粒皆辛苦",@"isChoice":@"NO"}];
    [self.info addObject:@{@"content":@"淡淡笑声淡淡愁淡淡清酒醉南楼半生情况半生癫伴随天命伴随缘",@"isChoice":@"NO"}];
    [self.info addObject:@{@"content":@"huashuopangukaitianpidishiyouyifurenmingweiyugongtakanchurushanhenmafanjiukaishiyishanjieguobatiangeiwapolajiuyouletiandihaiyoujiushinuwazaorenkaishibuzhidaozhangshenmeyangzizuihouzhiyouanzhaozijideyangde",@"isChoice":@"NO"}];
    [self.info addObject:@{@"content":@"nikuzheduiwoshuotonghualidegushidoushipianrende",@"isChoice":@"NO"}];
    // Do any additional s/Users/slcf888/Desktop/手势解锁/手势解锁/tabbar分类/第二个页面etup after loading the view.
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.info.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier =@"TableViewVCCell";
    TableViewVCCell *cell =[tableView dequeueReusableCellWithIdentifier:identifier];
    cell.dicinfo =self.info[indexPath.section];//加到字典里
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *dic =self.info[indexPath.section];
    NSMutableDictionary *dictemp =[NSMutableDictionary dictionaryWithDictionary:dic];
    if ([dic[@"isChoice"] isEqualToString:@"NO"]) {
        [dictemp setObject:@"YES" forKey:@"isChoice"];
        [self.info replaceObjectAtIndex:indexPath.section withObject:dictemp];
    }else{
        [dictemp setObject:@"NO" forKey:@"isChioce"];
        [self.info replaceObjectAtIndex:indexPath.section withObject:dictemp];
    }
    [self.tableview reloadData];
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
