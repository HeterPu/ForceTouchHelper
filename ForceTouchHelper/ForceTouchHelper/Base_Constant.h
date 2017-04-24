//
//  Base_Constant.h
//  sj
//
//  Created by Peter Hu on 2017/3/9.
//  Copyright © 2017年 jack liu. All rights reserved.
//

#ifndef Base_Constant_h
#define Base_Constant_h

//屏幕尺寸
#define kScreenB  [UIScreen mainScreen].bounds
#define kScreenWidth   kScreenB.size.width
#define kScreenHeight  kScreenB.size.height
#define  kStatusBarHeight 20
#define  kNavbarHeight 64

#define WeakObj(o) autoreleasepool{} __weak typeof(o) o##Weak = o;  //宏定义self

//屏幕颜色
#define KRGBA(r,g,b,a)  [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define KRGB(r,g,b)     KRGBA(r,g,b,1)

#define kAppBakgroundColor  KRGB(225,225,225)
#define kNavBarThemeColor  KRGB(238,71,75)
#define kRightBtnTitleColor  KRGB(255,255,255)
#define kRightBtnFont  [UIFont systemFontOfSize:15]
#define kTitleFont  [UIFont systemFontOfSize:18]
#define kTitleColor  KRGB(255,255,255)


#define  kScreenHeightScale(y)  (y)/(1136.0f)*kScreenHeight
#define  kScreenWidthScale(x)  (x)/(640.0f)*kScreenWidth

#define  kDefaultBackImage  [UIImage imageNamed:@"left_ico"]
#define  kDefaultRightImage  [UIImage imageNamed:@""]




//项目主题颜色

//tabbar的文字颜色
#define kTABtitleCOLOR  KRGB(104,109,114)
#define kTABtitleSelCOLOR  KRGB(239,78,81)

//tabbar图片
#define kTABPIC1 @"icon1"
#define kTABPIC2 @"icon2"
#define kTABPIC3 @"icon3"
#define kTABPIC4 @"icon4"

#define kTABSelPIC1 @"icon_1"
#define kTABSelPIC2 @"icon_2"
#define kTABSelPIC3 @"icon_3"
#define kTABSelPIC4 @"icon_4"

#define kCenterBTNPic  @"icon5"



// 红色
#define kRedColor     [UIColor colorWithRed:240/255.0 green:60/255.0 blue:60/255.0 alpha:1]
// 灰色
#define kGrayColor    [UIColor colorWithRed:132/255.0 green:132/255.0 blue:132/255.0 alpha:1]
// 深灰色
#define kDarkGrayColor [UIColor colorWithRed:77/255.0 green:78/255.0 blue:79/255.0 alpha:1]
// 绿色
#define kGreenColor   [UIColor colorWithRed:5/255.0 green:160/255.0 blue:8/255.0 alpha:1]
// 分割线
#define kLineColor    [UIColor colorWithRed:210/255.0 green:210/255.0 blue:210/255.0 alpha:1]

// 字体超大
#define kFontSizeXXL  [UIFont systemFontOfSize:20];
// 字体特大
#define kFontSizeXL   [UIFont systemFontOfSize:18];
// 字体大
#define kFontSizeL    [UIFont systemFontOfSize:16];
// 字体中
#define kFontSizeM    [UIFont systemFontOfSize:14];
// 字体小
#define kFontSizeS    [UIFont systemFontOfSize:12];

//浏览器参数设置
#define KWebControllerLoadingFailPic @"loadingfail"
#define KWebControllerLoadingFailText @"加载失败，请刷新！"
#define KWebControllerBackGroundColor  KRGB(70, 70, 70)
#define KWebControllerBackGroundTipColor  KRGB(200, 200, 200)
#define KWebControllerProgressBarColor  [UIColor blueColor]


#endif /* Base_Constant_h */
