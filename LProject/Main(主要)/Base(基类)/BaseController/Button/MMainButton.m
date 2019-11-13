#import "MMainButton.h"


@implementation MMainButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self configureButton];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self configureButton];
    }
    return self;
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
//    self.titleLabel.font = [UIFont systemFontOfSize:16];
}

- (void)configureButton
{
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self setTitleColor: UIColorHex(c7d2fe) forState:UIControlStateDisabled];
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [self setBackgroundImage:[UIImage imageNamed:@"btn_bottom"] forState:UIControlStateNormal];
    [self setBackgroundImage:[UIImage imageNamed:@"btn_bottom_no"] forState:UIControlStateDisabled];
    [self setBackgroundImage:[UIImage imageNamed:@"btn_bottom_active"] forState:UIControlStateHighlighted];
}

@end
