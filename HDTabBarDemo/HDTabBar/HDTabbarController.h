//
//  HDTabbarController.h
//  HDTabBarDemo
//
//  Created by 张达棣 on 15/1/9.
//  Copyright (c) 2015年 adh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HDTabBarItem.h"

@interface HDTabbarController : UIViewController

/**
 *  tabbarController里的viewCOntroller数组
 */
@property (nonatomic, copy)   NSArray           *viewControllers;

/**
 *  选择显示的viewController,直接设置就会切换tabbarItem
 */
@property (nonatomic, assign) UIViewController  *selectedViewController;

/**
 *  选择显示的tabbarItem的索引,直接设置就切换
 */
@property (nonatomic, assign) NSUInteger        selectedIndex;

/**
 *  设置背景原色,默认为白色.
 */
@property (nonatomic, strong) UIColor *backgroundColor;

/**
 *  设置背景图片,默认为Nil.
 */
@property (nonatomic, strong) UIImage *backgroundImage;

/**
 *  设置选择文字的颜色,默认为绿色
 */
@property (nonatomic, strong) UIColor *selectTextColor;

@end


@interface UIViewController (HDTabbarItem)
@property (nonatomic, strong) HDTabBarItem *hdTabBarItem;

@end


