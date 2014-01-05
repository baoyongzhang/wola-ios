//
//  TMConfig.h
//  TransmitMessage
//
//  Created by Baoyongzhang on 13-10-14.
//  Copyright (c) 2013年 Baoyongzhang. All rights reserved.
//

#import <Foundation/Foundation.h>

//#define CONFIG_PATH [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)       objectAtIndex:0]stringByAppendingPathComponent:@"test.plist"]

#define CONFIG_PATH [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingFormat:@"/Config.plist"]

#define IS_REGISTER @"is_register" // 是不是已经注册
#define IS_ACTIVE @"is_active" // 是不是已经激活
#define SIM_SERIAL_NUMBER @"sim_serial_number" // 串号
#define PHONE_NUMBER @"phone_number" // 手机号
#define LEAVEWORD_TYPE @"leaveword_type" // 留言状态类型
#define LEAVEWORD_STATE @"leaveword_state" // 留言状态名称
#define LEAVEWORD_DURATION @"leaveword_duration" // 留言时长
#define LEAVEWORD_RINGING @"leaveword_ringing" // 留言铃音时长
#define LEAVEWORD_LOCAL_TIME @"leaveword_local_time" // 留言开始本地时间
#define LEAVEWORD_SERVER_TIME @"leaveword_server_time" // 留言开始服务端时间
#define IS_DOUBLE_SIM @"is_double_SIM" // 是不是双卡
#define BACKUP_IM_SERVER @"backup_im_server" // IM服务器备份地址
#define BACKUP_IM_SERVER_PORT @"backup_im_server_port" // IM服务器备份端口
#define BACKUP_WEB_SERVER @"backup_web_server" // web服务器备份地址
#define BACKUP_WEB_SERVER_PORT @"backup_web_server_port" // web服务器备份端口
#define IM_SERVER @"im_server" // IM服务器地址
#define IM_SERVER_PORT @"im_server_port" // IM服务器端口
#define WEB_SERVER @"web_server" // web服务器地址
#define WEB_SERVER_PORT @"web_server_port" // web服务器端口
#define HAVE_WEB_PAS @"have_web_pas" // 是否有网站密码
#define CALL_TURN_CODE @"call_turn_code" // 呼转号码
#define IS_SET_CALL_TURN_CODE @"is_set_call_turn_code" // 是否设置了呼转
#define LOGIN_SERVER_TIME @"login_server_time" // 登陆时服务器标准时间
#define LOGIN_LOCAL_TIME @"login_local_time" // 登陆时本地标准时间
#define CHAT_SKIN @"chat_skin" // 聊天皮肤
#define LAST_GET_ORDER_USER_TIME @"last_get_order_user_time" // 上一次获取所有传信用户的时间
#define IS_SHOW_BROWSER @"is_show_browser" // 是否显示过浏览页
#define IS_VERSION_UPDATE @"is_version_update" // 是否有更新
#define IS_COMPEL_UPDATE @"is_compel_update" // 是否强制更新
#define VERSION_UPDATE_URL @"version_update_url" // 更新地址
#define VERSION_UPDATE_CONTENT @"version_update_content" // 更新内容
#define VERSION_UPDATE_CODE @"version_update_code" // 更新的版本号
#define VERSION_APK_SIZE @"version_apk_size" // 更新的文件大小
#define NOT_REPEAT_NOTICE @"not_repeat_notice" // 新消息不重复提醒
#define NOT_NEW_PROMPT @"not_new_prompt" // 新消息不弹窗
#define NOT_RETRY @"not_retry" // 传信未送达重发短信
#define WEB_SITE_VERSION @"web_site_version" // 网站信息版本（请求码）
#define WEB_SITE_INFO @"web_site_info" // 网站信息缓存
#define COMPANY_ID @"company_id" // 企业id
#define TRAFFIC_MOBILE_SEND @"traffic_mobile_send" // 移动发送流量
#define TRAFFIC_MOBILE_RECEIVE @"traffic_mobile_receive" // 移动接收流量
#define TRAFFIC_WIFI_SEND @"traffic_wifi_send" // wifi发送流量
#define TRAFFIC_WIFI_RECEIVE @"traffic_wifi_receive" // wifi接收流量
#define DOWNLOAD_APK_VERSION @"download_apk_version" // 下载apk的版本号
#define NOT_AUDIO_CONTINUATION_PLAY @"not_audio_continuation_play" // 未读语音不连续播放
#define BOHAOPAN_VERB_Off_ON @"bohaopan_verb_off_on"// 通话拨号盘震动是否开启
#define BOHAOPAN_VOICE_Off_ON @"bohaopan_voice_off_on"// 通话拨号盘声音是否开启
#define NUMBER_ADDRESS_WINDOWS_SHOW @"number_address_windows_show"// 来电归属地是否开启
#define PREDIALTEL_VIBRATE_STATUS @"predialtel_vibrate_status"// 预拨打电话震动
#define LW_STEALTH @"lw_stealth" // 留言状态隐藏
#define OLD_VERSION @"old_version" // 留言状态隐藏
#define BRAND_MODEL @"brand_model" // 手机品牌型号
#define IS_SHOW_SERVICE_TERM @"is_show_service_term" // 是否显示服务条款
#define RETRY_TIME @"retry_time" // 设置转短信的时间
#define INVITE_CONTENT @"invite_content" // 设置转短信的时间
#define RECEIVE_SMS @"receive_sms"

@class TMConfig;

@interface TMConfig : NSObject

+ (BOOL) isExistConfigFile;
+ (void) createConfigFile;

+ (int) getInt:(NSString *) key;
+ (void) putInt:(NSString *) key value:(int) value;
+ (long) getLong:(NSString *) key;
+ (void) putLong:(NSString *) key value:(long) value;
+ (NSString *) getString:(NSString *) key;
+ (void) putString:(NSString *) key value:(NSString *) value;
+ (BOOL) getBool:(NSString *) key;
+ (void) putBool:(NSString *) key value:(BOOL) value;

+ (NSString *) getWebServerUrl;
+ (NSString *) getCenterServerURl;

@end
