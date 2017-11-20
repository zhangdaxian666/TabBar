//
//  TableViewCellVC.h
//  手势解锁
//
//  Created by slcf888 on 2017/11/14.
//  Copyright © 2017年 slcf888. All rights reserved.
//

#import <UIKit/UIKit.h>
@class model;
@interface TableViewCellVC : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *iconimg;
@property (weak, nonatomic) IBOutlet UILabel *pricelabel;
@property (weak, nonatomic) IBOutlet UILabel *namelabel;
@property (weak, nonatomic) IBOutlet UIButton *minubtn;
@property (weak, nonatomic) IBOutlet UILabel *countlabel;
@property (weak, nonatomic) IBOutlet UIButton *jiabtn;

@property  (nonatomic,strong)model *Model;
@end
