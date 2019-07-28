//
//  YZHPhotoManage.h
//  YZHYolo
//
//  Created by Jersey on 2018/9/25.
//  Copyright © 2018年 YZHChain. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

extern NSString* const kJSDPhotoImageFiles;
typedef NS_ENUM(NSInteger, YZHImagePickerSourceType) {
    YZHImagePickerSourceTypePhotoLibrary = 0,
    YZHImagePickerSourceTypeCamera,
    YZHImagePickerSourceTypePhotosAlbum,
};
@interface JSDPhotoManage : NSObject

+ (void)presentWithViewController:(UIViewController *)viewController
                       sourceType:(YZHImagePickerSourceType)sourceType
                    finishPicking:(void (^)(UIImage *image))finishPicking;
+ (void)savaImageView:(UIImageView *)imageView;

@end

NS_ASSUME_NONNULL_END
