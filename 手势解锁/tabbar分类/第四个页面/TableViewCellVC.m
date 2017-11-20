//
//  TableViewCellVC.m
//  手势解锁
//
//  Created by slcf888 on 2017/11/14.
//  Copyright © 2017年 slcf888. All rights reserved.
//

#import "TableViewCellVC.h"
#import "model.h"
@implementation TableViewCellVC

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
//加载books.plist里面的数据赋值
- (void)setModel:(model *)Model
{
    _Model =Model;
     self.iconimg.image=[UIImage imageNamed:Model.icon];
    self.pricelabel.text =Model.name;
    self.namelabel.text =[NSString stringWithFormat:@"¥%@",Model.price];
    self.countlabel.text =[NSString stringWithFormat:@"%ld",Model.count];
    self.minubtn.enabled =(Model.count>0);
}
@end
