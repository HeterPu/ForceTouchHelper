//
//  ForceTouchHelper.h
//  sj
//
//  Created by Peter Hu on 2017/4/22.
//  Copyright © 2017年 Peter Hu. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 ForceTouch视图回调

 @param indexPath 传入的目录值，若传入为TableView或CollectionView，则为对应的indexpath，若传入NSArray<UIView *> 则section = 0,row为对应的序号.传入indexpath为空代表传入视图本身。
 @return 返回待跳转的控制器，返回nil则不使用Forcetouch.
 */
typedef UIViewController *_Nullable(^ConCallBack)(NSIndexPath * _Nullable indexPath);

@interface ForceTouchHelper : UIView

/**
 设置ForceTouch,通过传入Tableview,Collectionview,普通View的数组NSArray<UIView *>来获得peek and pop.

 @param controller 要使用ForceTouch所在的控制器.
 @param containerOrSource 可以传入单个的view 也可以传入包含view的数组.
        1.containerOrSource 容器View 传入是要使用ForceTouch的UITableView和UICollectionview 或一般的view.
        2.containerOrSource为数组NSArray<UIView *>.传入view的数组.
 @param callBack 根据IndexPath 返回要跳转的控制器，传入为空代表传入视图本身，返回nil则当前cell不使用ForceTouch.
 @param return 返回的实例对象被全局捕获应使用若引用weak,防止内存不释放.
 */

+(instancetype _Nullable )forceTouchWithController:(UIViewController *_Nonnull)controller containerOrSourceView:(id _Nonnull)containerOrSource pushTarget:(nonnull ConCallBack) callBack;



/**
 设置当前页面ForceTouch是否有效

 @param isEnabled 是否可用
 */
-(void)setForceTouchEnable:(BOOL)isEnabled;



/**
 设置当前页面单个视图元素ForceTouch是否有效.

 @param isEnabled 是否有效.
 @param index 传入的目录.
 */
-(void)setForceTouchEnable:(BOOL)isEnabled andIndex:(NSInteger)index;

@end
