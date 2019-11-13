 
#import "MRCWebViewModel.h"

@implementation MRCWebViewModel

- (instancetype)initWithServices:(id<MRCViewModelServices>)services params:(NSDictionary *)params {
    self = [super initWithServices:services params:params];
    if (self) {
        self.request = params[@"request"];
    }
    return self;
}

@end
