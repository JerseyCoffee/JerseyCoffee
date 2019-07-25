//
//  JSDMyCenterViewModel.m
//  JerseyCoffee
//
//  Created by ada on 2019/7/25.
//  Copyright © 2019 jerseyCafe. All rights reserved.
//

#import "JSDMyCenterViewModel.h"

@implementation JSDMyCenterViewModel

- (NSArray<JSDMyCenterModel *> *)listArray {
    
    if (!_listArray) {
        NSArray *array = @[@{
                            @"imageName": @"coffee_tabbar_selected",
                            @"title": @"咖啡的起源",
                            @"detail": @"",
                            @"route": @"JSDCoffeeHistoryVC",
                            },
                           @{
                               @"imageName": @"coffee_tabbar_selected",
                               @"title": @"咖啡的溯源",
                               @"detail": @"",
                               @"route": @"JSDCoffeeHistoryVC",
                               },
                           @{
                               @"imageName": @"coffee_tabbar_selected",
                               @"title": @"咖啡主要产国",
                               @"detail": @"",
                               @"route": @"JSDCoffeeHistoryVC",
                               },
                           @{
                               @"imageName": @"coffee_tabbar_selected",
                               @"title": @"咖啡的分类",
                               @"detail": @"",
                               @"route": @"JSDCoffeeHistoryVC",
                               },
                           @{
                               @"imageName": @"coffee_tabbar_selected",
                               @"title": @"使用反馈",
                               @"detail": @"",
                               @"route": @"",
                               },
                           @{
                               @"imageName": @"coffee_tabbar_selected",
                               @"title": @"关于我们",
                               @"detail": @"",
                               @"route": @"",
                               },
                           @{
                               @"imageName": @"coffee_tabbar_selected",
                               @"title": @"App 版本",
                               @"detail": @"V1.0.0",
                               @"route": @"",
                               },
                           ];
        _listArray = [JSDMyCenterModel mj_objectArrayWithKeyValuesArray:array];
    }
    return _listArray;
}

@end


@implementation JSDMyCenterModel

@end
