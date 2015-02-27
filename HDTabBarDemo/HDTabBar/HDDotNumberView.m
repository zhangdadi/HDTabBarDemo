//
//  HDDotNumberView.m
//  HDTabBarDemo
//
//  Created by 张达棣 on 15/2/26.
//  Copyright (c) 2015年 adh. All rights reserved.
//

#import "HDDotNumberView.h"

@interface HDDotNumberView ()
@property (nonatomic, strong) UILabel *laebl;
@end

@implementation HDDotNumberView


- (instancetype)init {
    self = [super init];
    if (self) {
        [self creatView];
    }
    return self;
}

- (void)creatView {
    self.backgroundColor = [UIColor redColor];
    _laebl = [[UILabel alloc] init];
    _laebl.backgroundColor = [UIColor clearColor];
    _laebl.textColor = [UIColor whiteColor];
    [self addSubview:_laebl];
}

- (void)setNumber:(NSInteger)number {
    self.frame = CGRectMake(0, 0, 15, 15);
    _laebl.text = [NSString stringWithFormat:@"%d", number];
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = self.frame.size.width / 2;
}

@end
