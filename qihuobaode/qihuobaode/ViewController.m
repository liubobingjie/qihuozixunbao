//
//  ViewController.m
//  qihuobaode
//
//  Created by mc on 2017/12/4.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+image.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageview;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *image = [UIImage imageWithClipImage:[UIImage imageNamed:@"阿狸头像"] borderWidth:1 borderColor:[UIColor redColor]];
    
    self.imageview.image = image;
    
    UIImage *image1 = [UIImage imageWithCaputureView:self.view];
    
    NSData *data = UIImageJPEGRepresentation(image1, 1);
    
    [data writeToFile:@"/Users/mc/Desktop/view.png" atomically:YES];
}

//裁剪成圆形图片

-(void)clipImage{
    
    //加载本地图片
    UIImage *image = [UIImage imageNamed:@"阿狸头像"];
    
    //开启图片上下文
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    //设置圆形裁剪
    //1.设置圆形路径
    UIBezierPath * path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    //2.把路径设置成裁剪区
    [path addClip];
    //绘制图片
    [image drawAtPoint:CGPointZero];
    
    //从上下文获取图片
    UIImage *clipimage = UIGraphicsGetImageFromCurrentImageContext();
    
    //关闭上下文
    UIGraphicsEndImageContext();
    self.imageview.image = clipimage;

    
    
}

//图片加水印

-(void)warterimage
{
    UIImage *image = [UIImage imageNamed:@"小黄人"];
    //开启图片上下文
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    
    [image drawAtPoint:CGPointZero];
    NSString *str = @"波波";
    NSMutableDictionary *dic =[NSMutableDictionary dictionary];
    dic[NSFontAttributeName] = [UIFont systemFontOfSize:20];
    dic[NSForegroundColorAttributeName]= [UIColor redColor];
    [str drawAtPoint:CGPointMake(200, 500) withAttributes:dic];
    
    UIImage *imagewater = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    self.imageview.image = imagewater;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
