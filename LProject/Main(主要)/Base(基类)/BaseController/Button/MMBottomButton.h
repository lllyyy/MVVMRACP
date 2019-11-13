 
#import <UIKit/UIKit.h>
#import "MMainButton.h"
@interface MMBottomButton : UIView
//@property(nonatomic, strong) UIView *buttonBG;

@property(nonatomic, strong) UIButton *buttonOne;

@property(nonatomic, strong) MMainButton *buttonTwo;

@property(nonatomic, strong) UIButton *buttonThree;

@property(nonatomic, strong) UIButton *lineView;

- (void)changeStyleOne;
 
- (void)changeStyleTwo;
- (void)changeStyleThree;
- (void)changeStyleFour;
- (void)buttonStyleOne ;
- (void)buttonBGStyleOne;
@end
