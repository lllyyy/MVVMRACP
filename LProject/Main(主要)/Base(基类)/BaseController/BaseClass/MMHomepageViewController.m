#import "MMHomepageViewController.h"
 #import "LLHomeVC.h"
 #import "LLHomeViewModel.h"
 #import "LLFoundVC.h"
 #import "LLMessageViewModel.h"
 #import "LLMessageVC.h"
 #import "LLMyVC.h"


@interface MMHomepageViewController()<UINavigationControllerDelegate>
//@property (nonatomic, strong) MMHomepageViewModel *viewModel;


@property (nonatomic, assign) NSInteger lastSelectIndex;
@property (nonatomic, strong) UIView *redPoint;
@property (nonatomic, strong) UIView *line;
@property (nonatomic, strong) id popDelegate;
/** 保存所有控制器对应按钮的内容（UITabBarItem）*/
@property (nonatomic, strong) NSMutableArray *items;

@end

@implementation MMHomepageViewController
@dynamic viewModel;
+ (void)initialize {
    // 设置tabbarItem的普通文字
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    //textAttrs[NSForegroundColorAttributeName] =  TitleBColor;
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:10];
    
    //设置tabBarItem的选中文字颜色
    NSMutableDictionary *selectedTextAttrs = [NSMutableDictionary dictionary];
   // selectedTextAttrs[NSForegroundColorAttributeName] = MAIN_COLOR;
    
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedTextAttrs forState:UIControlStateSelected];
}
- (NSMutableArray *)items {
    if (_items == nil) {
        _items = [NSMutableArray array];
    }
    return _items;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
     
    [self addAllChildVC];
 
    self.tabBarController.delegate = self;
    [self.tabBarController.tabBar setTranslucent:NO];
    [self.tabBarController.tabBar setTintColor:UIColorHex(528ef2)];
    [self.tabBarController.tabBar setBackgroundColor:RGB(248, 248, 248)];
    [self.tabBarController.tabBar setShadowImage:[UIImage imageWithColor:UIColorHex(f0f2f5) size:CGSizeMake(self.view.frame.size.width, .5)]];
 
   [self.tabBarController setSelectedIndex:0];
 
    /*
    [[[[NSNotificationCenter defaultCenter]
       rac_addObserverForName:@"tabbar" object:nil]
      map:^id(NSNotification *notification) {
             return notification.object;
      }]
    subscribeNext:^(NSString *x) {
        self.tabBarController.selectedIndex = x.intValue;
         if (x.intValue == 0) {
             
          //  [[AppDelegate sharedInstanced].navigationControllerStack pushNavigationController:ANavigationController];
         } else if (x.intValue == 1) {
             self.tabBarController.selectedIndex = x.intValue;
             //  [[AppDelegate sharedInstanced].navigationControllerStack pushNavigationController:BNavigationController];
         } else if (x.intValue == 2) {
             self.tabBarController.selectedIndex = x.intValue;
             //  [[AppDelegate sharedInstanced].navigationControllerStack pushNavigationController:BNavigationController];
         }  else if (x.intValue == 3) {
                 self.tabBarController.selectedIndex = x.intValue;
               //  [[AppDelegate sharedInstanced].navigationControllerStack pushNavigationController:BNavigationController];
         }else if(x.intValue == 4){
              self.tabBarController.selectedIndex = x.intValue;
              [[AppDelegate sharedInstanced].navigationControllerStack pushNavigationController:nav5];
         }else{
           
         }
    }];
    */
   
}

 
/**
 *  添加所有的子控制器
 */
- (void)addAllChildVC {
    // 添加所有子控制器

 
       LLHomeViewModel *vm = [[LLHomeViewModel alloc]initWithServices:nil params:@{}];
       LLHomeVC *firstViewController = [[LLHomeVC alloc] initWithViewModel:vm];
       [self addOneChildVC:firstViewController title:@"我" imageName:@"tab_user_gray" selectedImageName:@"tab_user"];
       
       LLFoundVC *secondViewController = [[LLFoundVC alloc] init];
       [self addOneChildVC:secondViewController title:@"我" imageName:@"tab_user_gray" selectedImageName:@"tab_user"];
       
       LLMessageViewModel *vma = [[LLMessageViewModel alloc]initWithServices:nil params:nil];
       LLMessageVC *thirdViewController = [[LLMessageVC alloc] initWithViewModel:vma];
       [self addOneChildVC:thirdViewController title:@"我" imageName:@"tab_user_gray" selectedImageName:@"tab_user"];
       
       LLMyVC *fourthViewController = [[LLMyVC alloc] init];
       [self addOneChildVC:fourthViewController title:@"我" imageName:@"tab_user_gray" selectedImageName:@"tab_user"];
 
}

/**
 *  添加一个自控制器
 *
 *  @param childVc           子控制器对象
 *  @param title             标题
 *  @param imageName         图标
 *  @param selectedImageName 选中时的图标
 */

- (MRCNavigationController *)addOneChildVC:(UIViewController *)childVc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName {
    // 设置标题
    childVc.tabBarItem.title = title;

    // 设置图标
    childVc.tabBarItem.image = [UIImage imageNamed:imageName];

    // 设置选中的图标
    UIImage *selectedImage = [UIImage imageNamed:selectedImageName];
    // 不要渲染
    selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVc.tabBarItem.selectedImage = selectedImage;

    // 记录所有控制器对应按钮的内容
    [self.items addObject:childVc.tabBarItem];

    // 添加为tabbar控制器的子控制器
    MRCNavigationController *nav = [[MRCNavigationController alloc] initWithRootViewController:childVc];
//    nav.navigationBarHidden = YES;
// 	[nav.navigationBar setTranslucent:YES];
    nav.delegate = self;
    [self.tabBarController addChildViewController:nav];

    return nav;
}


 

 

 
  
 #pragma mark navVC代理
 - (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
      
     
 }


 


 @end
