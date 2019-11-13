
#import "HproseHttpClient+MRCAdditions.h"

@implementation HproseHttpClient (MRCAdditions)

+ (instancetype)sharedInstance {
    static HproseHttpClient *client = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        client = [[HproseHttpClient alloc ] init];
    });
    return client;
}

@end
