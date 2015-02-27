//
//  HDTabbarController.m
//  HDTabBarDemo
//
//  Created by 张达棣 on 15/1/9.
//  Copyright (c) 2015年 adh. All rights reserved.
//

#import "HDTabbarController.h"
#import "HDTabBarItem.h"
#import <objc/runtime.h>

#define KBottonHeight 49
#define KIOS7Y  ([UIDevice currentDevice].systemVersion.floatValue >= 7.0 ? 0 : -20)
#define KRGB(r, g, b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
#define KeyTagHdTabBar     "UIViewController.hdTabBar"

@interface HDTabBarItem ()
@property (nonatomic, strong) UIColor *selectTextColor;
- (void)selectItem:(BOOL)isSelect;
@end


@interface HDTabbarController ()
@property (nonatomic, strong) UIView  *bottomView;
@property (nonatomic, strong) UIView  *lineView;
@end

@implementation HDTabbarController

- (id)init
{
    self = [super init];
    if (self) {
        [self creatInterface];
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    for (int i = 0; i < _viewControllers.count; i++) {
        HDTabBarItem *tabbarItem = ((UIViewController *)_viewControllers[i]).hdTabBarItem;
        tabbarItem.selectTextColor = _selectTextColor;
    }
    self.selectedIndex = 0;
    if (_backgroundImage != nil) {
        _lineView.hidden = YES;
    }
}

- (void)creatInterface {
    _selectTextColor = [UIColor greenColor];
    _selectedIndex = 2;
    CGRect frame = [UIScreen mainScreen].bounds;
    self.bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, frame.size.height - KBottonHeight + KIOS7Y, frame.size.width, KBottonHeight)];
    _bottomView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleWidth;
    _bottomView.backgroundColor = KRGB(248, 248, 248);
    [self.view addSubview:_bottomView];
    
    self.lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, 1)];
    _lineView.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleWidth;
    _lineView.backgroundColor = KRGB(216, 216, 216);
    [_bottomView addSubview:_lineView];
}

- (void)setViewControllers:(NSArray *)viewControllers {
    if (_viewControllers != viewControllers) {
        CGFloat oneWidth = _bottomView.frame.size.width / viewControllers.count;
        for (int i = 0; i < viewControllers.count; i++) {
            UIViewController *viewController = viewControllers[i];
            
            [self addChildViewController:viewController];
            
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(i * oneWidth, _lineView.frame.size.height, oneWidth, _bottomView.frame.size.height - _lineView.frame.size.height);
            button.backgroundColor = [UIColor clearColor];
            button.tag = i + 100;
            [button addTarget:self action:@selector(bottonButtonClick:) forControlEvents:UIControlEventTouchUpInside];
            [_bottomView addSubview:button];
            
            CGRect buttonFrame = button.frame;
            buttonFrame.origin = CGPointMake(buttonFrame.origin.x, 1);
            viewController.hdTabBarItem.frame = buttonFrame;
            [_bottomView addSubview:viewController.hdTabBarItem];
        }
        
        //设置初始的tabbar界面
        _viewControllers = [viewControllers copy];
        [self.view addSubview:((UIViewController *)_viewControllers[0]).view];
        [self.view bringSubviewToFront:_bottomView];
    }
}

- (void)setSelectedIndex:(NSUInteger)selectedIndex {
    if (_selectedIndex != selectedIndex && selectedIndex < _viewControllers.count) {
        UIViewController *selectedViewController = _viewControllers[selectedIndex];
        selectedViewController.view.hidden = YES;
        [self transitionFromViewController:_viewControllers[_selectedIndex] toViewController:_viewControllers[selectedIndex] duration:0.0f options:UIViewAnimationOptionCurveLinear animations:nil completion:^(BOOL finished) {
            selectedViewController.view.hidden = NO;
            if (finished) {
                [self.view bringSubviewToFront:_bottomView];
                [self.selectedViewController.hdTabBarItem selectItem:NO];
                _selectedIndex = selectedIndex;
                _selectedViewController = selectedViewController;
                [selectedViewController.hdTabBarItem selectItem:YES];
            }
        }];
    }
}

- (void)setSelectedViewController:(UIViewController *)selectedViewController {
    if (_selectedViewController != selectedViewController) {
        for (int i = 0; i < _viewControllers.count; i++) {
            UIViewController *viewController = _viewControllers[i];
            if (viewController == selectedViewController) {
                self.selectedIndex = i;
                break;
            }
        }
    }
}

- (void)bottonButtonClick:(id)sender {
    self.selectedIndex = ((UIButton*)sender).tag - 100;
}


- (void)setBackgroundColor:(UIColor *)backgroundColor {
    _bottomView.backgroundColor = backgroundColor;
}

- (void)setBackgroundImage:(UIImage *)backgroundImage {
    _backgroundImage = backgroundImage;
    _bottomView.backgroundColor = [UIColor colorWithPatternImage:backgroundImage];
}
@end


@implementation UIViewController (HDTabbarItem)

- (HDTabBarItem *)hdTabBarItem {
    NSObject *obj = objc_getAssociatedObject(self, KeyTagHdTabBar);
    if (obj && [obj isKindOfClass:[HDTabBarItem class]]) {
        return (HDTabBarItem *)obj;
    }
    return nil;
}

- (void)setHdTabBarItem:(HDTabBarItem *)hdTabBarItem {
    objc_setAssociatedObject(self, KeyTagHdTabBar, hdTabBarItem, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
