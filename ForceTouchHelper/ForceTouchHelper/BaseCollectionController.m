//
//  BaseCollectionController.m
//  YanHuangDLT
//
//  Created by Peter on 9/13/16.
//  Copyright © 2016 Peter. All rights reserved.
//


#import "BaseCollectionController.h"
#import "Base_Constant.h"
#import "ForceTouchHelper.h"


@interface BaseCollectionController()


@end

@implementation BaseCollectionController


-(void)viewDidLoad {
    [super viewDidLoad];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    _collectionView = [[UICollectionView alloc]initWithFrame:self.view.frame collectionViewLayout:layout];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    
    
    if ([self isLoadFromNIB]) {
       [_collectionView registerNib:[UINib nibWithNibName:[self getReuseIdentifier] bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:[self getReuseIdentifier]];
    }
    else
    {
    [_collectionView registerClass:NSClassFromString([self getReuseIdentifier])  forCellWithReuseIdentifier:[self getReuseIdentifier]];
    }
    [self.view addSubview:_collectionView];
    
    
    [ForceTouchHelper forceTouchWithController:self containerOrSourceView:_collectionView pushTarget:^UIViewController * _Nullable(NSIndexPath * _Nullable indexPath) {
        return [[BaseCollectionController  alloc]init];
    }];
    
}


-(BOOL)isLoadFromNIB {
    return NO;
}


-(NSString *)getReuseIdentifier {
    return @"UICollectionViewCell";
}



-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 50;
}



-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * CellIdentifier = @"UICollectionViewCell";
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    NSInteger value1 = arc4random() % 255;
    NSInteger value2 = arc4random() % 255;
    NSInteger value3 = arc4random() % 255;
    
    cell.backgroundColor = KRGB(value1,value2, value3);
    return cell;
}


#pragma mark --UICollectionViewDelegateFlowLayout
//定义每个UICollectionView 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((kScreenWidth - 25)/2, 180);
}


//定义每个UICollectionView 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    
    return UIEdgeInsetsMake(10, 10, 10, 10);
}



//UICollectionView被选中时调用的方法
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 5;
}


// 设置最小行间距，也就是前一行与后一行的中间最小间隔
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 5;
}



#pragma mark --UICollectionViewDelegate
//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
        UICollectionViewCell * cell = (UICollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    NSInteger value1 = arc4random() % 255;
    NSInteger value2 = arc4random() % 255;
    NSInteger value3 = arc4random() % 255;
    
    cell.backgroundColor = KRGB(value1,value2, value3);
}
//返回这个UICollectionView是否可以被选择
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    return YES;
}


- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath{

}

@end
