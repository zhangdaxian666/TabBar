//
//  TableViewVCCell.m
//  手势解锁
//
//  Created by slcf888 on 2017/11/16.
//  Copyright © 2017年 slcf888. All rights reserved.
//

#import "TableViewVCCell.h"
#import "Tool.h"
@implementation TableViewVCCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)setDicinfo:(NSDictionary *)dicinfo
{
    _dicinfo =dicinfo;
    self.textLabel.text =_dicinfo[@"content"];
    BOOL flage =[self infocount:self.textLabel];
    if (flage) {
        if ([_dicinfo[@"isChoice"] isEqualToString:@"NO"]) {
            NSInteger theRange =self.contentString.length -self.fixedtext.length+3;
            self.textLabel.attributedText =[Tool theRichText:self.contentString theRange:theRange changeRange:4 color:[UIColor blueColor]];
            self.labHit.constant =0;
        }else{
            self.labHit.constant =25;
        }
    }else{
        self.labHit.constant =0;
        self.textLabel.text =_dicinfo[@"content"];
    }
}

- (BOOL)infocount:(UILabel *)label{
    NSArray *stringArr =[Tool getlinesArrayOfStringinlabel:label];
    if (stringArr.count>2) {
        NSString *string1 =stringArr[0];
        NSString *string2 =stringArr[1];
        self.fixedtext =@"...【展开】";
        NSString *string3 =[NSString stringWithFormat:@"%@%@",string2,self.fixedtext];
        
        if (string3.length>string1.length) {
            NSInteger len =string3.length -string1.length;
            string2 =[string2 substringToIndex:string2.length-len-4];
            string2 =[NSString stringWithFormat:@"%@%@",string2,self.fixedtext];
        }
        self.contentString =[NSString stringWithFormat:@"%@%@",string1,string2];
        return YES;
    }
    return NO;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
