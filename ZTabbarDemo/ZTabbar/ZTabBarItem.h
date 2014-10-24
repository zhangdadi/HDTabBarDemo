//
//  ZTabBarItem.h
//  ZTabbarDemo
//
//  Created by 张达棣 on 14-5-21.
//  Copyright (c) 2014年 张达棣. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZTabBarItem : UIView

- (instancetype)initWithTitle:(NSString *)title image:(UIImage *)image selectedImage:(UIImage *)selectedImage;

- (void)selectItem:(BOOL)isSelect;

@end
