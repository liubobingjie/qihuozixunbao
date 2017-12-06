//
//  UIImage+image.h
//  qihuobaode
//
//  Created by mc on 2017/12/6.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (image)

+(UIImage*)imageWithClipImage:(UIImage*)image borderWidth:(CGFloat)borderWidth borderColor:(UIColor*)borderColor;
+(UIImage*)imageWithCaputureView:(UIView*)view;
@end
