//
//  AMYMeView.m
//  amywechat
//
//  Created by Amy on 2019/4/16.
//  Copyright © 2019 Amy. All rights reserved.
//

#import "AMYMeView.h"
#import <Masonry/Masonry.h>

@interface AMYMeView ()

@property (nonatomic, weak) UIImageView *avatarImageView;
@property (nonatomic, weak) UILabel *nameLabel;
@property (nonatomic, weak) UILabel *messageLabel;

@end

@implementation AMYMeView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:(CGRect)frame];
    if (self) {
//        [self setBackgroundImage:[UIImage imageNamed:@"mute"] forState:UIControlStateNormal];
//        [self setBackgroundImage:[UIImage imageNamed:@"icon_00"] forState:UIControlStateHighlighted];       
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.layer.cornerRadius = 4;
        imageView.clipsToBounds = YES;
        imageView.image = [UIImage imageNamed:@"icon_00"];
        [self addSubview:imageView];
        
        UILabel *nameLabel = [[UILabel alloc] init];
        nameLabel.font = [UIFont systemFontOfSize:20];
        nameLabel.text = @"Amy_Z";
        [self addSubview:nameLabel];
        
        UILabel *messageLabel = [[UILabel alloc] init];
        messageLabel.font = [UIFont systemFontOfSize:15];
        messageLabel.text = @"WeChat ID: zsy951210";
        [self addSubview:messageLabel];
        
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@25);
            make.top.equalTo(@100);
            make.width.height.equalTo(@50);
        }];
        
        [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(imageView.mas_right).offset(15);
            make.top.equalTo(imageView.mas_top).offset(1);
        }];
        
        [messageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(nameLabel.mas_left);
            make.top.equalTo(nameLabel.mas_bottom).offset(10);
        }];
        
        _avatarImageView = imageView;
        _nameLabel = nameLabel;
        _messageLabel = messageLabel;
    }
    return self;
}

@end
