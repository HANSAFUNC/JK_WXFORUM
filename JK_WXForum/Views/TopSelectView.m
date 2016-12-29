//
//  TopSelectView.m
//  JK_WXForum
//
//  Created by jackey_gjt on 16/12/27.
//  Copyright © 2016年 Jackey. All rights reserved.
//

#import "TopSelectView.h"
#import "CustomNetButton.h"

@interface TopSelectView ()
@property (weak, nonatomic) IBOutlet UIView *topHalfView;

@property (weak, nonatomic) IBOutlet UIView *bottomHalfView;

@end
@implementation TopSelectView

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setupTopHalfViewSubView];
    [self setupBottomHalfViewSubview];
}

- (UIImage*) imageToTransparent:(UIImage*) image

{
    // 分配内存
    
    
    const int imageWidth = image.size.width;
    
    const int imageHeight = image.size.height;
    
    size_t      bytesPerRow = imageWidth * 4;
    
    uint32_t* rgbImageBuf = (uint32_t*)malloc(bytesPerRow * imageHeight);
    
    // 创建context
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    
    CGContextRef context = CGBitmapContextCreate(rgbImageBuf, imageWidth, imageHeight, 8, bytesPerRow, colorSpace,
                                                 
                                                 kCGBitmapByteOrder32Little | kCGImageAlphaNoneSkipLast);
    
    CGContextDrawImage(context, CGRectMake(0, 0, imageWidth, imageHeight), image.CGImage);
    
    
    // 遍历像素
    
    int pixelNum = imageWidth * imageHeight;
    
    uint32_t* pCurPtr = rgbImageBuf;
    printf("%p",pCurPtr);
    
    for (int i = 0; i < pixelNum; i++, pCurPtr++)
        
    {
        
        //把绿色变成黑色，把背景色变成透明
//        printf("%s",*pCurPtr & 0x65815A00);
        if ((*pCurPtr & 0x65815A00) == 0x65815a00)    // 将背景变成透明
            
        {
            uint8_t* ptr = (uint8_t*)pCurPtr;
            
            ptr[0] = 1;
            
        }
        
        
         if ((*pCurPtr & 0xFFFFFF00) == 0xffffff00)    // 将白色变成透明
            
        {
            uint8_t* ptr = (uint8_t*)pCurPtr;
            
            ptr[0] = 1;
            
            
            
        }
        
        else
            
        {
            // 改成下面的代码，会将图片转成想要的颜色
            
            uint8_t* ptr = (uint8_t*)pCurPtr;
            
            ptr[3] = 255; //0~255
            
            ptr[2] = 255;
            
            ptr[1] = 255;
            
        }
//        if ((*pCurPtr & 0x00FF0000) == 0x00ff0000)    // 将绿色变成黑色
//            
//        {
//            
//            uint8_t* ptr = (uint8_t*)pCurPtr;
//            
//            ptr[3] = 0; //0~255
//            
//            ptr[2] = 0;
//            
//            ptr[1] = 0;
//            
//        }
        
        
        
    }
    
    
    // 将内存转成image
    
    CGDataProviderRef dataProvider = CGDataProviderCreateWithData(NULL, rgbImageBuf, bytesPerRow * imageHeight, ProviderReleaseData);
    
    //    CGDataProviderCreateWithCFData(<#CFDataRef  _Nullable data#>)
    
    CGImageRef imageRef = CGImageCreate(imageWidth, imageHeight,8, 32, bytesPerRow, colorSpace,
                                        
                                        kCGImageAlphaLast |kCGBitmapByteOrder32Little, dataProvider,
                                        
                                        NULL, true,kCGRenderingIntentDefault);
    
    CGDataProviderRelease(dataProvider);
    
    
    UIImage* resultUIImage = [UIImage imageWithCGImage:imageRef];
    
    // 释放
    
    CGImageRelease(imageRef);
    
    CGContextRelease(context);
    
    CGColorSpaceRelease(colorSpace);
    
    // free(rgbImageBuf) 创建dataProvider时已提供释放函数，这里不用free
    
    
    
    return resultUIImage;
    
}


/** 颜色变化 */

void ProviderReleaseData (void *info, const void *data, size_t size)

{
    
    free((void*)data);
    
}
- (void)setupTopHalfViewSubView {
    _topHalfView.backgroundColor = JKColor_RGB(41, 187, 156);
    _topHalfView.tag = 1111;

    for (int i = 0; i < 4; i++) {
        CustomNetButton * btn = [CustomNetButton buttonWithType:UIButtonTypeCustom];
        switch (i) {
            case 0:
                [btn setTitle:@"报名" forState:0];
                [btn setImage:[UIImage imageNamed:@"网校-1"] forState:0];
                break;
            case 1:
                [btn setTitle:@"课表" forState:0];
                [btn setImage:[UIImage imageNamed:@"网校-2"] forState:0];
                break;
            case 2:
                [btn setTitle:@"考勤" forState:0];
                [btn setImage:[UIImage imageNamed:@"网校-3"] forState:0];
                break;
            case 3:
                [btn setTitle:@"评分" forState:0];
                [btn setImage:[UIImage imageNamed:@"网校-4"] forState:0];
                break;
                
        }
        btn.titleLabel.font = [UIFont systemFontOfSize:12.0];
        [btn setTitleColor:[UIColor blackColor] forState:0];
        btn.titleLabel.textAlignment = NSTextAlignmentCenter;
        CGFloat y = 0;
        CGFloat w = WIDTH(self.bottomHalfView) / 4;
        CGFloat h = HEIGHT(self.bottomHalfView);
        CGFloat x = i * w;
        btn.frame = CGRectMake(x, y, w, h);
        [self.topHalfView addSubview:btn];
    }
}

- (void)setupBottomHalfViewSubview {
    for (int i = 0; i < 4; i++) {
        CustomNetButton * btn = [CustomNetButton buttonWithType:UIButtonTypeCustom];
        switch (i) {
            case 0:
                [btn setTitle:@"我的网校" forState:0];
                [btn setImage:[UIImage imageNamed:@"网校-6"] forState:0];
                break;
            case 1:
                [btn setTitle:@"无邪网校" forState:0];
                [btn setImage:[UIImage imageNamed:@"网校-5"] forState:0];
                break;
            case 2:
                [btn setTitle:@"英语田" forState:0];
                [btn setImage:[UIImage imageNamed:@"网校-7"] forState:0];
                break;
            case 3:
                [btn setTitle:@"学堂视频" forState:0];
                [btn setImage:[UIImage imageNamed:@"onlinevideo"] forState:0];
                break;
                
        }
        btn.titleLabel.font = [UIFont systemFontOfSize:12.0];
        [btn setTitleColor:[UIColor blackColor] forState:0];
        btn.titleLabel.textAlignment = NSTextAlignmentCenter;
        CGFloat y = 0;
        CGFloat w = WIDTH(self.bottomHalfView) / 4;
        CGFloat h = HEIGHT(self.bottomHalfView);
        CGFloat x = i * w;
        btn.frame = CGRectMake(x, y, w, h);
        [self.bottomHalfView addSubview:btn];
    }
}

+ (instancetype)loadXib{
    return [[NSBundle mainBundle]loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil].firstObject;
}

@end
