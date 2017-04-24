//
//  ForceTouchHelper.m
//  sj
//
//  Created by Peter Hu on 2017/4/22.
//  Copyright © 2017年 jack liu. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "ForceTouchHelper.h"

@interface ForceTouchHelper()<UIViewControllerPreviewingDelegate>
@property(nonatomic,weak)UIViewController *con;
@property(nonatomic,copy)ConCallBack callBack;
@property(nonatomic,strong)NSArray<UIView *> *container;
@property(nonatomic,strong)NSMutableArray<id<UIViewControllerPreviewing>> * previewContextArra;

@end
@implementation ForceTouchHelper


+(instancetype)forceTouchWithController:(UIViewController *)controller containerOrSourceView:(id)containerOrSource pushTarget:(ConCallBack)callBack{
    ForceTouchHelper *helper = [[ForceTouchHelper  alloc]init];
    if (([controller.traitCollection respondsToSelector:@selector(forceTouchCapability)])&&(controller.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable)) {
        NSMutableArray *previewArra = [NSMutableArray array];
        if ([containerOrSource isKindOfClass:[NSArray class]]) {
            NSArray *arra = containerOrSource;
            for (UIView *item in arra) {
                id <UIViewControllerPreviewing> previewing = [controller registerForPreviewingWithDelegate:helper sourceView:item];
                [previewArra addObject:previewing];
            }
        }
        else
        {
            id <UIViewControllerPreviewing> previewing = [controller registerForPreviewingWithDelegate:helper sourceView:containerOrSource];
            [previewArra addObject:previewing];
        }
        helper.previewContextArra  = previewArra;
    }
    else{
        return nil;
    }
    helper.con = controller;
    if ([containerOrSource isKindOfClass:[UIView class]]) {
        helper.container = [NSArray arrayWithObject:containerOrSource];
    }
    else
    {
       helper.container = containerOrSource;
    }
    helper.callBack = callBack;
    [controller.view insertSubview:helper atIndex:0];
    return helper;
}


-(UIViewController *)previewingContext:(id<UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location{
    if (_container.count == 1) {
    if ([_container[0] isKindOfClass:[UITableView class]]) {
        UITableView *contentView = (UITableView *)_container[0];
        NSIndexPath *indexPath = [contentView indexPathForRowAtPoint:location];
        UITableViewCell *cell = [contentView cellForRowAtIndexPath:indexPath];
        if (cell) {
            previewingContext.sourceRect = cell.frame;
            return  self.callBack(indexPath);
        }
        else
        {
            return self.callBack([NSIndexPath indexPathForRow:0 inSection:0]);
        }
    }
    else if ([_container[0] isKindOfClass:[UICollectionView class]]){
        UICollectionView *contentView = (UICollectionView *)_container[0];
        NSIndexPath *indexPath = [contentView indexPathForItemAtPoint:location];
        UICollectionViewCell *cell = [contentView cellForItemAtIndexPath:indexPath];
        if (cell) {
            previewingContext.sourceRect = cell.frame;
            return  self.callBack(indexPath);
        }
        else
        {
            return self.callBack([NSIndexPath indexPathForRow:0 inSection:0]);
        }
    }
    else
    {
        return self.callBack([NSIndexPath indexPathForRow:0 inSection:0]);
    }
    }
    else
    {
        NSInteger index = [_previewContextArra indexOfObject:previewingContext];
        return self.callBack([NSIndexPath indexPathForRow:index inSection:0]);
    }
    return nil;
}


-(void)previewingContext:(id<UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit{
    viewControllerToCommit.hidesBottomBarWhenPushed = true;
    [_con showViewController:viewControllerToCommit sender:_con];
}


-(void)setForceTouchEnable:(BOOL)isEnabled andIndex:(NSInteger)index{
    if (index < _container.count) {
    if (isEnabled) {
       id<UIViewControllerPreviewing> item = [_con registerForPreviewingWithDelegate:self sourceView:_container[index]];
         [_previewContextArra replaceObjectAtIndex:index withObject:item];
    }
    else
    {
        id<UIViewControllerPreviewing> item = (id<UIViewControllerPreviewing>)[[NSObject  alloc] init];
        [_con unregisterForPreviewingWithContext:_previewContextArra[index]];
        [_previewContextArra replaceObjectAtIndex:index withObject:item];
    }
  }
}


-(void)setForceTouchEnable:(BOOL)isEnabled {
    int count = (int)_container.count - 1;
    for (int i = count;i>=0;i--) {
        if (isEnabled) {
           id<UIViewControllerPreviewing> item = [_con registerForPreviewingWithDelegate:self sourceView:_container[i]];
            [_previewContextArra insertObject:item atIndex:0];
        }
        else
        {
            [_con unregisterForPreviewingWithContext:_previewContextArra[i]];
            [_previewContextArra removeObjectAtIndex:i];
        }
    }
}

-(void)dealloc {
    for (int i = 0;i<_container.count;i++) {
        [_con unregisterForPreviewingWithContext:_previewContextArra[i]];
    }
    NSLog(@"%@ aleady deallc",NSStringFromClass([self class]));
}

@end
