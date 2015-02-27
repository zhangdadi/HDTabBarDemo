//
//  HDTabBarItem.h
//  HDTabBarDemo
//
//  Created by 张达棣 on 15/1/9.
//  Copyright (c) 2015年 adh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HDTabBarItem : UIView
@property (nonatomic, assign) NSInteger number;
/**
 *  初始化
 *
 *  @param title             标题
 *  @param imageName         正常显示的图片名字
 *  @param selectedImageName 选中时显示的图片名字
 *
 */
+ (instancetype)itemWithTitle:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName;

@end

