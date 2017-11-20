//
//  ViewController.h
//  手势解锁
//
//  Created by slcf888 on 2017/11/6.
//  Copyright © 2017年 slcf888. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
@interface ViewController : UIViewController<CLLocationManagerDelegate>{
    CLLocationManager *_lm;
    NSString *_latitude;
    NSString *_longitude;
}


@end

