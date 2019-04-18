//
//  ViewController.h
//  amywechat
//
//  Created by Amy on 2019/4/6.
//  Copyright © 2019 Amy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AMYDataLoader : NSObject

+ (void)loadJSONFile:(NSString *)fileName completion:(void (^)(id jsonObj, NSError *error))completion;

@end
