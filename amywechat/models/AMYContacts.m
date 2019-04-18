//
//  AMYContacts.m
//  amywechat
//
//  Created by Amy on 2019/4/9.
//  Copyright © 2019 Amy. All rights reserved.
//

#import "AMYContacts.h"

@implementation AMYContacts

- (instancetype) initWithDic: (NSDictionary *)dic {
    self = [super init];
    if(self) {
 //       [self setValuesForKeysWithDictionary:dic];
        _name = dic[@"name"];
        _image = dic[@"image"];
    }
    return self;
}

@end
