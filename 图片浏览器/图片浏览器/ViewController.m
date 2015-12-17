//
//  ViewController.m
//  图片浏览器
//
//  Created by 章芝源 on 15/12/17.
//  Copyright © 2015年 ZZY. All rights reserved.
//

#import "ViewController.h"
#define ZYPICTURE @"ZYPICTURE"
#define ZYSTRING @"ZYSTRING"
@interface ViewController ()
@property(nonatomic, strong)NSArray *arrayPictue;
@property (weak, nonatomic) IBOutlet UIButton *rightBtn;
@property (weak, nonatomic) IBOutlet UIButton *leftBtn;
@property (weak, nonatomic) IBOutlet UILabel *topLable;
@property (weak, nonatomic) IBOutlet UIImageView *pictureImgView;
@property (weak, nonatomic) IBOutlet UILabel *bottomLabel;

//当前显示图片的页数
@property(assign, nonatomic)NSInteger index;
@end

@implementation ViewController


//#pragma mark - 懒加载
//- (NSArray *)arrayPictue
//{
//    if (_arrayPictue == nil) {
//        _arrayPictue = [NSArray array];
//    }
//    return _arrayPictue;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    //把图片/LB都放入数组
    [self setupArrayPicture];
    //显示左右按钮箭头
    [self setupArrow];
    //显示初始状态
    [self reloadSubviews];
}

- (void)setupArrayPicture
{
    NSMutableDictionary *dict01 = [NSMutableDictionary dictionary];
    UIImage *image01 = [UIImage imageNamed:@"biaoqingdi"];
    NSString *lb01 = @"1";
    dict01[ZYPICTURE] = image01;
    dict01[ZYSTRING] = lb01;
    
    NSMutableDictionary *dict02 = [NSMutableDictionary dictionary];
    UIImage *image02 = [UIImage imageNamed:@"bingli"];
    NSString *lb02 = @"2";
    dict02[ZYPICTURE] = image02;
    dict02[ZYSTRING] = lb02;
    
    NSMutableDictionary *dict03 = [NSMutableDictionary dictionary];
    UIImage *image03 = [UIImage imageNamed:@"chiniupa"];
    NSString *lb03 = @"3";
    dict03[ZYPICTURE] = image03;
    dict03[ZYSTRING] = lb03;
    
    NSMutableDictionary *dict04 = [NSMutableDictionary dictionary];
    UIImage *image04 = [UIImage imageNamed:@"danteng"];
    NSString *lb04 = @"4";
    dict04[ZYPICTURE] = image04;
    dict04[ZYSTRING] = lb04;
    
    NSMutableDictionary *dict05 = [NSMutableDictionary dictionary];
    UIImage *image05 = [UIImage imageNamed:@"wangba"];
    NSString *lb05 = @"5";
    dict05[ZYPICTURE] = image05;
    dict05[ZYSTRING] = lb05;
    
    self.arrayPictue = @[dict01, dict02, dict03, dict04, dict05];
}

- (void)setupArrow
{
    [self.rightBtn setImage:[UIImage imageNamed:@"right_normal"] forState:UIControlStateNormal];
    [self.rightBtn setImage:[UIImage imageNamed:@"right_highlighted"] forState:UIControlStateHighlighted];
    
    [self.leftBtn setImage:[UIImage imageNamed:@"left_normal"] forState:UIControlStateNormal];
    [self.leftBtn setImage:[UIImage imageNamed:@"left_highlighted"] forState:UIControlStateHighlighted];
    
    //通过下标判断箭头是否可用
    [self judgeBtn];
}

//改变子控件
- (void)reloadSubviews
{
    self.topLable.text = [NSString stringWithFormat:@"%ld / %lu", self.index+1, self.arrayPictue.count];
    NSMutableDictionary *dict = self.arrayPictue[self.index];
    self.pictureImgView.image = dict[ZYPICTURE];
    self.bottomLabel.text = dict[ZYSTRING];
    [self judgeBtn];
}



//点击按钮, 切换下标, 显示新图片
- (IBAction)rightClick:(id)sender {
        self.index++;
    [self reloadSubviews];
}
- (IBAction)leftClick:(id)sender {
 
    self.index--;
    [self reloadSubviews];
}


//判断如果是最后/第一张图片,  按钮显示不可用
- (void)judgeBtn
{
    if (self.index == (self.arrayPictue.count-1)) {
        self.rightBtn.enabled = NO;
    }else{
        self.rightBtn.enabled = YES;
    }
    
    if (self.index == 0) {
        self.leftBtn.enabled = NO;
    }else{
        self.leftBtn.enabled = YES;
    }
}

@end
