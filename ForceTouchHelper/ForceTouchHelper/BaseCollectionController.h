//
//  BaseCollectionController.h
//  YanHuangDLT
//
//  Created by Peter on 9/13/16.
//  Copyright © 2016 Peter. All rights reserved.
#import <UIKit/UIKit.h>

@interface BaseCollectionController :UIViewController<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>


@property(nonatomic,strong) UICollectionView *collectionView;

// DeFault isLoadFromNIB is NO,
-(BOOL)isLoadFromNIB;
-(NSString *)getReuseIdentifier;

@end
