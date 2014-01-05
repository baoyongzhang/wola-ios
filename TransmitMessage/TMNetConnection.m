//
//  TMNetConnection.m
//  TransmitMessage
//
//  Created by Baoyongzhang on 13-10-14.
//  Copyright (c) 2013年 Baoyongzhang. All rights reserved.
//

#import "TMNetConnection.h"
#import "Reachability.h"
#import "TMRequest.h"
#import "TMConfig.h"
#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"
#import "ASIDownloadCache.h"
#import "TMResponse.h"

#define UserAgent @"TM-Iphone"
#define TimeOut 60
#define RetryTimes 2

//定义服务器响应码
typedef enum {
	RequestStatus_OK = 200,
    RequestStatus_ErrorRequest = 400,
    RequestStatus_NotFound = 404,
    RequestStatus_Error = 500,
    RequestStatus_ConnError = -1,
}RequestStatus;

@implementation TMNetConnection

+(BOOL)isNetworkAvailable{
    BOOL hasInternet;
    Reachability *r = [Reachability reachabilityWithHostName:@"www.baidu.com"];
    switch ([r currentReachabilityStatus]) {
        case NotReachable:
            hasInternet = NO;
            break;
        case ReachableViaWWAN:
            // 使用3G网络
            hasInternet = YES;
            break;
        case ReachableViaWiFi:
            hasInternet = YES;
            // 使用WiFi网络
            break;
    }
    return hasInternet;
}

+(int)getNetworkType
{
    Reachability *r = [Reachability reachabilityWithHostName:@"www.baidu.com"];
    switch ([r currentReachabilityStatus]) {
        case NotReachable:
            return 0;
        case ReachableViaWWAN:
            // 使用3G网网络
            return 1;
        case ReachableViaWiFi:
            // 使用WiFi网络
            return 2;
    }
    return -1;
}

+(void)requestCenterServer:(TMRequest *)req success:(void (^)(TMResponse *))success faid:(void (^)(NSString *))fail
{
    [self asyncPostRequest:[TMConfig getCenterServerURl] withData:[req createJson] complete:^(NSString *respStr){
        // 请求成功，解析响应
        TMResponse *resp = [TMResponse responseWithType:req.type respJson:respStr];
        success(resp);
    } failed:^(int code) {
        // 请求失败
    }];
}

+(void)requestWebServer:(TMRequest *)req success:(void (^)(TMResponse *))success faid:(void (^)(NSString *))fail
{
    
}

+(ASIHTTPRequest *)requestWithUrl:(NSString *)urlStr
{
    NSLog(@"请求地址：%@",urlStr);
    
    ASIHTTPRequest *request = [[ASIHTTPRequest alloc] initWithURL:[NSURL URLWithString:[urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]];
    //[ASIFormDataRequest alloc]initWithUR
    [request setUserAgent:UserAgent];
    
    //设置超时
    [request setTimeOutSeconds:TimeOut];//设置超时时间
    [request setNumberOfTimesToRetryOnTimeout:RetryTimes];//超时重试次数
    
    //设置缓存
    //    [request setDownloadCache:[ASIDownloadCache sharedCache]];//设置下载缓存
    //    [request setCachePolicy:ASIAskServerIfModifiedWhenStaleCachePolicy];//缓存策略
    //    [request setCachePolicy:ASIAskServerIfModifiedCachePolicy];
    //    [request setCacheStoragePolicy:ASICacheForSessionDurationCacheStoragePolicy];//缓存存储方式
    //    [request setSecondsToCache:60*60*24*30];// 缓存30天
    
    //return [request autorelease];
    return request;
}

+ (ASIFormDataRequest *)formRequestWithUrl:(NSString *)urlStr{
//    NSLog(@"请求地址:%@",urlStr);
    
    ASIFormDataRequest *request = [[ASIFormDataRequest alloc] initWithURL:[NSURL URLWithString:[urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]];
    [request setUserAgent:UserAgent];
    
    //设置超时
    [request setTimeOutSeconds:TimeOut];//设置超时时间
    [request setNumberOfTimesToRetryOnTimeout:RetryTimes];//超时重试次数
    
    //设置缓存
    //    [request setDownloadCache:[ASIDownloadCache sharedCache]];//设置下载缓存
    //    [request setCachePolicy:ASIAskServerIfModifiedWhenStaleCachePolicy];//缓存策略
    //    [request setCacheStoragePolicy:ASICacheForSessionDurationCacheStoragePolicy];//缓存存储方式
    //    [request setSecondsToCache:60*60*24*30];// 缓存30天
    
    return request;
}

/**************************************************************************************/

//发送异步Get请求
+ (ASIHTTPRequest *)asyncGetRequest:(NSString *)url
                           complete:(void (^)(NSString *responseStr))complete
                             failed:(void (^)(int code))failed{
    
    ASIHTTPRequest *request = [self requestWithUrl:url];
    
    //请求成功
    [request setCompletionBlock:^{
        if(request.responseStatusCode == RequestStatus_OK) {
            complete(request.responseString);
        } else{
            failed(request.responseStatusCode);
        }
    }];
    
    //请求失败
    [request setFailedBlock:^{
        failed(RequestStatus_ConnError);
    }];
    
    //开始请求
    [request startAsynchronous];
    return request;
}

//
+ (ASIFormDataRequest *)asyncPostRequest:(NSString *)url
                                withData:(NSData *)data
                                complete:(void (^)(NSString *responseStr))complete
                                  failed:(void (^)(int code))failed
{
    ASIFormDataRequest *request = [self formRequestWithUrl:url];
    [ASIHTTPRequest setShouldUpdateNetworkActivityIndicator:YES];
//    [request setPostValue:@"image/png" forKey:@"Content-Type"];
//    [request setPostValue:[NSString stringWithFormat:@"%d",[data length]] forKey:@"Content-Length"];
    [request setPostBody:(NSMutableData *)data];
    //请求成功
    [request setCompletionBlock:^{
        if(request.responseStatusCode == RequestStatus_OK) {
            complete(request.responseString);
        } else{
            failed(request.responseStatusCode);
        }
    }];
    
    //请求失败
    [request setFailedBlock:^{
        failed(RequestStatus_ConnError);
    }];
    
    //开始请求
    [request startAsynchronous];
    return request;
}

//异步Post请求
+ (ASIFormDataRequest *)asyncPostRequest:(NSString *)url
                              parameters:(NSDictionary *)params
                                complete:(void (^)(NSString *responseStr))complete
                                  failed:(void (^)(NSString *errorMsg))failed{
    
    ASIFormDataRequest *request = [self formRequestWithUrl:url];
    [ASIHTTPRequest setShouldUpdateNetworkActivityIndicator:YES];
    //设置请求参数
	if (params != nil) {
		NSArray *parameterKeys_ = [params allKeys];
		for (int i=0; i<[parameterKeys_ count]; i++) {
			id key_ = [parameterKeys_ objectAtIndex:i];
			id value_ = [params objectForKey:key_];
			[request setPostValue:value_ forKey:key_];
		}
	}
    
    //请求成功
    [request setCompletionBlock:^{
        switch (request.responseStatusCode) {
            case RequestStatus_OK:
                complete(request.responseString);break;
            case RequestStatus_ErrorRequest:
                failed(@"错误的请求");break;
            case RequestStatus_NotFound:
                failed(@"找不到指定的资源");break;
            case RequestStatus_Error:
                failed(@"内部服务器错误");break;
            default:
                failed(@"服务器出错");break;
        }
    }];
    
    //请求失败
    [request setFailedBlock:^{
        failed([NSString stringWithFormat:@"内部错误,请稍后再试..."]);
    }];
    
    //开始请求
    [request startAsynchronous];
    return request;
}

//异步下载请求
+ (ASIHTTPRequest *)asyncDownloadRequest:(NSString *)url
                                complete:(void (^)(NSData *responseData))complete
                                  failed:(void (^)(NSString *errorMsg))failed{
    
    ASIHTTPRequest *request = [self requestWithUrl:url];
    
    //下载完成
    [request setDataReceivedBlock:^(NSData *data) {
        switch (request.responseStatusCode) {
            case RequestStatus_OK:
                complete(data);break;
            case RequestStatus_ErrorRequest:
                failed(@"错误的请求");break;
            case RequestStatus_NotFound:
                failed(@"找不到指定的资源");break;
            case RequestStatus_Error:
                failed(@"内部服务器错误");break;
            default:
                failed(@"服务器出错");break;
        }
    }];
    
    //请求失败
    [request setFailedBlock:^{
        failed([NSString stringWithFormat:@"未知错误:%@",[request.error localizedDescription]]);
    }];
    
    //开始请求
    [request startAsynchronous];
    return request;
}

+ (ASIFormDataRequest *)createAsyncRequest:(NSString *)url_ tag:(int)tag {
	NSString *url = url_;
	
	ASIFormDataRequest *request = [[ASIFormDataRequest alloc] initWithURL:[NSURL URLWithString:url]];
    [request setRequestMethod:@"GET"];
    //
    //	[request addRequestHeader:@"Host" value:SERVICE_DOMAIN];
    //	[request addRequestHeader:@"Refresh" value:SERVICE_DOMAIN];
    //	[request addRequestHeader:@"Accept" value:@"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"];
    //	[request addRequestHeader:@"Accept-Encoding" value:@"gzip, deflate"];
    //	[request addRequestHeader:@"Accept-Charset" value:@"ISO-8859-1,utf-8;q=0.7,*;q=0.7"];
    //	[request addRequestHeader:@"Connection" value:@"keep-alive"];
    //	[request addRequestHeader:@"Cookie" value:@"ASP.NET_SessionId=ri3rjg45t5rttp2n1gi2cpqh"];
    //	//	[request addRequestHeader:@"If-Modified-Since" value:@"Wed, 05 Oct 2011 07:02:46 GMT"];
    //	//	[request addRequestHeader:@"If-None-Match" value:@"\"448fec92c83cc1:2930\""];
    //	[request addRequestHeader:@"Cache-Control" value:@"max-age=0"];
    //	//	[request addRequestHeader:@"(Request-Line)" value:@"web32818.w131.vhost002.cn"];
	
	NSMutableDictionary *userInfo = [NSMutableDictionary dictionaryWithObject:[NSString stringWithFormat:@"%d",tag] forKey:@"t_tag"];
	[request setUserInfo:userInfo];
	
	[request setTimeOutSeconds:TimeOut];
	
	return request;
}


@end
