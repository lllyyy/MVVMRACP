

#import <UIKit/UIKit.h>

typedef void(^CancelBlock)(void);


@interface MMSearchBar : UISearchBar
@property(nonnull, copy) NSString *flag;

@property(nonatomic, strong) UITextField *textfield;
@property (nonatomic,copy) CancelBlock _Nullable cancelBlock;

- (instancetype)initWithFrame:(CGRect)frame flag:(NSString *) flag ;
@end
