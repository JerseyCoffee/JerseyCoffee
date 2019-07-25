//
//  UIFont+JSDStyle.m
//  JerseyCoffee
//
//  Created by Jersey on 2019/7/25.
//  Copyright © 2019 jerseyCafe. All rights reserved.
//

#import "UIFont+JSDStyle.h"

static NSString* const kJSDFontName = @"Helvetica Neue";

@implementation UIFont (JSDStyle)

+ (UIFont *)jsd_fontSize:(CGFloat)size {
    
    UIFont* font = [UIFont fontWithName:kJSDFontName size:size];
    
    return font;
}

@end
