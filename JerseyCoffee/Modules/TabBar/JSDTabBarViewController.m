//
//  JSDTabBarViewController.m
//  JerseyCoffee
//
//  Created by Jersey on 2019/7/23.
//  Copyright © 2019 jerseyCafe. All rights reserved.
//

#import "JSDTabBarViewController.h"

#import "JSDBaseNavigationController.h"
#import "JSDBaseViewController.h"
@interface JSDTabBarViewController ()

@end

@implementation JSDTabBarViewController

- (instancetype)init {
    
    self = [super init];
    if (!self) {
        return nil;
    }
    UIEdgeInsets imageInsets = UIEdgeInsetsZero;//UIEdgeInsetsMake(4.5, 0, -4.5, 0);
    UIOffset titlePositionAdjustment = UIOffsetMake(0, -3.5);
    
    CYLTabBarController* tabBarController = [CYLTabBarController tabBarControllerWithViewControllers:self.viewControllers  tabBarItemsAttributes:[self tabBarItemsAttributesForController] imageInsets:imageInsets titlePositionAdjustment:titlePositionAdjustment];
    
    [self customizeTabBarAppearance:tabBarController];
    self.navigationController.navigationBar.hidden = YES;
    return (self = (JSDTabBarViewController *)tabBarController);
}

- (void)customizeTabBarAppearance:(CYLTabBarController *)tabBarController {
    
    [tabBarController setTintColor:[UIColor jsd_skyBluecolor]];
}

- (NSArray *)tabBarItemsAttributesForController {
    
    NSDictionary *coffeeItemsAttributes = @{
                                                 CYLTabBarItemTitle : @"咖啡",
                                                 CYLTabBarItemImage : @"coffee_tabbar_defalut",
                                                 CYLTabBarItemSelectedImage : @"coffee_tabbar_selected",  /* NSString and UIImage are supported*/
                                                 };
    NSDictionary *materialItemsAttributes = @{
                                                  CYLTabBarItemTitle : @"材料",
                                                  CYLTabBarItemImage : @"material_tabbar_defalut2",
                                                  CYLTabBarItemSelectedImage : @"material_tabbar_selecte2",
                                                  };
    NSDictionary *kitItemsAttributes = @{
                                                  CYLTabBarItemTitle : @"器具",
                                                  CYLTabBarItemImage : @"kit_tabbar_defalut",
                                                  CYLTabBarItemSelectedImage : @"kit_tabbar_selected",
                                                  };
    NSDictionary *myItemsAttributes = @{
                                                  CYLTabBarItemTitle : @"我的",
                                                  CYLTabBarItemImage : @"my_tabbar_default",
                                                  CYLTabBarItemSelectedImage : @"my_tabbar_selected",
                                                  };
    
    NSArray *tabBarItemsAttributes = @[
                                       coffeeItemsAttributes,
                                       materialItemsAttributes,
                                       kitItemsAttributes,
                                       myItemsAttributes
                                       ];
    return tabBarItemsAttributes;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


#pragma mark -- set  && get

- (NSArray *)viewControllers {
    
    UIViewController *coffeeVC = [[JSDCoffeeVC alloc] init];
    JSDBaseNavigationController *coffeeNaiVC = [[JSDBaseNavigationController alloc]
                                                  initWithRootViewController:coffeeVC];
    
    [coffeeNaiVC cyl_setHideNavigationBarSeparator:YES];
    [coffeeNaiVC cyl_setNavigationBarHidden:YES];
    UIViewController *materialVC = [[JSDMaterialVC alloc] init];
    JSDBaseNavigationController *materialVCNaiVC = [[JSDBaseNavigationController alloc]
                                                    initWithRootViewController:materialVC];
    UIViewController *kitTypeVC = [[JSDKitTypeVC alloc] init];
    JSDBaseNavigationController *kitTypeNaiVC = [[JSDBaseNavigationController alloc]
                                     initWithRootViewController:kitTypeVC];
    [kitTypeNaiVC cyl_setHideNavigationBarSeparator:NO];

    [materialVCNaiVC cyl_setHideNavigationBarSeparator:NO];
    UIViewController *myCenterVC = [[JSDMyCenterVC alloc] init];
    JSDBaseNavigationController *myCenterNaiVC = [[JSDBaseNavigationController alloc]
                                     initWithRootViewController:myCenterVC];
    [myCenterNaiVC cyl_setHideNavigationBarSeparator:NO];
    NSArray *viewControllers = @[
                                 coffeeNaiVC,
                                 materialVCNaiVC,
                                 kitTypeNaiVC,
                                 myCenterNaiVC,
                                 ];
    return viewControllers;
}

@end
