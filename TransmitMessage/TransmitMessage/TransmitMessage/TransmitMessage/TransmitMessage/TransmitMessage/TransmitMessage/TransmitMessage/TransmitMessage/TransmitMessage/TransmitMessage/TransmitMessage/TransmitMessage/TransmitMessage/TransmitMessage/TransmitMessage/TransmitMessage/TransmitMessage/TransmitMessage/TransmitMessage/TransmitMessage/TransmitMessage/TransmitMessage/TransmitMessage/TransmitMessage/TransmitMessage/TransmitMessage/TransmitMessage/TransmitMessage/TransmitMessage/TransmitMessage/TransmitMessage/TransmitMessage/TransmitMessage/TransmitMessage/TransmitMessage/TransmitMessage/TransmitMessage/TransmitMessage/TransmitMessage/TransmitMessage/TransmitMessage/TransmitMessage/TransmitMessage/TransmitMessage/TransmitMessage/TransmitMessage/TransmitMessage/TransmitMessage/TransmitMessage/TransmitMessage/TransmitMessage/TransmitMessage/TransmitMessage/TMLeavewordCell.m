//
//  TMLeavewordCell.m
//  TransmitMessage
//
//  Created by Baoyongzhang on 13-10-15.
//  Copyright (c) 2013年 Baoyongzhang. All rights reserved.
//

#import "TMLeavewordCell.h"

@implementation TMLeavewordCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        _image = [[UIImageView alloc] initWithFrame:CGRectMake(30, 10, 60, 60)];
        _name = [[UILabel alloc] initWithFrame:CGRectMake(120, 10, 0, 0)];
        _name.font = [UIFont fontWithName:_name.font.fontName size:16];
        _name.backgroundColor = [UIColor clearColor];
        [_name sizeToFit];
        _info = [[UILabel alloc] initWithFrame:CGRectMake(120, 40, 0, 0)];
        _info.font = [UIFont fontWithName:_info.font.fontName size:13];
        _info.backgroundColor = [UIColor clearColor];
        [_info sizeToFit];
        
        [self.contentView addSubview:_image];
        [self.contentView addSubview:_name];
        [self.contentView addSubview:_info];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc
{
    [super dealloc];
    [_image release];
    [_info release];
    [_name release];
    _image = nil;
    _info = nil;
    _name = nil;
}

- (void)setImage:(UIImage *)image name:(NSString *)name info:(NSString *)info
{
    _image.image = image;
    _name.text = name;
    _info.text = info;
}

@end
