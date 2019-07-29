//
//  JSDCoffeeViewModel.h
//  JerseyCoffee
//
//  Created by Jersey on 2019/7/25.
//  Copyright © 2019 jerseyCafe. All rights reserved.
//

#import "JSDBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@class JSDCoffeeModel;
@interface JSDCoffeeViewModel : JSDBaseModel

@property (nonatomic, strong) NSMutableArray<JSDCoffeeModel* >* listArray;
- (void)upDateCoffee;
- (void)addDateCoffee: (JSDCoffeeModel* _Nullable)coffeeModel;
- (void)editDataCoffee: (JSDCoffeeModel *)coffeeModel;

@end

@interface JSDCoffeeModel : JSDBaseModel

@property (nonatomic, copy) NSString* imageName;
@property (nonatomic, copy) NSString* coffeeCNName;
@property (nonatomic, copy) NSString* coffeeENName;
@property (nonatomic, copy) NSString* coffeeDetail;
@property (nonatomic, copy) NSString* coffeeID;
@property (nonatomic, assign) float expressoNumber;
@property (nonatomic, assign) float milkNumber;
@property (nonatomic, assign) float waterNumber;
@property (nonatomic, assign) BOOL canEdit;

@end

NS_ASSUME_NONNULL_END
