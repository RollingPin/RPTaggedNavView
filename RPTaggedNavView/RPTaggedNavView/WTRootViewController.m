
//
//  WTRootViewController.m
//  RPTaggedNavView
//
//  Created by Tao on 2018/7/23.
//  Copyright © 2018年 Tao. All rights reserved.
//

#import "WTRootViewController.h"
#import "UIView+Ext.h"
#import "RPTaggedNavView.h"

#define WTWidth [UIScreen mainScreen].bounds.size.width
#define WTHeight [UIScreen mainScreen].bounds.size.height
#define iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
#define STATUS_BAR_HEIGHT (iPhoneX ? 44.f : 20.f)
#define NAVIGATION_BAR_HEIGHT (iPhoneX ? 88.f : 64.f)
#define TAB_BAR_HEIGHT (iPhoneX ? (49.f+34.f) : 49.f)
#define HOME_INDICATOR_HEIGHT (iPhoneX ? 34.f : 0.f)
#define WTRandomColor [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1.0f]
#define WTWeakSelf __weak typeof(self) weakSelf = self

@interface WTRootViewController ()<RPTaggedNavViewDelegate,UIScrollViewDelegate>

@property (nonatomic, strong) RPTaggedNavView * taggedNavView;
@property (nonatomic, strong) UIScrollView * bgScroll;

@end

@implementation WTRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"雪泥鸿爪";
    [self createUI];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
}
- (void)createUI
{
    self.taggedNavView = [[RPTaggedNavView alloc]initWithFrame:CGRectMake(0, NAVIGATION_BAR_HEIGHT, WTWidth, 44)];
    self.taggedNavView.delegate = self;
    self.taggedNavView.dataArr = [NSArray arrayWithObjects:@"0",@"1",@"2",@"3", nil];
    self.taggedNavView.tagTextColor_normal = [UIColor blackColor];
    self.taggedNavView.tagTextColor_selected = [UIColor redColor];
    self.taggedNavView.tagTextFont_normal = 15;
    self.taggedNavView.tagTextFont_selected = 22;
    self.taggedNavView.sliderColor = [UIColor redColor];
    self.taggedNavView.sliderW = 30;
    self.taggedNavView.sliderH = 1;
    [self.view addSubview:self.taggedNavView];
    
    self.bgScroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, self.taggedNavView.bottomY, WTWidth, WTHeight-self.taggedNavView.bottomY)];
    self.bgScroll.contentSize = CGSizeMake(WTWidth*4, 0);
    self.bgScroll.delegate = self;
    self.bgScroll.pagingEnabled = YES;
    [self.view addSubview:self.bgScroll];
    
    NSArray * labelContentArr = [NSArray arrayWithObjects:@"人生到处知何似，恰似飞鸿踏雪泥；",@"泥上偶然留指爪，鸿飞那复计东西。",@"老僧已死成新塔，坏壁无由见旧题；",@"人生到处知何似，恰似飞鸿踏雪泥；",@"往日崎岖还记否，路长人困蹇驴嘶。", nil];
    for (int i = 0; i<labelContentArr.count; i++) {
        UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(WTWidth*i, 0, WTWidth, self.bgScroll.height)];
        label.backgroundColor = WTRandomColor;
        label.text = [NSString stringWithFormat:@"%d\n%@",i,labelContentArr[i]];
        label.textAlignment = NSTextAlignmentCenter;
        label.numberOfLines = 0;
        [_bgScroll addSubview:label];
    }
}
#pragma mark -- taggedNavViewDelegate
- (void)haveSelectedIndex:(NSInteger)index
{
    self.bgScroll.contentOffset = CGPointMake(WTWidth*index, 0);
}

#pragma mark -- scrollviewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSInteger selectedIndx = scrollView.contentOffset.x/WTWidth;
    [self.taggedNavView selectingOneTagWithIndex:selectedIndx];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
