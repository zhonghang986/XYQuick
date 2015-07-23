//
//  UIImage+XY.h
//  JoinShow
//
//  Created by Heaven on 13-9-30.
//  Copyright (c) 2013年 Heaven. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMedia/CoreMedia.h>

#define XY_USE_SYSTEM_IMAGE_CACHE NO
/**************************************************************/
// UIImage
    
@interface UIImage (XY)

// 加载图片
// used: imageWithContentsOfFile 自动带有2x 3x等后缀. 如果没有, 还是用默认的
+ (UIImage *)uxy_imageWithFileName:(NSString *)name;

// todo
// 加载图片,自己控制释放用缓存
//+ (UIImage *)imageNamed:(NSString *)name useCache:(BOOL)useCache;

// 圆形
- (UIImage *)uxy_rounded;
// 变成 尺寸circleRect的圆形
- (UIImage *)uxy_rounded:(CGRect)circleRect;

// 拉伸
- (UIImage *)uxy_stretched;
- (UIImage *)uxy_stretched:(UIEdgeInsets)capInsets;

// 灰度
- (UIImage *)uxy_grayscale;

// 旋转
- (UIImage *)uxy_rotate:(CGFloat)angle;
- (UIImage *)uxy_rotateCW90;
- (UIImage *)uxy_rotateCW180;
- (UIImage *)uxy_rotateCW270;

//等比例缩放
- (UIImage*)uxy_scaleToSize:(CGSize)size;

// 创建并返回使用指定的图像中的颜色对象。
- (UIColor *)uxy_patternColor;

// 截取部分图像
- (UIImage *)uxy_crop:(CGRect)rect;
- (UIImage *)uxy_imageInRect:(CGRect)rect;

// 从视频截取图片
+ (UIImage *)uxy_imageFromVideo:(NSURL *)videoURL atTime:(CMTime)time scale:(CGFloat)scale;

// 叠加合并
+ (UIImage *)uxy_merge:(NSArray *)images;
- (UIImage *)uxy_merge:(UIImage *)image;


// 圆角
typedef enum {
    UXYImageRoundedCornerCornerTopLeft = 1,
    UXYImageRoundedCornerCornerTopRight = 1 << 1,
    UXYImageRoundedCornerCornerBottomRight = 1 << 2,
    UXYImageRoundedCornerCornerBottomLeft = 1 << 3
} UXYImageRoundedCornerCorner;

- (UIImage *)uxy_roundedRectWith:(float)radius;
- (UIImage *)uxy_roundedRectWith:(float)radius cornerMask:(UXYImageRoundedCornerCorner)cornerMask;

- (BOOL)uxy_saveAsPngWithPath:(NSString *)path;
// compression is 0(most)..1(least)
- (BOOL)uxy_saveAsJpgWithPath:(NSString *)path compressionQuality:(CGFloat)quality;
- (void)uxy_saveAsPhotoWithPath:(NSString *)path;

// 高斯模糊
- (UIImage*)uxy_stackBlur:(NSUInteger)radius;

// 修复方向
- (UIImage *)uxy_fixOrientation;

// 改变图片颜色, Gradient带灰度
- (UIImage *)uxy_imageWithTintColor:(UIColor *)tintColor;
- (UIImage *)uxy_imageWithGradientTintColor:(UIColor *)tintColor;

@end