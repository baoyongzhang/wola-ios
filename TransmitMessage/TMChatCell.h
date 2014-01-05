//
//  TMChatCell.h
//  TransmitMessage
//
//  Created by Baoyongzhang on 13-10-27.
//  Copyright (c) 2013年 Baoyongzhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TMMessage;

@interface TMChatCell : UITableViewCell
{
    UIImageView *_bg;
    UILabel *_content;
}

- (void) setMessage:(TMMessage *)msg;

@end
