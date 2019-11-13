

#import "MMSearchBar.h"

@implementation MMSearchBar

- (instancetype)initWithFrame:(CGRect)frame flag:(NSString *) flag {
    self = [super initWithFrame:frame];
    if (self) {
        self.flag = flag;
          [self initialize];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initialize];
        
        
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initialize];
        
        self.searchBarStyle = UISearchBarStyleDefault;
    }
    return self;
}

//- (void)awakeFromNib {
//    [super awakeFromNib];
//
//    [self initialize];
//}

- (void)initialize {
    [self setBackgroundImage:[UIImage new]];
//    self.barTintColor = MAIN_COLOR;
    self.backgroundColor = [UIColor clearColor];
    self.placeholder = @"搜索";
}

- (void) layoutSubviews {
    [super layoutSubviews];
    @weakify(self)
//    self.textfield = [self valueForKey:@"_searchField"];
//    UITextField * searchField = nil;
        if (@available(iOS 13.0, *)) {
            self.textfield =self.searchTextField;
        }else {
            self.textfield = [self valueForKey:@"_searchField"];
        }
    
    
    
    
    UIImage *image = [UIImage imageNamed: @"search"];
    UIImageView *iView = [[UIImageView alloc] initWithImage:image];
    iView.frame = CGRectMake(0, 0, image.size.width , image.size.height);
    self.textfield.leftView = iView;
    
//    if ([self.flag isEqualToString:@"topNav" ]) {
//         self.textfield.frame = CGRectMake(0, 20 + (44 - 30) / 2 , self.width, 30);
//        NSArray *subViews;
//        subViews = [(self.subviews[0]) subviews];
//        for (id view in subViews) {
//            if ([view isKindOfClass:[UIButton class]]) {
//                UIButton *cancelbutton = (UIButton* )view;
//                 [cancelbutton setTitle:@"" forState:UIControlStateNormal];
//                break;
//            }
//        }
//    }
  // else
    if ([self.flag isEqualToString:@"showCancel" ]) {
        self.textfield.frame = CGRectMake(15, (self.height - 30)/2, self.width - 70, 30);
        NSArray *subViews;
        subViews = [(self.subviews[0]) subviews];
        
        for (id view in subViews) {
            if ([view isKindOfClass:[UIButton class]]) {
                UIButton *cancelbutton = (UIButton* )view;
                [cancelbutton setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
                [cancelbutton setTitle:@"取消" forState:UIControlStateNormal];
//                [cancelbutton setTitleColor:TitleAColor forState:UIControlStateNormal];
                [[ cancelbutton rac_signalForControlEvents:UIControlEventTouchUpInside]
                 subscribeNext:^(id x) {
                     @strongify(self)
                     if (self.cancelBlock) {
                         self.cancelBlock();
                     }
                 }];
                break;
            }
        }
    } else{
        
      //  self.textfield.frame = CGRectMake(15,  (self.height - 30)/2, kScreenWidth - 30 , 30);
    }
//    UIColor *color = TitleCColor;
//    [ self.textfield setValue:color forKeyPath:@"_placeholderLabel.textColor"];
   //  NSMutableAttributedString *arrStr = [[NSMutableAttributedString alloc] initWithString:self.textfield.placeholder attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15],NSForegroundColorAttributeName:TitleCColor}];
    
//    NSMutableAttributedString *arrStr = [[NSMutableAttributedString alloc] initWithString:self.textfield.placeholder attributes:@{   NSForegroundColorAttributeName:TitleCColor}];
//
//
//        self.textfield.attributedPlaceholder = arrStr;
 
    
    
//    self.textfield.font = [UIFont systemFontOfSize:15];
//    self.textfield.textColor = TitleAColor;

    self.textfield.layer.cornerRadius = self.textfield.frame.size.height/2;
    //     self.textfield.layer.borderColor = BorderColor;
    //     self.textfield.layer.borderWidth = 0.5;
    self.textfield.layer.masksToBounds = YES;
    
 }



@end
