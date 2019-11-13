
#import "WRCustomNavigationBar.h"

@class MRCViewModel;

@interface MRCViewController : UIViewController
@property (nonatomic, strong) WRCustomNavigationBar *customNavBar;
/// The `viewModel` parameter in `-initWithViewModel:` method.
@property (nonatomic, strong, readonly) MRCViewModel *viewModel;

@property (nonatomic, strong) UIView *snapshot;

/// Initialization method. This is the preferred way to create a new view.
///
/// viewModel - corresponding view model
///
/// Returns a new view.
- (instancetype)initWithViewModel:(MRCViewModel *)viewModel;

/// Binds the corresponding view model to the view.
- (void)bindViewModel;

 
@end
