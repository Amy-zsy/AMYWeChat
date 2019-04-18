//
//  ViewController.m
//  amywechat
//
//  Created by Amy on 2019/4/6.
//  Copyright © 2019 Amy. All rights reserved.
//

#import "AMYDataLoader.h"

@implementation AMYDataLoader

+ (void)loadJSONFile:(NSString *)fileName completion:(void (^)(id jsonObj, NSError *error))completion {
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_DEFAULT, 0), ^{
        NSURL *url = [NSBundle.mainBundle URLForResource:fileName withExtension:@"json"];
        NSData *data = [NSData dataWithContentsOfURL:url];
        NSError *error;
        id jsonObj = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        dispatch_async(dispatch_get_main_queue(), ^{
            if (error) {
                if (completion) {
                    completion(nil, error);
                }
                return;
            }
            if (!jsonObj) {
                if (completion) {
                    completion(nil, [NSError errorWithDomain:NSStringFromClass(self.class) code:-1 userInfo:@{ NSLocalizedDescriptionKey: @"数据格式错误！" }]);
                }
                return;
            }
            if (completion) {
                completion(jsonObj, nil);
            }
        });
    });
}

@end
