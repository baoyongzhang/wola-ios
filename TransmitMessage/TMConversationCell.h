//
//  TMConversationCell.h
//  TransmitMessage
//
//  Created by Baoyongzhang on 13-10-24.
//  Copyright (c) 2013年 Baoyongzhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TMConversation;

@interface TMConversationCell : UITableViewCell
{
    UIImageView *_image;
    UILabel *_name;
    UILabel *_content;
}

- (void) setBean:(TMConversation *) bean;

@end
