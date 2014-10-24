//
//  ZTabBarItem.m
//  ZTabbarDemo
//
//  Created by 张达棣 on 14-5-21.
//  Copyright (c) 2014年 张达棣. All rights reserved.
//

#import "ZTabBarItem.h"

@interface ZTabBarItem ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIButton *imageButton;
@end

@implementation ZTabBarItem

- (instancetype)initWithTitle:(NSString *)title image:(UIImage *)image selectedImage:(UIImage *)selectedImage {
    self = [super init];
    if (self) {
        NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"ZTabBarItem" owner:self options:nil];
        for (id item in array) {
            if ([item isKindOfClass:[self class]]) {
                self = item;
                self.userInteractionEnabled = NO;
                _titleLabel.text = title;
                [_imageButton setImage:image forState:UIControlStateNormal];
                [_imageButton setImage:selectedImage forState:UIControlStateSelected];
                if (image != nil) {
                    self.frame = _imageButton.frame = CGRectMake(0, 0, image.size.width, image.size.height);
                }
            }
        }
    }
    return self;
}

- (void)layoutSubviews {
    
}



- (void)selectItem:(BOOL)isSelect {
    _imageButton.selected = isSelect;
}

@end
