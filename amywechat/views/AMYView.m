//
//  AMYView.m
//  amywechat
//
//  Created by Amy on 2019/4/6.
//  Copyright © 2019 Amy. All rights reserved.
//

#import "AMYView.h"

@interface AMYView ()

@property (nonatomic, weak) UITableView *tableview;

@end


@implementation AMYView

//- (instancetype)init {
//    return [self initWithFrame:CGRectZero];
//}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        [self addSubview:tableView];
        _tableview = tableView;
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _tableview.frame = self.bounds;
}

@end
