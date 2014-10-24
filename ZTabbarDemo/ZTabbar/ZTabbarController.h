//
//  ZTabbarController.h
//  ZTabbarDemo
//
//  Created by 张达棣 on 14-5-21.
//  Copyright (c) 2014年 张达棣. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZTabbarController : UIViewController

@property (nonatomic, copy)   NSArray           *viewControllers;
@property (nonatomic, assign) UIViewController  *selectedViewController;
@property (nonatomic, assign) NSUInteger        selectedIndex;

- (void)setBackgroundColor:(UIColor *)backgroundColor;
- (void)setBackgroundImage:(UIImage *)backgroundImage;

@end

