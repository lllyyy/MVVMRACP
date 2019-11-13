 
#import "MRCViewController.h"
#import "MRCViewModel.h"

#import "MRCDoubleTitleView.h"
#import "MRCLoadingTitleView.h"
#import "WRNavigationBar.h"
@interface MRCViewController ()  

@property (nonatomic, strong, readwrite) MRCViewModel *viewModel;

@end

@implementation MRCViewController

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    MRCViewController *viewController = [super allocWithZone:zone];

    @weakify(viewController)
    [[viewController
        rac_signalForSelector:@selector(viewDidLoad)]
        subscribeNext:^(id x) {
            @strongify(viewController)
            [viewController bindViewModel];
        }];

    return viewController;
}

- (MRCViewController *)initWithViewModel:(id)viewModel {
    self = [super init];
    if (self) {
        self.viewModel = viewModel;
    }
    return self;
}
- (WRCustomNavigationBar *)customNavBar
{
    if (_customNavBar == nil) {
        _customNavBar = [WRCustomNavigationBar CustomNavigationBar];
    }
    return _customNavBar;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.extendedLayoutIncludesOpaqueBars = YES;
    if (@available(iOS 11.0, *)) {
      // self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
     

    self.navigationController.navigationBar.hidden = YES;
    
 
    [self.view setBackgroundColor: UIColorHex(f5f7fa)];
    //状态栏
   [[UIApplication sharedApplication] setStatusBarStyle: UIStatusBarStyleLightContent];
       //标题颜色
       self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor],NSFontAttributeName:[UIFont boldSystemFontOfSize:18]};
       //导航栏子控件颜色
       [self.navigationController.navigationBar setTintColor:[UIColor whiteColor] ];
       [self.navigationController.navigationBar setBarTintColor: UIColorHex(528ef2)];
       [self.navigationController.navigationBar setTranslucent:NO];
       UINavigationBar *navBar = self.navigationController.navigationBar;
       [navBar setBackgroundImage:[UIImage imageNamed:@"bg_navbar"] forBarMetrics:UIBarMetricsDefault];
       [self.navigationController.navigationBar  setShadowImage:[UIImage new]];
       if (self.navigationController.childViewControllers.count != 1) {
           
           self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"menu_back"]
                                                                                    style:UIBarButtonItemStylePlain   target:self action:@selector(back)];
       }
    
    [self setupNavBar];
    
   self.navigationController.interactivePopGestureRecognizer.enabled = NO;
  
}

-(void)TurnToRight{
    //添加手指向右滑动屏幕时执行的操作
}

-(void)dealloc{
    NSLog(@"=deallocdealloc==  %@",self);
}


- (void)setupNavBar
{
    [self.view addSubview:self.customNavBar];
    
    // 设置自定义导航栏背景图片
    self.customNavBar.barBackgroundImage = [UIImage imageNamed:@"bg_navbar"];
    [self.customNavBar wr_setBottomLineHidden:YES];
    // 设置自定义导航栏标题颜色
//    self.customNavBar.barBackgroundColor = [UIColor redColor];
    self.customNavBar.titleLabelColor = [UIColor whiteColor];
    
    if (self.navigationController.childViewControllers.count != 1) {
        [self.customNavBar wr_setLeftButtonWithImage:[UIImage imageNamed:@"menu_back"]  ];
    }
    @weakify(self)
    
    self.customNavBar.onClickLeftButton = ^{
        @strongify(self)
        [self back];
    };
}


- (void)bindViewModel {
 
    [[RACObserve(self.viewModel, title) ignore:nil ]
                                     subscribeNext:^(id x) {
                                         self.customNavBar.title = x;
                                     }];
    
    [self.viewModel.errors subscribeNext:^(NSError *error) {
       // @strongify(self)

    //    MRCLogError(error);
    }];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.viewModel.willDisappearSignal sendNext:nil];
    
    // Being popped, take a snapshot
    if ([self isMovingFromParentViewController]) {
        self.snapshot = [self.navigationController.view snapshotViewAfterScreenUpdates:NO];
    }
}

- (void)back {
    [self.navigationController popViewControllerAnimated:YES];
}


//- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
//    return [UIDevice currentDevice].isPad ? UIInterfaceOrientationMaskAll : UIInterfaceOrientationMaskPortrait;
//}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

//#pragma mark - 页面旋转
- (BOOL)shouldAutorotate {
    return NO;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskPortrait  ;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return UIInterfaceOrientationPortrait;
}
@end
