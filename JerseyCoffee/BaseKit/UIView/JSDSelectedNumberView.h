//
//  JSDSelectedNumberView.h
//  JerseyCoffee
//
//  Created by ada on 2019/7/27.
//  Copyright © 2019 jerseyCafe. All rights reserved.
//

#import "JSDBaseView.h"

#import "JSDPublic.h"
NS_ASSUME_NONNULL_BEGIN

@interface JSDSelectedNumberView : JSDBaseView

@property (assign, nonatomic) NSInteger currentNumber;
- (void)updateNumber:(NSInteger )number;

@end

NS_ASSUME_NONNULL_END
