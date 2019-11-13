 
#import <Foundation/Foundation.h>

@interface MMBaseAPI : NSObject
+ (RACSignal *)requestWithoutTokenURL: (NSString *) requestURLString
                  withMethodName: (NSString *) methodName
                        withArgs: (NSArray *) array;
    
    
+ (RACSignal *)requestURL: (NSString *) requestURLString
           withMethodName: (NSString *) methodName
                 withArgs: (NSArray *) array;
+ (RACSignal *)requestURLV2: (NSString *) requestURLString
           withMethodName: (NSString *) methodName
                 withArgs: (NSArray *) array;

+ (RACSignal *)requestURLV3: (NSString *) requestURLString
             withMethodName: (NSString *) methodName
                   withArgs: (NSArray *) array;


+ (RACSignal *)httpGETRequest:(NSString *)url params:(NSDictionary*)params;
    
+ (RACSignal *)httpPOSTRequest:(NSString *)url params:(NSDictionary*)params;
+ (RACSignal *)httpAuthPOSTRequest:(NSString *)url params:(NSDictionary*)params;
@end
