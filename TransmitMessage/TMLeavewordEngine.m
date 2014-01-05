//
//  TMLeavewordEngine.m
//  TransmitMessage
//
//  Created by Baoyongzhang on 13-10-15.
//  Copyright (c) 2013年 Baoyongzhang. All rights reserved.
//

#import "TMLeavewordEngine.h"
#import "TMLeaveword.h"

@implementation TMLeavewordEngine

+ (TMLeaveword *)getCurrentState
{
    TMLeaveword *bean = [[TMLeaveword alloc] init];
    bean.name = @"开车";
    bean.info = @"我正在开车，请给我留言";
    return bean;
}

+ (NSDate *)getFinishTime
{
    return [NSDate date];
}

+ (void)setFinish
{
}

+ (NSMutableArray *)getAll
{
    
    TMLeaveword *bean1 = [[TMLeaveword alloc] initWithType:2 name:@"开会" info:nil image:@"icon_meet_normal" selectedImage:@"icon_meet_selected"];
    TMLeaveword *bean2 = [[TMLeaveword alloc] initWithType:3 name:@"开车" info:nil image:@"icon_drive_normal" selectedImage:@"icon_drive_selected"];
    TMLeaveword *bean3 = [[TMLeaveword alloc] initWithType:4 name:@"上课" info:nil image:@"icon_class_normal" selectedImage:@"icon_class_selected"];
    TMLeaveword *bean4 = [[TMLeaveword alloc] initWithType:5 name:@"乘机" info:nil image:@"icon_plane_normal" selectedImage:@"icon_plane_selected"];
    TMLeaveword *bean5 = [[TMLeaveword alloc] initWithType:6 name:@"休息" info:nil image:@"icon_rest_normal" selectedImage:@"icon_rest_selected"];
    TMLeaveword *bean6 = [[TMLeaveword alloc] initWithType:7 name:@"健身" info:nil image:@"icon_sport_normal" selectedImage:@"icon_sport_selected"];
    TMLeaveword *bean7 = [[TMLeaveword alloc] initWithType:8 name:@"旅行" info:nil image:@"icon_travel_normal" selectedImage:@"icon_travel_selected"];
    TMLeaveword *bean8 = [[TMLeaveword alloc] initWithType:9 name:@"用餐" info:nil image:@"icon_eat_normal" selectedImage:@"icon_eat_selected"];
    TMLeaveword *bean9 = [[TMLeaveword alloc] initWithType:10 name:@"理发" info:nil image:@"icon_haircut_normal" selectedImage:@"icon_haircut_selected"];
    TMLeaveword *bean10 = [[TMLeaveword alloc] initWithType:11 name:@"洗澡" info:nil image:@"icon_lw_default" selectedImage:@"icon_lw_default"];
    TMLeaveword *bean11 = [[TMLeaveword alloc] initWithType:12 name:@"购物" info:nil image:@"icon_lw_default" selectedImage:@"icon_lw_default"];
    TMLeaveword *bean12 = [[TMLeaveword alloc] initWithType:13 name:@"忙碌" info:nil image:@"icon_lw_default" selectedImage:@"icon_lw_default"];
    TMLeaveword *bean13 = [[TMLeaveword alloc] initWithType:14 name:@"乘车" info:nil image:@"icon_lw_default" selectedImage:@"icon_lw_default"];
    TMLeaveword *bean14 = [[TMLeaveword alloc] initWithType:15 name:@"出差" info:nil image:@"icon_lw_default" selectedImage:@"icon_lw_default"];
    TMLeaveword *bean15 = [[TMLeaveword alloc] initWithType:16 name:@"看球" info:nil image:@"icon_lw_default" selectedImage:@"icon_lw_default"];
    TMLeaveword *bean16 = [[TMLeaveword alloc] initWithType:17 name:@"看戏" info:nil image:@"icon_lw_default" selectedImage:@"icon_lw_default"];
    TMLeaveword *bean17 = [[TMLeaveword alloc] initWithType:18 name:@"听课" info:nil image:@"icon_lw_default" selectedImage:@"icon_lw_default"];
    TMLeaveword *bean18 = [[TMLeaveword alloc] initWithType:19 name:@"考试" info:nil image:@"icon_lw_default" selectedImage:@"icon_lw_default"];
    TMLeaveword *bean19 = [[TMLeaveword alloc] initWithType:20 name:@"美容" info:nil image:@"icon_lw_default" selectedImage:@"icon_lw_default"];
    TMLeaveword *bean20 = [[TMLeaveword alloc] initWithType:21 name:@"做饭" info:nil image:@"icon_lw_default" selectedImage:@"icon_lw_default"];
    TMLeaveword *bean21 = [[TMLeaveword alloc] initWithType:22 name:@"生气" info:nil image:@"icon_lw_default" selectedImage:@"icon_lw_default"];
    TMLeaveword *bean22 = [[TMLeaveword alloc] initWithType:23 name:@"伤心" info:nil image:@"icon_lw_default" selectedImage:@"icon_lw_default"];
    
    TMLeaveword *bean23 = [[TMLeaveword alloc] initWithType:24 name:@"手机丢失" info:@"我的手机丢失，请给我留言" image:@"icon_lw_default" selectedImage:@"icon_lw_default"];
    TMLeaveword *bean24 = [[TMLeaveword alloc] initWithType:25 name:@"没电关机" info:@"我的手机没电关机，请给我留言" image:@"icon_lw_default" selectedImage:@"icon_lw_default"];
    TMLeaveword *bean25 = [[TMLeaveword alloc] initWithType:26 name:@"没带手机" info:@"我没带手机，请给我留言" image:@"icon_lw_default" selectedImage:@"icon_lw_default"];
    
    NSMutableArray *list = [NSMutableArray arrayWithObjects:bean1, bean2, bean3, bean4, bean5, bean6, bean7, bean8, bean9, bean10, bean11, bean12, bean13, bean14, bean15, bean16, bean17, bean18, bean19, bean20, bean21, bean22, bean23, bean24, bean25, nil];
    
    for (TMLeaveword *bean in list) {
        if(!bean.info){
            bean.info = [NSString stringWithFormat:@"我正在%@，请给我留言", bean.name];
        }
//        NSLog(@"%@", bean.name);
    }
    
    return list;
}

@end
