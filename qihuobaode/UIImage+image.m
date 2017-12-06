//
//  UIImage+image.m
//  qihuobaode
//
//  Created by mc on 2017/12/6.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "UIImage+image.h"

@implementation UIImage (image)


+(UIImage*)imageWithClipImage:(UIImage *)image borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor{
    //图片的宽度和高度
    CGFloat imageWH = image.size.width;
    //设置圆环的宽度
    CGFloat border = borderWidth;
    
    //圆形的高度和宽度
    CGFloat ovalWH =imageWH + 2*border;
    
    //开启上架文
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(ovalWH, ovalWH), NO, 0);
    
    //画大圆
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, ovalWH, ovalWH)];
    [borderColor set];
    [path fill];
    
    //设置裁剪区域
    UIBezierPath *clipPath =[UIBezierPath bezierPathWithOvalInRect:CGRectMake(border, border, imageWH, imageWH)];
    [clipPath addClip];
    
    //绘制图片
    [image drawAtPoint:CGPointZero];
    
    //获取图片
    UIImage *image1 = UIGraphicsGetImageFromCurrentImageContext();
    
    //关闭上下文
    UIGraphicsEndImageContext();
    
    return image1;
    
    
}


+(UIImage *)imageWithCaputureView:(UIView *)view{
    
    //开启图片上下文
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, NO, 0);
    
    //获取上下文
    CGContextRef ref = UIGraphicsGetCurrentContext();
    
    //把控件上的图层渲染的上下文，layer渲染
    [view.layer renderInContext:ref];
    
    //生成一张新的图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    //关闭上下文
    UIGraphicsEndImageContext();
    
    return image;
    
        
}
@end
