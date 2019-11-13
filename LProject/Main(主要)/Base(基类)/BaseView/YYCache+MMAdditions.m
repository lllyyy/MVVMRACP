
#import "YYCache+MMAdditions.h"

@implementation YYCache (MMAdditions)

+ (instancetype)sharedCache {
    static YYCache *sharedCache = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
       
        sharedCache = [YYCache cacheWithName:@"Doctor"];
    });
    return sharedCache;
}

@end
