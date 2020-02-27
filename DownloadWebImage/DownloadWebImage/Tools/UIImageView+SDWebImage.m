//
//  UIImageView+SDWebImage.m
//  DownloadWebImage
//
//  Created by 李凯 on 2020/2/27.
//  Copyright © 2020 kevin. All rights reserved.
//

#import "UIImageView+SDWebImage.h"

@implementation UIImageView (SDWebImage)

- (void)downloadImageWithURL:(NSString *)url placeHolder:(NSString *)placeHolder {
    
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:placeHolder] options:SDWebImageRetryFailed | SDWebImageLowPriority];
}

- (void)downloadImageWithURL:(NSString *)url placeHolder:(NSString *)placeHolder success:(DownloadImageSuccessBlock)success failed:(DownloadImageFailedBlock)failed :(DownloadImageProgressBlock)progress {
    
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:placeHolder] options:SDWebImageRetryFailed | SDWebImageLowPriority progress:^(NSInteger receivedSize, NSInteger expectedSize, NSURL * _Nullable targetURL) {
        progress(receivedSize * 1.0 / expectedSize);
    } completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        if (error) {
            failed(error);
        }else{
            self.image = image;
            success(image);
        }
    }];
}

@end
