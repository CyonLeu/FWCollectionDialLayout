//
//  FWCollectionViewDialLayout.m
//  FWCollectionDialLayout
//
//  Created by CyonLeu on 14/12/11.
//  Copyright (c) 2014年 CyonLeuInc. All rights reserved.
//

#import "FWCollectionViewDialLayout.h"

@interface FWCollectionViewDialLayout ()

@property (assign, nonatomic) CGFloat radius; //半径
@property (assign, nonatomic) int visibleCount;

@end

@implementation FWCollectionViewDialLayout

- (id)init
{
    if ((self = [super init]))
    {
        [self setup];
    }
    return self;
}

- (id)initWithDegree:(CGFloat)degree cellSize:(CGSize)cellSize
{
    self = [super init];
    if (self) {
        self.dialDegree = degree;
        self.cellSize = cellSize;
    }
    
    return self;
}


- (void)setup
{
    self.offset = 0.0f;
}
- (void)prepareLayout
{
    [super prepareLayout];
    
    self.cellCount = (int)[self.collectionView numberOfItemsInSection:0];
    self.offset = -self.collectionView.contentOffset.x / self.cellSize.width;
    
}
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}
- (CGFloat)radiusFromDegree:(CGFloat)degree
{
    return (degree * M_PI / 180);
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSMutableArray *theLayoutAttributes = [[NSMutableArray alloc] init];
    
    if (self.cellCount == 0) {
        return theLayoutAttributes;
    }
    
    float minX = CGRectGetMinX(rect);
    float maxX = CGRectGetMaxX(rect);
    
    int firstIndex = floorf(minX / self.cellSize.width);
    int lastIndex = floorf(maxX / self.cellSize.width);
    int activeIndex = (int)(firstIndex + lastIndex)/2;
    self.visibleCount = lastIndex - firstIndex;
    
    int maxVisibleOnScreen = 120 / 8 + 2;
    
    int firstItem = fmax(0, activeIndex - (int)(maxVisibleOnScreen/2) );
    int lastItem = fmin( self.cellCount-1 , activeIndex + (int)(maxVisibleOnScreen/2) );
    self.radius = CGRectGetWidth(self.collectionView.bounds) / 2 * sin(self.dialDegree* M_PI / 180);
    
    for( int i = firstItem; i <= lastItem; i++ ){
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        UICollectionViewLayoutAttributes *theAttributes = [self layoutAttributesForItemAtIndexPath:indexPath];
        [theLayoutAttributes addObject:theAttributes];
    }
    
    return [theLayoutAttributes copy];
}


- (CGSize)collectionViewContentSize
{
    const CGSize theSize = {
        .width = CGRectGetWidth(self.collectionView.bounds),
        .height = CGRectGetHeight(self.collectionView.bounds),
    };
    return(theSize);
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    double newIndex = (indexPath.item + self.offset);
    
    UICollectionViewLayoutAttributes *theAttributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    theAttributes.size = self.cellSize;
    
    CGFloat width = CGRectGetWidth(self.collectionView.bounds);
    CGFloat height = self.radius * (1 - sin([self radiusFromDegree:(90 - self.dialDegree / 2.f)]));
    if (self.cellCount == 1) {
        theAttributes.center = CGPointMake(width / 2.f, height + self.cellSize.height/2.f);
        return theAttributes;
    }
    
    CGFloat cellDegree = newIndex * (self.dialDegree / (self.cellCount - 1)) + (90 - self.dialDegree / 2.f);
    CGFloat cellRadius = [self radiusFromDegree:cellDegree];
    CGFloat cellCenterX = width / 2 - self.radius * cos(cellRadius);
    CGFloat cellCenterY = height - self.radius * (1 - sin(cellRadius)) + self.cellSize.height / 2;
    
    theAttributes.center = CGPointMake(cellCenterX, cellCenterY);
    theAttributes.zIndex = indexPath.item;
    
    return theAttributes;
}


@end
