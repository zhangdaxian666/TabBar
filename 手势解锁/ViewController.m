//
//  ViewController.m
//  手势解锁
//
//  Created by slcf888 on 2017/11/6.
//  Copyright © 2017年 slcf888. All rights reserved.
//

#import "ViewController.h"
#define IS_IOS8 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8)

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *latLon;
@property (weak, nonatomic) IBOutlet UILabel *city;
@property (weak, nonatomic) IBOutlet UILabel *location;
- (IBAction)startLocation;
- (IBAction)stopLocation;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if ([CLLocationManager locationServicesEnabled]) {
        if (nil == _lm) {
            _lm = [[CLLocationManager alloc]init];
            _lm.delegate = self;
            //设置定位精度
            _lm.desiredAccuracy = kCLLocationAccuracyBest;
            //设置位置更新的最小距离
            _lm.distanceFilter = 100.f;
            if (IS_IOS8) {//ios8之后点版本需要使用下面的方法才能定位。使用一个即可。
                //[_lm requestAlwaysAuthorization];
                [_lm requestWhenInUseAuthorization];
            }
        }
    }else{
        NSLog(@"定位服务不可利用");
    }
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)startLocation{
    NSLog(@"开始定位");
    [_lm startUpdatingLocation];
}

- (IBAction)stopLocation {
    NSLog(@"停止定位");
    [_lm stopUpdatingLocation];
}
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    //NSLog(@"location %@",error);
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation{
    _latitude = [NSString stringWithFormat:@"%3.5f",newLocation.coordinate.latitude];
    _longitude = [NSString stringWithFormat:@"%3.5f",newLocation.coordinate.longitude];
    
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
    // 设备的当前位置
    CLLocation *currLocation = [locations firstObject];
    //获取经纬度
    _latitude = [NSString stringWithFormat:@"%3.5f",currLocation.coordinate.latitude];
    _longitude = [NSString stringWithFormat:@"%3.5f",currLocation.coordinate.longitude];
    _latLon.text =[NSString stringWithFormat:@"lat %@,\nlong %@",_latitude,_longitude];
    //获取海拔 航向 速度
    NSLog(@"经度：%@,纬度：%@,海拔：%f,航向：%f,行走速度：%f",_longitude,_latitude,currLocation.altitude,currLocation.course,currLocation.speed);
    CLGeocoder *geoCd = [[CLGeocoder alloc] init];//反编码通过经纬度获取具体位置信息。
    [geoCd reverseGeocodeLocation:currLocation completionHandler:^(NSArray *array, NSError *error){
        if (array.count > 0){
            CLPlacemark *placemark = [array objectAtIndex:0];
            //将获得的所有信息显示到label上
            self.location.text = placemark.name;
            //获取城市
            NSString *cty = placemark.locality;
            if (!cty) {
                //四大直辖市的城市信息无法通过locality获得，只能通过获取省份的方法来获得（如果city为空，则可知为直辖市）
                cty = placemark.administrativeArea;
            }
            self.city.text = cty;
            NSLog(@"city = %@", cty);
        }
        else if (error == nil && [array count] == 0)
        {
            NSLog(@"No results were returned.");
        }
        else if (error != nil)
        {
            NSLog(@"An error occurred = %@", error);
        }
    }];
}  
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
