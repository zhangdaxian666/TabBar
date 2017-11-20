//
//  CollectionViewCell.h
//  手势解锁
//
//  Created by slcf888 on 2017/11/15.
//  Copyright © 2017年 slcf888. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *labelName;
@property (weak, nonatomic) IBOutlet UILabel *labelPosition;
@property (weak, nonatomic) IBOutlet UIButton *btnManinfo;
@property (weak, nonatomic) IBOutlet UITextView *textViewStory;

@end
