//
//  FormatUtils.m
//  WhoyaoIOSProject
//
//  Created by Reuniontech on 13-1-22.
//  Copyright (c) 2013年 Reuniontech. All rights reserved.
//

#import "FormatUtils.h"
#import "SysConfig.h"

@implementation FormatUtils

+ (FindActDisplayModel*)getModel
{
    NSData *data = [[NSMutableData alloc] initWithContentsOfFile:[APPDELEGATE performSelector:@selector(dataActFilePath:) withObject:@"findAct.plist"]];
    NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
    
    FindActDisplayModel *displayModel= [unarchiver decodeObjectForKey:@"findAct.plist"];
    [unarchiver finishDecoding];
    return displayModel;
}

+ (NSString*)formatDate:(NSString*)date type:(int)type
{
    NSDateFormatter *dtFormatter = [[NSDateFormatter alloc] init];
    [dtFormatter setTimeZone:[NSTimeZone timeZoneWithName:@"GMT"]];
    dtFormatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSDate *endDate= [dtFormatter dateFromString:date];
    NSDate *realEndDate = [NSDate dateWithTimeInterval:-8*60*60 sinceDate:endDate];
    NSDate *dateNow = [NSDate date];
    
    NSString *dateString = nil;
    if (type==0) {
        NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
        NSDateComponents *comps = [[NSDateComponents alloc] init];
        NSInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit |
        NSHourCalendarUnit;
        comps = [calendar components:unitFlags fromDate:dateNow];
        int hour=[comps hour];
        NSTimeInterval time=[realEndDate timeIntervalSinceDate:dateNow];
        int day=(int)time/(3600*24);
        int hours=((int)time)%(3600*24)/3600; 
        dateString=@"";
        NSString *title=nil;
        if (day == 0) {
            if (hour+hours>=24) {
               title = NSLocalizedString(@"明天",nil); 
            }else
                title = NSLocalizedString(@"今天",nil);
        } else if (day == 1) {
            title = NSLocalizedString(@"明天",nil);
        }else if (day == 2) {
            title = NSLocalizedString(@"2天后",nil);
            return dateString=title;
        }else if (day == 3) {
            title = NSLocalizedString(@"3天后",nil);
            return dateString=title;
        }else if (day == 4) {
            title = NSLocalizedString(@"4天后",nil);
            return dateString=title;
        }else if (day == 5) {
            title = NSLocalizedString(@"5天后",nil);
            return dateString=title;
        }else if (day == 6) {
            title = NSLocalizedString(@"6天后",nil);
            return dateString=title;
        }else if (day == 7) {
            title = NSLocalizedString(@"7天后",nil);
            return dateString=title;
        }else
        {
            dtFormatter.dateFormat = @"MM-dd";
            return dateString=[dtFormatter stringFromDate:endDate];
        }
        dtFormatter.dateFormat = @"HH:mm";
        return dateString=[NSString stringWithFormat:@"%@  %@",title,[dtFormatter stringFromDate:endDate]];
    }
    else if (type==1) {
        dtFormatter.dateFormat = @"MM-dd HH:mm";
        return dateString=[dtFormatter stringFromDate:endDate];
    } 
    return dateString;
}

+ (NSInteger)getUserBirthday:(NSString *)string
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-MM-dd";
    int year = [[string substringWithRange:NSMakeRange(0,4)] intValue];
    int month = [[string substringWithRange:NSMakeRange(5,2)] intValue];
    int day = [[string substringWithRange:NSMakeRange(8,2)] intValue];
    NSString *nowTime = [dateFormatter stringFromDate:[NSDate date]];
    int nowyear = [[nowTime substringWithRange:NSMakeRange(0,4)] intValue];
    int nowmonth = [[nowTime substringWithRange:NSMakeRange(5,2)] intValue];
    int nowday = [[nowTime substringWithRange:NSMakeRange(8,2)] intValue];
    
    int age = nowyear - year;
    
    if (nowmonth >= month) {
        if (nowmonth == month) {
            if (nowday < day) {
                age--;
            }
        }
    }
    else
    {
        age--;
    }
    return age;
}
+(NSString*)forMatDate:(NSString *)date
{
    NSDateFormatter *dtFormatter = [[NSDateFormatter alloc] init];
    [dtFormatter setTimeZone:[NSTimeZone timeZoneWithName:@"GMT"]];
    dtFormatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSDate *endDate=[dtFormatter dateFromString:date];
    dtFormatter.dateFormat=@"MM-dd HH:mm";
    return [dtFormatter stringFromDate:endDate];
}

+(int)getDate:(NSString *)dateStr
{
    NSDateFormatter *dtFormatter = [[NSDateFormatter alloc] init];
    [dtFormatter setTimeZone:[NSTimeZone timeZoneWithName:@"GMT"]];
    dtFormatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSDate *endDate=[dtFormatter dateFromString:dateStr];
    NSDate *dateNow = [NSDate date];
    //取两个日期对象的时间间隔：
    //这里的NSTimeInterval 并不是对象，是基本型，其实是double类型，是由c定义的:typedef double NSTimeInterval;
    NSTimeInterval time=[endDate timeIntervalSinceDate:dateNow];
    int day=(int)time/(3600*24);
    int hours=((int)time)%(3600*24)/3600;
    if (day==0 && hours<=2) {
        //表明开始时间距离目前时间小于2小时，这时候则返回了已结束
        return 1;
    }
    return 2;
}

+ (NSString*)chatDate:(NSString *)date
{
    NSDateFormatter *dtFormatter = [[NSDateFormatter alloc] init];
    [dtFormatter setTimeZone:[NSTimeZone timeZoneWithName:@"GMT"]];
    [dtFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"];
    NSDate *chatDate=[dtFormatter dateFromString:date];
    [dtFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    return [dtFormatter stringFromDate:chatDate];
}

+(NSString*)chatListDate:(NSString *)dateStr
{
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    df.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSDate *date= [df dateFromString:dateStr];
    NSString *title = NSLocalizedString(@"今天", nil);
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit
                                               fromDate:date toDate:[NSDate date] options:0];
    int year = [components year];
    int month = [components month];
    int day = [components day];
    NSString *dateString=@"";
    if (year == 0 && month == 0 && day < 3) {
        if (day == 0) {
            df.dateFormat = @"HH:mm";
            title = [df stringFromDate:date];
        } else if (day == 1) {
            title = NSLocalizedString(@"昨天",nil);
        } else if (day == 2) {
            title = NSLocalizedString(@"前天",nil);
        }
        dateString = title;  
    }else
    {
        df.dateFormat = @"MM-dd";
        title = [df stringFromDate:date];
    }
    return dateString;
}
+ (void)setExtraCellLineHidden: (UITableView *)tableView
{
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor clearColor];
    [tableView setTableFooterView:view];
}
+ (void)showMsg:(NSString *)msg
{
    [CONTROLTKALERTDELEGATE openAlertViewWithMessage:msg duringtime:.8f];
}
@end
