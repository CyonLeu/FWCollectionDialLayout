//
//  FWCollectionViewDialLayout.h
//  FWCollectionDialLayout
//
//  Created by CyonLeu on 14/12/11.
//  Copyright (c) 2014年 CyonLeuInc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FWCollectionViewDialLayout : UICollectionViewLayout

@property (readwrite, nonatomic, assign) int cellCount;
@property (readwrite, nonatomic, assign) CGFloat offset;
@property (readwrite, nonatomic, assign) CGSize cellSize;
@property (readwrite, nonatomic, assign) CGFloat dialDegree;


-(id)initWithDegree:(CGFloat)degree cellSize:(CGSize)cellSize;

@end
