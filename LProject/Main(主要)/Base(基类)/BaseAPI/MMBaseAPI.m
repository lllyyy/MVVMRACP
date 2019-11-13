 
#import "MMBaseAPI.h"

#import "MMResultModel.h"
#import "MMResultV2Model.h"
#import "HproseHttpClient+MRCAdditions.h"
#import "NSString+DictionaryValue.h"

@implementation MMBaseAPI
static HproseHttpClient *client = nil;
+ (RACSignal *)requestWithoutTokenURL: (NSString *) requestURLString
           withMethodName: (NSString *) methodName
                 withArgs: (NSArray *) array {
    
        if ([AppDelegate sharedInstanced].networkStatus == NotReachable) {
            [MBProgressHUD showAutoMessage:@"无网络！请检查您的手机网络"];
            return [RACSignal empty];
        }
    NSLog(@"withArgs  %@", array);
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        [[HproseHttpClient sharedInstance] setUri:requestURLString];
        [[HproseHttpClient sharedInstance] invoke:methodName withArgs:array settings:@{@"block":^(id result, NSArray * args) {
            
            NSDictionary *dict =  [(NSString *)result dictionaryValue] ;
            NSLog(@"return result  %@", dict);
            [subscriber sendNext: dict];
            [subscriber sendCompleted];
        }, @"errorBlock":^(NSString *name, NSException *e) {
            NSLog(@"NSException%@ %@ ", name, e);
            NSError *error = [NSError errorWithDomain:[NSString stringWithFormat:@"%@", e] code:0 userInfo:nil];
            [subscriber sendError:error];
            [MBProgressHUD hideHUDForView:[AppDelegate sharedInstanced].window animated:YES];
            [MBProgressHUD showAutoMessage:@"服务错误，请稍后再试"];
        }}];
        return [RACDisposable disposableWithBlock:^{
            
        }];
    }];
}


+ (RACSignal *)requestURL: (NSString *) requestURLString
           withMethodName: (NSString *) methodName
                 withArgs: (NSArray *) array {
    
    if ([AppDelegate sharedInstanced].networkStatus == NotReachable) {
 
         [MBProgressHUD showAutoMessage:@"无网络！请检查您的手机网络"];
        return [RACSignal empty];
    }
    NSLog(@"requestURLString  %@", requestURLString);
    NSLog(@"methodName  %@", methodName);
    NSLog(@"withArgs  %@", array);
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        [[HproseHttpClient sharedInstance] setUri:requestURLString];
        [[HproseHttpClient sharedInstance] setValue:@"[MMUserSession getRPCToken]" forHTTPHeaderField:@"RPC-TOKEN"];
        [[HproseHttpClient sharedInstance] invoke:methodName withArgs:array settings:@{@"block":^(id result, NSArray * args) {
         
            NSDictionary *dict = [(NSString *)result dictionaryValue] ;
//         NSLog(@"result  %@", result);
            MMResultModel *model = [MMResultModel modelWithDictionary:dict];
            NSLog(@"dictdict  %@", dict);
          
            [subscriber sendNext: model];
            [subscriber sendCompleted];
        }, @"errorBlock":^(NSString *name, NSException *e) {
            NSLog(@"NSException%@ %@ ", name, e);
            NSError *error = [NSError errorWithDomain:[NSString stringWithFormat:@"%@", e] code:0 userInfo:nil];
            [subscriber sendError:error];
            [MBProgressHUD hideHUDForView:[AppDelegate sharedInstanced].window animated:YES];
             [MBProgressHUD showAutoMessage:@"服务错误，请稍后再试"];
        }}];
        return [RACDisposable disposableWithBlock:^{
            
            
        }];
    }];
}


+ (RACSignal *)requestURLV2: (NSString *) requestURLString
           withMethodName: (NSString *) methodName
                 withArgs: (NSArray *) array {
    
    if ([AppDelegate sharedInstanced].networkStatus == NotReachable) {
         [MBProgressHUD showAutoMessage:@"无网络！请检查您的手机网络"];
        return [RACSignal empty];
    }
    NSLog(@"withArgs  %@", array);
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        [[HproseHttpClient sharedInstance] setUri:requestURLString];
        [[HproseHttpClient sharedInstance] setValue:@"[MMUserSession getRPCToken]" forHTTPHeaderField:@"RPC-TOKEN"];
        [[HproseHttpClient sharedInstance] invoke:methodName withArgs:array settings:@{@"block":^(id result, NSArray * args) {
            
            NSDictionary *dict = [(NSString *)result dictionaryValue] ;
            NSLog(@"return result  %@", dict);
            
            NSLog(@"withArgs--- %@-------  %@", methodName,dict);

            MMResultV2Model *model = [MMResultV2Model modelWithDictionary:dict];
            NSLog(@"message  %@", model.message);
            [subscriber sendNext: model];
            [subscriber sendCompleted];
        }, @"errorBlock":^(NSString *name, NSException *e) {
            NSLog(@"NSException%@ %@ ", name, e);
            NSError *error = [NSError errorWithDomain:[NSString stringWithFormat:@"%@", e] code:0 userInfo:nil];
            [subscriber sendError:error];
            [MBProgressHUD hideHUDForView:[AppDelegate sharedInstanced].window animated:YES];
             [MBProgressHUD showAutoMessage:@"服务错误，请稍后再试"];
        }}];
        return [RACDisposable disposableWithBlock:^{
            
            
        }];
    }];
}

+ (RACSignal *)requestURLV3: (NSString *) requestURLString
             withMethodName: (NSString *) methodName
                   withArgs: (NSArray *) array {
    
    if ([AppDelegate sharedInstanced].networkStatus == NotReachable) {
        [MBProgressHUD showAutoMessage:@"无网络！请检查您的手机网络"];
        return [RACSignal empty];
    }
    NSLog(@"withArgs  %@", array);
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        [[HproseHttpClient sharedInstance] setUri:requestURLString];
        [[HproseHttpClient sharedInstance] setValue:@"[MMUserSession getRPCToken]" forHTTPHeaderField:@"RPC-TOKEN"];
        [[HproseHttpClient sharedInstance] invoke:methodName withArgs:array settings:@{@"block":^(id result, NSArray * args) {
            
            NSDictionary *dict = [(NSString *)result dictionaryValue] ;
            [subscriber sendNext: dict];
            [subscriber sendCompleted];
        }, @"errorBlock":^(NSString *name, NSException *e) {
            NSLog(@"NSException%@ %@ ", name, e);
            NSError *error = [NSError errorWithDomain:[NSString stringWithFormat:@"%@", e] code:0 userInfo:nil];
            [subscriber sendError:error];
            [MBProgressHUD hideHUDForView:[AppDelegate sharedInstanced].window animated:YES];
            [MBProgressHUD showAutoMessage:@"服务错误，请稍后再试"];
        }}];
        return [RACDisposable disposableWithBlock:^{
            
            
        }];
    }];
}



+ (RACSignal *)httpGETRequest:(NSString *)url params:(NSDictionary*)params{
        if ([AppDelegate sharedInstanced].networkStatus == NotReachable) {
             [MBProgressHUD showAutoMessage:@"无网络！请检查您的手机网络"];
            return [RACSignal empty];
        }
    
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
         NSLog(@"url %@",url);
         NSLog(@"params %@",params);
        AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
 
        sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html",nil];//设置相应内容类型
        [sessionManager GET:url parameters:params
                   progress:^(NSProgress *downloadProgress) {
                   } success:^(NSURLSessionDataTask *task, id responseObject) {
                       NSLog(@" %@",responseObject);
                     
                       
                       [subscriber sendNext:responseObject];
                       [subscriber sendCompleted];
                   } failure:^(NSURLSessionDataTask *task, NSError *error) {
                       //                 showMsg([NSString stringWithFormat:@"%@", error.domain] ];
                       NSLog(@"Error: %@", error);
                       [subscriber sendError:error];
                   }];
        
        return [RACDisposable disposableWithBlock:^{
        }];
        
    }];
   
    
}



+ (RACSignal *)httpPOSTRequest:(NSString *)url params:(NSDictionary*)params{
    
        if ([AppDelegate sharedInstanced].networkStatus == NotReachable) {
             [MBProgressHUD showAutoMessage:@"无网络！请检查您的手机网络"];
            return [RACSignal empty];
        }
    
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
         sessionManager.responseSerializer = [AFHTTPResponseSerializer serializer];
        sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html",nil];//设
        [sessionManager POST:url
                  parameters:params
                   progress:^(NSProgress *downloadProgress) {
                       
                   }
                    success:^(NSURLSessionDataTask *task, id responseObject) {
//                      NSLog(@"responseObject%@", responseObject)
                        NSString *result = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
//                                 NSLog(@"result%@", result)
                        
                        NSDictionary *dict = [(NSString *)result dictionaryValue] ;
//                            NSLog(@"dict%@", dict)
                        [subscriber sendNext:dict];
                        [subscriber sendCompleted];
                    }
                    failure:^(NSURLSessionDataTask *task, NSError *error) {
                        NSLog(@"errorerrorerror%@", error);
                        [subscriber sendError:error];
                    }];
        return [RACDisposable disposableWithBlock:^{
        }];
    }];
    
}


//
//+ (RACSignal *)getJWToken {
//    NSString *url =  @"http://service.zmmedical.cn/api/auth/jwt/login";
//    
//    return [MMBaseAPI httpPOSTRequest:url params:@{@"email": @"demo@demo.com", @"password": @"123456"} ];
//}


+ (RACSignal *)httpAuthPOSTRequest:(NSString *)url params:(NSDictionary*)params{
    
    if ([AppDelegate sharedInstanced].networkStatus == NotReachable) {
          [MBProgressHUD showAutoMessage:@"无网络！请检查您的手机网络"];
        return [RACSignal empty];
    }
    
    NSString *jwToken =  @"[MMUserSession getJWToken];";
    if (jwToken == nil) {
       
    }
    
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
    
        AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
        sessionManager.responseSerializer = [AFHTTPResponseSerializer serializer];
        sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html",nil];//设
        [sessionManager.requestSerializer setValue:jwToken forHTTPHeaderField:@"Authorization"];
        [sessionManager POST:url
                  parameters:params
                    progress:^(NSProgress *downloadProgress) {
                        
                    }
                     success:^(NSURLSessionDataTask *task, id responseObject) {
                         //                      NSLog(@"responseObject%@", responseObject)
                         NSString *result = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
                         //                                 NSLog(@"result%@", result)
                         
                         NSDictionary *dict = [(NSString *)result dictionaryValue] ;
                         //                            NSLog(@"dict%@", dict)
                         [subscriber sendNext:dict];
                         [subscriber sendCompleted];
                     }
                     failure:^(NSURLSessionDataTask *task, NSError *error) {
                         NSLog(@"errorerrorerror%@", error);
                         [subscriber sendError:error];
                     }];
        return [RACDisposable disposableWithBlock:^{
        }];
    }];
    
    
}





+ (RACSignal *)httpPOSTImagesRequest:(NSString *)url params:(NSDictionary*)params images:(NSArray *)images name:(NSString *)name fileName:(NSString *)fileName{
    
        if ([AppDelegate sharedInstanced].networkStatus == NotReachable) {
              [MBProgressHUD showAutoMessage:@"无网络！请检查您的手机网络"];
            return [RACSignal empty];
        }
    
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] multipartFormRequestWithMethod:@"POST" URLString:url parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
            //   [formData appendPartWithFileURL:[NSURL fileURLWithPath:@"file://path/to/image.jpg"] name:@"AvatarFileInput[]" fileName:@"filename.jpg" mimeType:@"image/png" error:nil];
            
            for(UIImage *image in images){
                NSData *imageData = UIImageJPEGRepresentation(image, 0.5);
                [formData appendPartWithFileData:imageData name:name fileName:fileName mimeType:@"image/png"];
            }
            
        } error:nil];
        
        //  AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
        
        AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
        sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
        
        
        NSURLSessionUploadTask *uploadTask;
        uploadTask = [sessionManager
                      uploadTaskWithStreamedRequest:request
                      progress:^(NSProgress * _Nonnull uploadProgress) {
                          // This is not called back on the main queue.
                          // You are responsible for dispatching to the main queue for UI updates
                          dispatch_async(dispatch_get_main_queue(), ^{
                              //Update the progress view
                              // [progressView setProgress:uploadProgress.fractionCompleted];
                          });
                      }
                      completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
                          if (error) {
                           
                               [MBProgressHUD showAutoMessage:error.domain];
                              
                              NSLog(@"Error: %@", error);
                              [subscriber sendError:error];
                          } else {
                              NSLog(@"%@ %@", response, responseObject);
                              
                              [subscriber sendNext:responseObject];
                              [subscriber sendCompleted];
                          }
                      }];
        
        [uploadTask resume];
        return [RACDisposable disposableWithBlock:^{
        }];
        
    }];
    
}

@end
