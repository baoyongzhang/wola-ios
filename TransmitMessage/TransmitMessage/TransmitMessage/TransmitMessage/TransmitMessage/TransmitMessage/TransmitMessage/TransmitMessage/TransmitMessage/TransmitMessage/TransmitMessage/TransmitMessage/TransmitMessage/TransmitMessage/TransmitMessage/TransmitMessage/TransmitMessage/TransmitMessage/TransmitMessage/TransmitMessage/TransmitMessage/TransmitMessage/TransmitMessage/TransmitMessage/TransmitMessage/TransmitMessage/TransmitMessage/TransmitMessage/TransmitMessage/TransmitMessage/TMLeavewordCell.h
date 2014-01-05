//
//  TMLeavewordCell.h
//  TransmitMessage
//
//  Created by Baoyongzhang on 13-10-15.
//  Copyright (c) 2013年 Baoyongzhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TMLeavewordCell : UITableViewCell
{
    UIImageView *_image;
    UILabel *_name;
    UILabel *_info;
}

- (void) setImage:(UIImage *)image name:(NSString *)name info:(NSString *)info;

@end
