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

@property (nonatomic, copy) NSString* kitImageName;
@property (nonatomic, copy) NSString* kitCNName;
@property (nonatomic, copy) NSString* kitENName;
@property (nonatomic, copy) NSString* kitDetail;
@property (nonatomic, copy) NSString* step;
@property (nonatomic, copy) NSString* kitID;

@end

NS_ASSUME_NONNULL_END
