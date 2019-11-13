 
#import "MMResultV2Model.h"

@implementation MMResultV2Model

 

- (id)rCode {
    if ([self.code isKindOfClass:[NSString class]]) {
        return (NSString *)self.code;
    } else if ([self.code isKindOfClass:[NSNumber class]]) {
        return (NSNumber *)self.code;
    }
    return nil;
}




@end
