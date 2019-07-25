//
//  JSDKitTypeViewCell.h
//  JerseyCoffee
//
//  Created by Jersey on 2019/7/25.
//  Copyright © 2019 jerseyCafe. All rights reserved.
//

#import "MDCCollectionViewCell.h"

#import "JSDKitTypeViewModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JSDKitTypeViewCell : UICollectionViewCell

@property (nonatomic, strong) JSDKitTypeModel* model;

@end

NS_ASSUME_NONNULL_END
