//
//  UIImageViewVC.m
//  iOSAPI
//
//  Created by user on 10/22/21.
//

#import "UIImageViewVC.h"
#import "UIImage+GIF.h"

@interface UIImageViewVC ()

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation UIImageViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self customNavBar];
    
    _imageView = [self setupImageView_];
    [self addTap];
}

- (void)customNavBar {
    self.navigationItem.title = @"UIImageView";
}

//MARK: - create
- (UIImageView *)setupImageView_ {
    CGFloat wh = 70;
    CGRect frame = CGRectMake(0, 0, wh, wh);
    UIImageView *iv = [[UIImageView alloc] initWithFrame:frame];
    iv.image = [UIImage imageNamed:@"UIImageView_normal_image"];
//    iv.highlightedImage = [UIImage imageNamed:@"smart_icon_cicle_select_red"];
    iv.center = self.view.center;
    [self.view addSubview:iv];
    
    return iv;
}

//MARK: - 动图

//MARK: 播放动图
/**
 UIImageView播放动图，需要先加载动图文件生成动图对象，再设置给视图的image属性即可。
 */

/// 播放动图
- (void)playGif {
    _imageView.image = [self getGifImage];
//    _imageView
}

//MARK: 生成动图对象
/**
 生成动图对象的几种方案：
 1.使用<SDWebImage>的API: sd_imageWithGIFData（推荐使用，代码少）
 2.使用 UIImage API : animatedImageNamed:duration: （不推荐，需要使用图片数组，不能直接传入gif图片名）
 */

/// 生成动图对象，使用<SDWebImage>的API
- (UIImage *)getGifImage {
    NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"UIImageView_dynamic_image" ofType:@"gif"];
    NSData *imageData = [NSData dataWithContentsOfFile:imagePath];
    return [UIImage sd_imageWithGIFData:imageData];
}

//MARK: 切换显示静态图和动图
/**
 UIImageView切换静态图和动图，有两种方案：
 方案1：每次切换都重新设置image（推荐）
 方案2：将静态图和动图分别设置给 image和 highlightedImage，然后切换 highlighted 状态。（不推荐。实际使用中，首次切换不生效且有延迟。）
 */

/// 切换静态图和动图（方案1，同时使用isHighlighted保存切换状态）
- (void)setAnimateImage:(BOOL)animate {
    if (animate) {
        [self playGif];
    }else {
        [self showImage];
    }
}

- (void)showImage {
    _imageView.image = [UIImage imageNamed:@"UIImageView_normal_image"];
}

- (void)addTap {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapImageView:)];
    [_imageView addGestureRecognizer:tap];
    _imageView.userInteractionEnabled = YES;
}
- (void)tapImageView:(UITapGestureRecognizer *)tap {
    _imageView.highlighted = !(_imageView.isHighlighted);
    [self setAnimateImage:_imageView.isHighlighted];
}

@end
