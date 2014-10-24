//
//  ZTabbarController.m
//  ZTabbarDemo
//
//  Created by 张达棣 on 14-5-21.
//  Copyright (c) 2014年 张达棣. All rights reserved.
//


#define KBottonHeight 49
#define KIOS7Y  ([UIDevice currentDevice].systemVersion.floatValue >= 7.0 ? 0 : -20)
#define KRGB(r, g, b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]

#import "ZTabbarController.h"
#import "ZUIViewController.h"

@interface ZTabbarController ()

@property (nonatomic, strong) UIView  *bottomView;
@property (nonatomic, strong) UIView  *lineView;
@property (nonatomic, strong) UIImage *backgroundImage;

@end

@implementation ZTabbarController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self creatInterface];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    for (int i = 0; i < _viewControllers.count; i++) {
        ZUIViewController *viewController = _viewControllers[i];
        CGRect buttonFrame = [_bottomView viewWithTag:i + 100].frame;
        buttonFrame.origin = CGPointMake(i * buttonFrame.size.width, 1);
        if (viewController.zTabBarItem.frame.size.width < buttonFrame.size.width) {
            viewController.zTabBarItem.frame = buttonFrame;
        }
        [_bottomView addSubview:viewController.zTabBarItem];
     }
    self.selectedIndex = 0;
    if (_backgroundImage != nil) {
        _lineView.hidden = YES;
    }
}

- (void)creatInterface {
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
            ZUIViewController *viewController = viewControllers[i];
            if (![viewController respondsToSelector:@selector(setZTabBarController:)]) {
                NSLog(@"错误：%@不是ZUIViewController的子类!", NSStringFromClass([viewController class]));
                return;
            }
            [self addChildViewController:viewController];
            viewController.zTabBarController = self;
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(i * oneWidth, _lineView.frame.size.height, oneWidth, _bottomView.frame.size.height - _lineView.frame.size.height);
            button.backgroundColor = [UIColor clearColor];
            button.tag = i + 100;
            [button addTarget:self action:@selector(bottonButtonClick:) forControlEvents:UIControlEventTouchUpInside];
            [_bottomView addSubview:button];
            
        }
        
        //设置初始的tabbar界面
        _viewControllers = [viewControllers copy];
        [self.view addSubview:((UIViewController *)_viewControllers[0]).view];
        [self.view bringSubviewToFront:_bottomView];
    }
}

- (void)setSelectedIndex:(NSUInteger)selectedIndex {
    if (_selectedIndex != selectedIndex && selectedIndex < _viewControllers.count) {
        ((UIViewController *)_viewControllers[selectedIndex]).view.hidden = YES;
        [self transitionFromViewController:_viewControllers[_selectedIndex] toViewController:_viewControllers[selectedIndex] duration:0.0f options:UIViewAnimationOptionCurveLinear animations:nil completion:^(BOOL finished) {
            ((UIViewController *)_viewControllers[selectedIndex]).view.hidden = NO;
            if (finished) {
                [self.view bringSubviewToFront:_bottomView];
                [((ZUIViewController *)_viewControllers[_selectedIndex]).zTabBarItem selectItem:NO];
                _selectedIndex = selectedIndex;
                _selectedViewController = _viewControllers[selectedIndex];
                [((ZUIViewController *)_viewControllers[selectedIndex]).zTabBarItem selectItem:YES];
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



