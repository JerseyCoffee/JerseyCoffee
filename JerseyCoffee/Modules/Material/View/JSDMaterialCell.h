//
//  JSDMaterialCell.h
//  JerseyCoffee
//
//  Created by Jersey on 2019/7/24.
//  Copyright © 2019 jerseyCafe. All rights reserved.
//

#import "MDCCollectionViewCell.h"

#import "JSDMaterialViewModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JSDMaterialCell : UICollectionViewCell

@property (nonatomic, strong) JSDMaterialModel* model;

@end

NS_ASSUME_NONNULL_END
