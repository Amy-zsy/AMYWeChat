//
//  AMYChats.m
//  amywechat
//
//  Created by Amy on 2019/4/8.
//  Copyright © 2019 Amy. All rights reserved.
//

#import "AMYChats.h"

@implementation AMYChats

- (instancetype)initWithDic: (NSDictionary *)dic{
    self = [super init];
    if (self) {
        _name = dic[@"name"];
        _image = dic[@"image"];
        _message = dic[@"message"];
        _mute = [dic[@"mute"] boolValue];
        NSDate *currentDate = [NSDate date];//获取当前时间，日期
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];// 创建一个时间格式化对象
        [dateFormatter setDateFormat:@"hh:mm:ss"];//设定时间格式,这里可以设置成自己需要的格式
        NSString *dateString = [dateFormatter stringFromDate:currentDate];//将时间转化成字符串
        _time = dateString;
    }
    return self;
}

@end
