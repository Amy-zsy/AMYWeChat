//
//  AMYChatCell.m
//  amywechat
//
//  Created by Amy on 2019/4/7.
//  Copyright © 2019 Amy. All rights reserved.
//

#import "AMYChatCell.h"
#import "AMYChats.h"
#import <Masonry/Masonry.h>

@interface AMYChatCell ()
@property (nonatomic, weak) UIImageView *avatarImageView;
@property (nonatomic, weak) UILabel *titleLabel;
@property (nonatomic, weak) UILabel *messageLabel;
@property (nonatomic, weak) UILabel *timeLabel;
@property (nonatomic, weak) UIImageView *muteImageView;
@end

@implementation AMYChatCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.layer.cornerRadius = 4;
        imageView.clipsToBounds = YES;
        [self.contentView addSubview:imageView];
        
        UILabel *titleLabel = [[UILabel alloc] init];
        titleLabel.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:titleLabel];
        
        UILabel *messageLabel = [[UILabel alloc] init];
        messageLabel.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:messageLabel];

        UILabel *timeLabel = [[UILabel alloc] init];
        [self.contentView addSubview:timeLabel];
        timeLabel.font = [UIFont systemFontOfSize:12];
        [timeLabel setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
        [timeLabel setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
        
        UIImageView *muteImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 5, 5)];
        [self.contentView addSubview:muteImageView];
        
        _avatarImageView = imageView;
        _titleLabel = titleLabel;
        _messageLabel = messageLabel;
        _timeLabel = timeLabel;
        _muteImageView = muteImageView;
        
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@15);
            make.top.equalTo(@10);
            make.bottom.equalTo(@-10);
            make.width.equalTo(imageView.mas_height);
        }];
        
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(imageView.mas_right).offset(15);
            make.top.equalTo(imageView.mas_top).offset(1);
        }];
        
//        [messageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(titleLabel.mas_left);
//            make.top.equalTo(titleLabel.mas_bottom).offset(5);
//            if (self.muteImageView.hidden) {
//                make.right.equalTo(@-15);
//            } else {
//                make.right.equalTo(self.muteImageView.mas_left).offset(-5);
//            }
//        }];
        
        [timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(@-15);
            make.top.equalTo(titleLabel.mas_top);
            make.left.equalTo(titleLabel.mas_right).offset(5);
        }];
        
        [muteImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(@-15);
            make.top.equalTo(messageLabel.mas_top);
            make.width.height.equalTo(@14);
        }];
    }
    return self;
}

- (void)setData:(AMYChats *)data {
    _titleLabel.text = data.name;
    _messageLabel.text = data.message;
    _timeLabel.text = data.time;
    _avatarImageView.image = [UIImage imageNamed:data.image];
    _muteImageView.image = [UIImage imageNamed:@"mute"];
    _muteImageView.hidden = !data.isMute;
    
//    [_messageLabel mas_updateConstraints:^(MASConstraintMaker *make) {
//        if (self.muteImageView.hidden) {
//            make.right.equalTo(@-15);
//        } else {
//            make.right.equalTo(self.muteImageView.mas_left).offset(-5);
//        }
//    }];
    
    [_messageLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLabel.mas_left);
        make.top.equalTo(self.titleLabel.mas_bottom).offset(5);
        if (self.muteImageView.hidden) {
            make.right.equalTo(@-15);
        } else {
            make.right.equalTo(self.muteImageView.mas_left).offset(-5);
        }
    }];
}

//- (void)layoutSubviews {
//    [super layoutSubviews];
//    CGFloat margin = 15;
//    CGFloat side = self.contentView.bounds.size.height - (margin * 2);
//    _avatarImageView.frame = CGRectMake(margin, margin, side, side);
//
//    CGFloat left = margin + side + margin;
//    CGFloat y = margin + 3;
//    CGFloat height = 18;
//    _titleLabel.frame = CGRectMake(left, y, self.contentView.bounds.size.width - left - 5 - 50 - margin, height);
//
//    CGFloat messageHeight = 15;
//    _messageLabel.frame = CGRectMake(left, self.contentView.bounds.size.height - y - messageHeight, _titleLabel.frame.size.width, messageHeight);
//}

@end
