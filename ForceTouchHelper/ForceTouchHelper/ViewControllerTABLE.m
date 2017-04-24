//
//  ViewControllerTABLE.m
//  ForceTouchHelper
//
//  Created by Peter Hu on 2017/4/24.
//  Copyright © 2017年 Peter Hu. All rights reserved.
//

#import "ViewControllerTABLE.h"
#import "ForceTouchHelper.h"

@interface ViewControllerTABLE ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableV;
@end

@implementation ViewControllerTABLE

- (void)viewDidLoad {
    [super viewDidLoad];
    _tableV = [[UITableView  alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableV.delegate = self;
    _tableV.dataSource = self;
    [self.view addSubview:_tableV];
    
    
    [ForceTouchHelper forceTouchWithController:self containerOrSourceView:_tableV pushTarget:^UIViewController * _Nullable(NSIndexPath * _Nullable indexPath) {
        return [[ViewControllerTABLE  alloc]init];
    }];
    // Do any additional setup after loading the view.
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
       UITableViewCell *cell = [[UITableViewCell  alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"hahah"];
    if (indexPath.row % 2 == 0) {
        cell.backgroundColor = [UIColor redColor];
    }else
    {
        cell.backgroundColor = [UIColor cyanColor];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
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
