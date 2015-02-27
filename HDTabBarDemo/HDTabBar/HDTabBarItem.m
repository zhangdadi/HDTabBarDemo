//
//  HDTabBarItem.m
//  HDTabBarDemo
//
//  Created by 张达棣 on 15/1/9.
//  Copyright (c) 2015年 adh. All rights reserved.
//

#import "HDTabBarItem.h"
#import "HDDotNumberView.h"

@interface HDTabBarItem ()
@property (nonatomic, strong) UIColor *selectTextColor;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIButton *imageButton;
@property (nonatomic, strong) HDDotNumberView *numberView;
@property (nonatomic, assign) CGSize imageSize;
@end

@implementation HDTabBarItem

- (instancetype)initWithTitle:(NSString *)title image:(UIImage *)image selectedImage:(UIImage *)selectedImage {
    self = [super init];
    if (self) {
        NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"HDTabBarItem" owner:self options:nil];
        _imageSize = image.size;
        for (id item in array) {
            if ([item isKindOfClass:[self class]]) {
                self = item;
                self.userInteractionEnabled = NO;
                _titleLabel.text = title;
                [_imageButton setImage:image forState:UIControlStateNormal];
                [_imageButton setImage:selectedImage forState:UIControlStateSelected];
                _numberView = [[HDDotNumberView alloc] init];
            }
        }
    }
    return self;
}

+ (instancetype)itemWithTitle:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName {
    return [[self alloc] initWithTitle:title image:[UIImage imageNamed:imageName] selectedImage:[UIImage imageNamed:selectedImageName]];
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    _imageButton.center = CGPointMake(self.bounds.size.width / 2, _imageButton.center.y);
    _titleLabel.center = CGPointMake(self.bounds.size.width / 2, _titleLabel.center.y);
}

- (void)selectItem:(BOOL)isSelect {
    UIColor *color = isSelect ? _selectTextColor : [UIColor blackColor];
    _titleLabel.textColor = color;
    _imageButton.selected = isSelect;
}

- (void)setNumber:(NSInteger)number {
    _numberView.number = number;
    _numberView.frame = CGRectMake(_imageButton.center.x + _imageSize.width / 2, 0, _numberView.frame.size.width, _numberView.frame.size.height);
    [self addSubview:_numberView];
}

@end
