 
#import "MRCViewModelServicesImpl.h"
@implementation MRCViewModelServicesImpl

- (instancetype)init {
    self = [super init];
    if (self) {
       
    }
    return self;
}

- (void)pushViewModel:(MRCViewModel *)viewModel animated:(BOOL)animated {}

- (void)popViewModelAnimated:(BOOL)animated {}

- (void)popToRootViewModelAnimated:(BOOL)animated {}

- (void)presentViewModel:(MRCViewModel *)viewModel animated:(BOOL)animated completion:(VoidBlock)completion {}

- (void)dismissViewModelAnimated:(BOOL)animated completion:(VoidBlock)completion {}

- (void)resetRootViewModel:(MRCViewModel *)viewModel {}

@end
