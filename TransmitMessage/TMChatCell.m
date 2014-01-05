
//
//  TMChatCell.m
//  TransmitMessage
//
//  Created by Baoyongzhang on 13-10-27.
//  Copyright (c) 2013年 Baoyongzhang. All rights reserved.
//

#import "TMChatCell.h"
#import "TMMessage.h"

@implementation TMChatCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        _bg = [[UIImageView alloc]initWithFrame:CGRectZero];
        _content = [[UILabel alloc]initWithFrame:CGRectZero];
        _content.backgroundColor = [UIColor clearColor];
        _content.font = [UIFont fontWithName:_content.font.fontName size:13];
        
        [self addSubview:_bg];
        [self addSubview:_content];
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setMessage:(TMMessage *)msg
{
    CGSize size = [msg.content sizeWithFont:[UIFont fontWithName:_content.font.fontName size:14]constrainedToSize:CGSizeMake(210.f, CGFLOAT_MAX) lineBreakMode:UILineBreakModeWordWrap];
    CGFloat width=size.width;
    _bg.frame=CGRectMake(10, 10,width+30, size.height+40);
    _bg.image= [[UIImage imageNamed:@"chatabg"]resizableImageWithCapInsets:UIEdgeInsetsMake(25, 8, 8, 16)];
    _content.frame=CGRectMake(30, 20, size.width, size.height);
    [_content setText:msg.content];
}

@end
