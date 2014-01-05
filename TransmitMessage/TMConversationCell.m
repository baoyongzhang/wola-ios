//
//  TMConversationCell.m
//  TransmitMessage
//
//  Created by Baoyongzhang on 13-10-24.
//  Copyright (c) 2013年 Baoyongzhang. All rights reserved.
//

#import "TMConversationCell.h"
#import "TMConversation.h"

@implementation TMConversationCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        _image = [[UIImageView alloc] initWithFrame:CGRectMake(30, 5, 50, 50)];
        _name = [[UILabel alloc] initWithFrame:CGRectMake(100, 8, 0, 0)];
        _name.font = [UIFont fontWithName:_name.font.fontName size:18];
        _name.backgroundColor = [UIColor clearColor];
        _content = [[UILabel alloc] initWithFrame:CGRectMake(100, 35, 0, 0)];
        _content.font = [UIFont fontWithName:_content.font.fontName size:13];
        _content.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:_image];
        [self.contentView addSubview:_name];
        [self.contentView addSubview:_content];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (void)setImage:(UIImage *)image name:(NSString *)name info:(NSString *)info
{
    _image.image = image;
    _name.text = name;
    _content.text = info;
    [_name sizeToFit];
    [_content sizeToFit];
}

- (void)setBean:(TMConversation *)bean
{
    NSString *path = nil;
    switch (bean.msgType) {
        case 1:
            path = @"icon_tm";
            break;
        case 2:
            path = @"icon_lw";
            break;
        case 3:
            path = @"icon_system";
            break;
    }
   [self setImage:[UIImage imageNamed:path] name:bean.target info:bean.content];
}

@end
