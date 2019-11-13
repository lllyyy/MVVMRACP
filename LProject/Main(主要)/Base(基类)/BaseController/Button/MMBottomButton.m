

#import "MMBottomButton.h"
#import "Masonry.h"
 
#import "MMainButton.h"
@implementation MMBottomButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
         
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
   
}
//- (UIView *)buttonBG {
//    if (!_buttonBG) {
//        _buttonBG = [[UIView alloc] init];
//
//        _buttonBG.backgroundColor =  UIColorHex(#FFFFFF);
//
//    }
//    return _buttonBG;
//}


- (UIButton *)buttonOne {
    if (!_buttonOne) {
        _buttonOne = [[UIButton alloc] init];
      //  _buttonOne.titleLabel.font = [UIFont  systemFontOfSize:15];
        _buttonOne.backgroundColor =  UIColorHex(#edf3fe);
       // [_buttonOne setTitleColor:MAIN_COLOR forState: UIControlStateNormal];
    }
    return _buttonOne;
}

- (MMainButton *)buttonTwo {
    if (!_buttonTwo) {
        _buttonTwo = [[MMainButton alloc] init];
//        _buttonTwo.titleLabel.font = [UIFont  systemFontOfSize:15];
       // _buttonTwo.backgroundColor = MAIN_COLOR;
      
    }
    return _buttonTwo;
}
- (UIButton *)buttonThree {
    if (!_buttonThree) {
        _buttonThree = [[UIButton alloc] init];
        _buttonThree.backgroundColor =  UIColorHex(#edf3fe);
      //  [_buttonThree setTitleColor:MAIN_COLOR forState: UIControlStateNormal];
    }
    return _buttonThree;
}

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [[UIButton alloc] init];
      //  _lineView.backgroundColor = MAIN_COLOR;
    }
    return _lineView;
}


- (void)changeStyleOne {
    [self addSubview:self.buttonOne];
    [self addSubview:self.buttonTwo];
    CGFloat btnWidth = ( self.frame.size.width - 15 - 15 - 15  ) / 2;
    [self.buttonOne makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(10);
//        make.bottom.equalTo(self.mas_bottom).offset(-10);
        make.left.equalTo(self.mas_left).offset(15);
        make.width.equalTo(btnWidth);
        make.height.equalTo(45);
    }];
    [self.buttonTwo makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(10);
//        make.bottom.equalTo(self.mas_bottom).offset(-10);
        make.left.equalTo(self.buttonOne.mas_right).offset(15);
        make.width.equalTo(btnWidth);
        make.height.equalTo(45);
    }];
 
//    [self.buttonTwo hyb_addCornerRadius:5];
    self.buttonTwo.layer.cornerRadius = 5;
    self.buttonTwo.layer.masksToBounds = YES;
}
///三个按键
- (void)changeStyleFour {
    [self addSubview:self.buttonOne];
    [self addSubview:self.buttonTwo];
    [self addSubview:self.buttonThree];
    [self addSubview:self.lineView];
    
    [self.buttonTwo setBackgroundImage:[UIImage imageNamed:@"bg_navbar"]  forState:UIControlStateNormal];
    [self.buttonOne updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top);
        make.bottom.equalTo(self.mas_bottom).offset(0);
        make.left.equalTo(self.mas_left).offset(0);
        make.width.equalTo(self.frame.size.width / 3);
    }];
    [self.buttonTwo makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(0);
        make.bottom.equalTo(self.mas_bottom).offset(0);
        make.centerX.equalTo(self.mas_centerX).offset(0);
        make.width.equalTo(self.frame.size.width  / 3);
    }];
    [self.buttonThree updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top);
        make.bottom.equalTo(self.mas_bottom).offset(0);
        make.right.equalTo(self.mas_right).offset(0);
        make.width.equalTo(self.frame.size.width / 3);
    }];
    self.buttonOne.titleLabel.font = [UIFont systemFontOfSize:16];
    self.buttonTwo.titleLabel.font = [UIFont systemFontOfSize:16];
    self.buttonThree.titleLabel.font = [UIFont systemFontOfSize:16];
    self.buttonOne.titleLabel.numberOfLines = 0;
    self.buttonOne.titleLabel.textAlignment = 1;
    self.buttonThree.titleLabel.numberOfLines = 0;
    self.buttonThree.titleLabel.textAlignment = 1;

  

    [self.lineView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(0);
        make.height.equalTo(1);
        make.left.equalTo(0);
        make.width.equalTo(self.frame.size.width);
    }];
    
}
///两个按键
- (void)changeStyleTwo {
    [self addSubview:self.buttonOne];
    [self addSubview:self.buttonTwo];
    [self addSubview:self.lineView];
  
    [self.buttonTwo setBackgroundImage:[UIImage imageNamed:@"bg_navbar"]  forState:UIControlStateNormal];
    [self.buttonOne updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top);
        make.bottom.equalTo(self.mas_bottom).offset(0);
        make.left.equalTo(self.mas_left).offset(0);
        make.width.equalTo(self.frame.size.width / 2);
       
    }];
    [self.buttonTwo makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(0);
        make.bottom.equalTo(self.mas_bottom).offset(0);
        make.left.equalTo(self.buttonOne.mas_right);
        make.width.equalTo(self.frame.size.width  / 2);
 
    }];
   
//    [self.buttonTwo hyb_addCornerRadius:0];
//    self.buttonTwo.layer.cornerRadius = 5;
//    self.buttonTwo.layer.masksToBounds = YES;
    
    [self.lineView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(0);
        make.height.equalTo(1);
        make.left.equalTo(0);
        make.width.equalTo(self.frame.size.width);
    }];
    
}


//
- (void)changeStyleThree {
    [self addSubview:self.buttonTwo];
 
 
    [self.buttonTwo setBackgroundImage:[UIImage imageNamed:@"bg_navbar"]  forState:UIControlStateNormal];
    [self.buttonTwo updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top);
        make.bottom.equalTo(self.mas_bottom).offset(0);
        make.left.equalTo(self.mas_left).offset(0);
        make.width.equalTo(self.frame.size.width);
    }];
   
}

///一个按钮 iphonex底部BUTTON
- (void)buttonStyleOne {
    
    
   
    self.backgroundColor = [UIColor whiteColor] ;
    [self.buttonOne setBackgroundImage:[UIImage imageNamed:@"bg_navbar"]  forState:UIControlStateNormal];
    [self.buttonOne setTitleColor:[UIColor whiteColor] forState: UIControlStateNormal];
    [self addSubview:self.buttonOne];
    
    CGFloat btnWidth = kScreenWidth;
    CGFloat btnLeft = 0;
    CGFloat btnTop = 0;
    
    if (isX || iPhoneXR || iPhoneXS_Max) {
        UIView * lineV=[[UIView alloc] initWithFrame:CGRectMake(0 ,0,  self.width,0.5)];
      //  lineV.backgroundColor = SeparatorLineBColor;
        [self addSubview:lineV];
        
        self.buttonOne.layer.cornerRadius = 45/2;
        self.buttonOne.layer.masksToBounds = YES;
        btnWidth = ( self.frame.size.width - 15 - 15 );
        btnLeft = 15;
        btnTop = 10;
    }
   
    [self.buttonOne makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(btnTop);
       // make.bottom.equalTo(self.mas_bottom).offset(-10);
        make.left.equalTo(self.mas_left).offset(btnLeft);
        make.width.equalTo(btnWidth);
        make.height.equalTo(45);
    }];
  
    
    
  
    
    
    
    
    
}




@end
