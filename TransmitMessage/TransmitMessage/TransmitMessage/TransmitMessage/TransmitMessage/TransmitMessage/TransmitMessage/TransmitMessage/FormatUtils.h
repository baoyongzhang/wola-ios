//
//  FormatUtils.h
//  WhoyaoIOSProject
//
//  Created by Reuniontech on 13-1-22.
//  Copyright (c) 2013年 Reuniontech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FindActDisplayModel.h"

@interface FormatUtils : NSObject
+ (FindActDisplayModel*)getModel;
+ (NSString*)formatDate:(NSString*)date type:(int)type;
+ (NSInteger)getUserBirthday:(NSString *)birthdayString;
+ (NSString*)forMatDate:(NSString*)date;
+ (int)getDate:(NSString*)dateStr;
+ (NSString*)chatDate:(NSString*)date;
+ (NSString*)chatListDate:(NSString*)dateStr;
+ (void)setExtraCellLineHidden: (UITableView *)tableView;
+ (void)showMsg:(NSString*)msg;
@end
