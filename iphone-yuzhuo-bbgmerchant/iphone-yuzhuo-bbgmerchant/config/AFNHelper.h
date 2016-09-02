//
//  AFNHelper.h
//  AFN
//
//  Created by l2cplat on 16/5/26.
//  Copyright © 2016年 l2cplat. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@interface AFNHelper : AFHTTPSessionManager


+ (AFNHelper *)sharedManager;


/**
 *  get请求
 *
 *  @param url        接口url
 *  @param parameters 参数
 *  @param success    请求成功的block
 *  @param failure    请求失败的block
 */
+ (void)get:(NSString *)url parameters:(id )parameters success:(void(^)(id object))success faliure:(void(^)(id error))failure;

/**
 *  post请求
 *
 *  @param url        接口url
 *  @param parameters 参数
 *  @param success    请求成功的block
 *  @param failure    请求失败的block
 */
+ (void)post:(NSString *)url parameters:(id)parameters success:(void(^)(id object))success faliure:(void(^)(id error))failure;

/**
 *  文件上传
 *
 *  @param url        接口url
 *  @param parameters 参数
 *  @param block      图片data
 *  @param success    请求成功的block
 *  @param failure    请求失败的block
 */
+ (void)post:(NSString *)url parameters:(id)parameters  constructingBodyWithBlock:(void (^)(id <AFMultipartFormData> formData))block success:(void (^)(id object))success faliure:(void (^)(id error))failure;

/**
 *  文件下载
 *
 *  @param request       下载请求
 *  @param ProgressBlock 下载进度block
 *  @param savePath      储存路径
 *  @param failure       下载失败block
 */
+ (void)downloadTaskWithRequest:(NSURLRequest *)request progress:(void (^)(id downloadProgress))ProgressBlock savePath:(NSString *)savePath  completionHandler:(void (^)(id error))failure;
@end
