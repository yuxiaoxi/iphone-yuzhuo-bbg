//
//  AFNHelper.m
//  AFN
//
//  Created by l2cplat on 16/5/26.
//  Copyright © 2016年 l2cplat. All rights reserved.
//

#import "AFNHelper.h"
#import "BBGConfig.h"

@implementation AFNHelper

+ (AFNHelper *)sharedManager {
    
    static AFNHelper *handle = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        handle = [[AFNHelper  alloc] initWithBaseURL:[NSURL URLWithString:DebugUrl]];
        handle.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain",@"application/json",@"text/json",@"text/javascript",@"text/html",nil];
        [handle.requestSerializer setValue:@"ab9ef204-3253-49d4-b229-3cc2383480a6" forHTTPHeaderField:@"BBG-Key"];
        [handle.requestSerializer setStringEncoding:NSUTF8StringEncoding];
        
    });
    
    return handle;
    
}


//get请求
+ (void)get:(NSString *)url parameters:(id)parameters success:(void (^)(id object))success faliure:(void (^)(id error))failure
{
    
    [[AFNHelper sharedManager] GET:url parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        
        
        success(responseObject);
        
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        failure(error);
        
    }];
}

//post请求
+ (void)post:(NSString *)url parameters:(id)parameters success:(void(^)(id object))success faliure:(void(^)(id error))failure {
    
    [[AFNHelper sharedManager] POST:url parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        
        
        success(responseObject);
        
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        failure(error);
        
    }];
    
    
}

//文件上传
+ (void)post:(NSString *)url parameters:(id)parameters  constructingBodyWithBlock:(void (^)(id <AFMultipartFormData> formData))block success:(void (^)(id object))success faliure:(void (^)(id error))failure{
    
    [[AFNHelper sharedManager] POST:url parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        block(formData);
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        
        success(responseObject);
        
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        failure(error);
        
    }];
    
    
}

//文件下载
+ (void)downloadTaskWithRequest:(NSURLRequest *)request progress:(void (^)(id downloadProgress))ProgressBlock savePath:(NSString *)savePath  completionHandler:(void (^)(id error))failure {
    
    [[AFNHelper sharedManager]  downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
        
        ProgressBlock(downloadProgress);
        
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        
        return  [NSURL URLWithString:savePath];
        
    }completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        
        if (error) {
            
            failure(error);
        }
        
    }];
    
    
}
@end
