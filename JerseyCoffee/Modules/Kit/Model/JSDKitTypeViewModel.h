//
//  JSDKitTypeViewModel.h
//  JerseyCoffee
//
//  Created by Jersey on 2019/7/25.
//  Copyright © 2019 jerseyCafe. All rights reserved.
//

#import "JSDBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@class JSDKitTypeModel;
@interface JSDKitTypeViewModel : JSDBaseModel

@property (nonatomic, strong) NSArray<JSDKitTypeModel* >* listArray;

@end

@interface JSDKitTypeModel : JSDBaseModel

@property (nonatomic, copy) NSString* imageName;
@property (nonatomic, copy) NSString* coffeeCNName;
@property (nonatomic, copy) NSString* coffeeENName;
@property (nonatomic, copy) NSString* coffeeDetail;
@property (nonatomic, copy) NSString* coffeeID;

@end

NS_ASSUME_NONNULL_END
