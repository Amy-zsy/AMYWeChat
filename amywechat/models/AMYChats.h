//
//  AMYChats.h
//  amywechat
//
//  Created by Amy on 2019/4/8.
//  Copyright © 2019 Amy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AMYChats : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *message;
@property (nonatomic, copy) NSString *time;
@property (nonatomic, copy) NSString *image;
@property (nonatomic, assign, getter=isMute) BOOL mute;
- (instancetype)initWithDic: (NSDictionary *)dic;
@end

NS_ASSUME_NONNULL_END
