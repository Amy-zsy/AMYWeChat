//
//  AMYContactGroup.m
//  amywechat
//
//  Created by Amy on 2019/4/15.
//  Copyright © 2019 Amy. All rights reserved.
//

#import "AMYContactGroup.h"
#import "AMYContacts.h"

@implementation AMYContactGroup

- (instancetype) initWithDic: (NSDictionary *)dic {
    self = [super init];
    if(self) {
        _title = dic[@"title"];
        NSArray *dictArray = dic[@"content"];
        NSMutableArray *contentArray = [NSMutableArray array];
        for (NSDictionary *dict in dictArray) {
            AMYContacts *content = [[AMYContacts alloc] initWithDic:dict];
            [contentArray addObject:content];
        }
        _content = contentArray;
    }
    return self;
}

@end
