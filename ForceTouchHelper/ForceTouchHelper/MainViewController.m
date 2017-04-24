//
//  MainViewController.m
//  sad
//
//  Created by Peter Hu on 2017/4/24.
//  Copyright © 2017年 Peter Hu. All rights reserved.
//

#import "MainViewController.h"
#import "Mydrawview.h"
#import "ForceTouchHelper.h"

@interface MainViewController ()
@property(nonatomic,weak)ForceTouchHelper *helper;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(50, 50, 100, 100);
    [btn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    // Do any additional setup after loading the view.
}


-(void)back{
    [self dismissViewControllerAnimated:true completion:nil];
}


-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.title = @"点击红色按钮,禁用用用中间图标的ForceTouch";
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(140, 140, 100, 100);
    btn.backgroundColor = [UIColor redColor];
    btn.layer.cornerRadius = 20;
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeSystem];
    btn2.frame = CGRectMake(200, 500, 100, 100);
    btn2.backgroundColor = [UIColor blueColor];
    btn2.layer.cornerRadius = 20;
    
    
    Mydrawview *drawer = [[Mydrawview  alloc]initWithFrame:CGRectMake(140, 340, 100, 100)];
    drawer.backgroundColor = [UIColor clearColor];
    [self.view addSubview:btn];
    [self.view addSubview:drawer];
    [self.view addSubview:btn2];
    _helper = [ForceTouchHelper forceTouchWithController:self containerOrSourceView:@[btn,drawer,btn2] pushTarget:^UIViewController *(NSIndexPath *indexPath) {
        NSLog(@"SECTION IS %li , ROW IS %li",indexPath.section,indexPath.row);
        return [[UIViewController  alloc]init];
    }];

}


-(void)btnClick:(UIButton *)sender {
    NSLog(@"BTN CLICK");
    if (_helper.tag != 23) {
        [sender setTitle:@"开启" forState:UIControlStateNormal];
        self.title = @"点击红色按钮,启用用中间图标的ForceTouch";
        _helper.tag = 23;
        [_helper setForceTouchEnable:false andIndex:1];
    }
    else
    {
         [sender setTitle:@"关闭" forState:UIControlStateNormal];
        self.title = @"点击红色按钮,禁用用用中间图标的ForceTouch";
        _helper.tag = 22;
        [_helper setForceTouchEnable:true andIndex:1];
    }
    
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
