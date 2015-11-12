//
//  ViewController.m
//  04-PictureBrowse
//
//  Created by Rainer on 15/11/11.
//  Copyright © 2015年 Rainer. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

/** 当前浏览图片的数量 */
@property (nonatomic, weak) UILabel *countLabel;

/** 当前图片 */
@property (nonatomic, weak) UIImageView *pictureImageView;

/** 上一张图片按钮 */
@property (nonatomic, weak) UIButton *prevButton;

/** 下一张图片按钮 */
@property (nonatomic, weak) UIButton *nextButton;

/** 图片内容描述 */
@property (nonatomic, weak) UILabel *descriptionLabel;

/** 图片数据 */
@property (nonatomic, strong) NSArray *imageArray;

/** 当前图片的索引 */
@property (nonatomic, assign) int currenIndex;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 1.添加子控件到控制器的视图上
    [self setupSubviews];
    
    // 2.初始化当前图片的索引
    self.currenIndex = -1;
    
    // 3.模拟第一次点击
    [self nextButtonClickAction];
}

/**
 *  添加子控件到控制器的视图上
 */
- (void)setupSubviews {
    // 1.上一张图片按钮
    UIButton *prevButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    prevButton.center = CGPointMake(self.pictureImageView.frame.origin.x * 0.5, self.pictureImageView.center.y);
    
    [prevButton setBackgroundImage:[UIImage imageNamed:@"left_normal"] forState:UIControlStateNormal];
    [prevButton setBackgroundImage:[UIImage imageNamed:@"left_highlighted"] forState:UIControlStateHighlighted];
    [prevButton addTarget:self action:@selector(prevButtonClickAction) forControlEvents:UIControlEventTouchUpInside];
    
    self.prevButton = prevButton;
    [self.view addSubview:self.prevButton];
    
    // 2.下一张图片按钮
    UIButton *nextButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    nextButton.center = CGPointMake(self.view.bounds.size.width - self.pictureImageView.frame.origin.x * 0.5, self.pictureImageView.center.y);
    
    [nextButton setBackgroundImage:[UIImage imageNamed:@"right_normal"] forState:UIControlStateNormal];
    [nextButton setBackgroundImage:[UIImage imageNamed:@"right_highlighted"] forState:UIControlStateHighlighted];
    [nextButton addTarget:self action:@selector(nextButtonClickAction) forControlEvents:UIControlEventTouchUpInside];
    
    self.nextButton = nextButton;
    [self.view addSubview:self.nextButton];
}

#pragma mark - 按钮点击事件处理
/**
 *  上一张按钮点击事件
 */
- (void)prevButtonClickAction{
    self.currenIndex --;
    
    [self changeDataForView];
}

/**
 *  下一张按钮点击事件
 */
- (void)nextButtonClickAction{
    self.currenIndex ++;
    
    [self changeDataForView];
}

#pragma mark - 私有辅助方法
/**
 *  切换视图数据内容
 */
- (void)changeDataForView {
    self.prevButton.enabled = self.currenIndex > 0;
    self.nextButton.enabled = self.currenIndex < self.imageArray.count - 1;
    
    NSDictionary *dictionary = [self.imageArray objectAtIndex:self.currenIndex];
    
    self.countLabel.text = [NSString stringWithFormat:@"%d/%d", self.currenIndex + 1, (int)self.imageArray.count];
    self.pictureImageView.image = [UIImage imageNamed:dictionary[@"name"]];
    self.descriptionLabel.text = dictionary[@"desc"];
}

#pragma mark - 属性懒加载
/**
 *  当前浏览图片的数量
 */
- (UILabel *)countLabel {
    if (nil == _countLabel) {
        UILabel *countLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 40, self.view.bounds.size.width, 40)];
        countLabel.textAlignment = NSTextAlignmentCenter;
        countLabel.font = [UIFont systemFontOfSize:18.0];
        
        _countLabel = countLabel;
        [self.view addSubview:_countLabel];
    }
    
    return _countLabel;
}

/**
 *  当前图片
 */
- (UIImageView *)pictureImageView {
    if (nil == _pictureImageView) {
        CGFloat pictureImageViewW = 200;
        CGFloat pictureImageViewH = 200;
        CGFloat pictureImageViewX = (self.view.bounds.size.width - pictureImageViewW) * 0.5;
        CGFloat pictureImageViewY = CGRectGetMaxY(self.countLabel.frame) + 20;
        
        UIImageView *pictureImageView = [[UIImageView alloc] initWithFrame:CGRectMake(pictureImageViewX, pictureImageViewY, pictureImageViewW, pictureImageViewH)];
        
        _pictureImageView = pictureImageView;
        [self.view addSubview:_pictureImageView];
    }
    
    return _pictureImageView;
}

/** 
 *  图片内容描述 
 */
- (UILabel *)descriptionLabel {
    if (nil == _descriptionLabel) {
        UILabel *descriptionLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.pictureImageView.frame), self.view.bounds.size.width, 180)];
        
        descriptionLabel.textAlignment = NSTextAlignmentCenter;
        descriptionLabel.numberOfLines = 0;
        descriptionLabel.font = [UIFont systemFontOfSize:18.0];
        
        _descriptionLabel = descriptionLabel;
        [self.view addSubview:_descriptionLabel];
    }
    
    return _descriptionLabel;
}

/**
 *  懒加载
 */
- (NSArray *)imageArray {
    if (nil == _imageArray) {
        NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"ImageData" ofType:@"plist"];
        
        _imageArray = [NSArray arrayWithContentsOfFile:imagePath];
    }
    
    return _imageArray;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

@end
