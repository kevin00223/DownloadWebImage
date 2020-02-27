//
//  UIImageView+SDWebImage.h
//  DownloadWebImage
//
//  Created by 李凯 on 2020/2/27.
//  Copyright © 2020 kevin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImageView+WebCache.h"

typedef void(^DownloadImageSuccessBlock)(UIImage *image);
typedef void(^DownloadImageFailedBlock)(NSError *error);
typedef void(^DownloadImageProgressBlock)(CGFloat progress);

NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (SDWebImage)

- (void)downloadImageWithURL: (NSString *)url placeHolder: (NSString *)placeHolder;

- (void)downloadImageWithURL:(NSString *)url placeHolder:(NSString *)placeHolder success: (DownloadImageSuccessBlock)success failed: (DownloadImageFailedBlock) failed: (DownloadImageProgressBlock)progress;

@end

NS_ASSUME_NONNULL_END
