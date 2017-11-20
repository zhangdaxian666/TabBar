//
//  TableViewVCCell.h
//  手势解锁
//
//  Created by slcf888 on 2017/11/16.
//  Copyright © 2017年 slcf888. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewVCCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *textLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *labHit;
@property (nonatomic, strong) NSDictionary *dicinfo;
@property (nonatomic, strong) NSString *contentString;
@property (nonatomic, strong) NSString *fixedtext;
@end
