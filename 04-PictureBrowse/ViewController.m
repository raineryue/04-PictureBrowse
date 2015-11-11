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

/** 图片内容描述*/
@property (nonatomic, weak) UILabel *descriptionLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 1.添加子控件到控制器的视图上
    [self setupSubviews];
}

- (void)setupSubviews {
    // 1.当前浏览图片的数量
    UILabel *countLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 40, self.view.bounds.size.width, 40)];
    
    countLabel.text = @"1/5";
    countLabel.textAlignment = NSTextAlignmentCenter;
    countLabel.font = [UIFont systemFontOfSize:18.0];
    
    self.countLabel = countLabel;
    [self.view addSubview:self.countLabel];
    
    // 2.当前浏览到的图片
    UIImageView *pictureImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"biaoqingdi"]];

    CGFloat pictureImageViewW = 250;
    CGFloat pictureImageViewH = 250;
    CGFloat pictureImageViewX = (self.view.bounds.size.width - pictureImageViewW) * 0.5;
    CGFloat pictureImageViewY = CGRectGetMaxY(self.countLabel.frame) + 20;
    
    pictureImageView.frame = CGRectMake(pictureImageViewX, pictureImageViewY, pictureImageViewW, pictureImageViewH);
    
    self.pictureImageView = pictureImageView;
    [self.view addSubview:self.pictureImageView];
    
    // 3.上一张图片按钮
    UIButton *prevButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    prevButton.center = CGPointMake(self.pictureImageView.frame.origin.x * 0.5, self.pictureImageView.center.y);
    
    [prevButton setBackgroundImage:[UIImage imageNamed:@"left_normal"] forState:UIControlStateNormal];
    [prevButton setBackgroundImage:[UIImage imageNamed:@"left_highlighted"] forState:UIControlStateHighlighted];
    
    self.prevButton = prevButton;
    [self.view addSubview:self.prevButton];
    
    // 4.下一张图片按钮
    UIButton *nextButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    nextButton.center = CGPointMake(self.view.bounds.size.width - self.pictureImageView.frame.origin.x * 0.5, self.pictureImageView.center.y);
    
    [nextButton setBackgroundImage:[UIImage imageNamed:@"right_normal"] forState:UIControlStateNormal];
    [nextButton setBackgroundImage:[UIImage imageNamed:@"right_highlighted"] forState:UIControlStateHighlighted];
    
    self.nextButton = nextButton;
    [self.view addSubview:self.nextButton];
    
    // 5.当前浏览图片内容的描述
    UILabel *descriptionLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.pictureImageView.frame), self.view.bounds.size.width, 180)];
    
    descriptionLabel.text = @"在他面前，神马表情都弱爆了，有木有！！！在他面前，神马表情都弱爆了，有木有！！！在他面前，神马表情都弱爆了，有木有！！！重要的事情要说三遍";
    descriptionLabel.textAlignment = NSTextAlignmentCenter;
    descriptionLabel.numberOfLines = 0;
    descriptionLabel.font = [UIFont systemFontOfSize:18.0];
    
    self.descriptionLabel = descriptionLabel;
    [self.view addSubview:self.descriptionLabel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

@end
