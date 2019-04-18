//
//  AMYContacts.h
//  amywechat
//
//  Created by Amy on 2019/4/9.
//  Copyright © 2019 Amy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AMYContacts : NSObject

@property (nonatomic, copy) NSString *image;
@property (nonatomic, copy) NSString *name;
- (instancetype) initWithDic: (NSDictionary *)dic;

@end

NS_ASSUME_NONNULL_END
