//
//  AMYContactGroup.h
//  amywechat
//
//  Created by Amy on 2019/4/15.
//  Copyright © 2019 Amy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AMYContacts.h"

NS_ASSUME_NONNULL_BEGIN

@interface AMYContactGroup : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSArray <AMYContacts *> *content;
- (instancetype) initWithDic: (NSDictionary *)dic;

@end

NS_ASSUME_NONNULL_END
