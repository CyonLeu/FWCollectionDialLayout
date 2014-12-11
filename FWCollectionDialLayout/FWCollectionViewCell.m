//
//  FWCollectionViewCell.m
//  FWCollectionDialLayout
//
//  Created by CyonLeu on 14/12/11.
//  Copyright (c) 2014年 CyonLeuInc. All rights reserved.
//

#import "FWCollectionViewCell.h"

@implementation FWCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
//    self.contentView.layer.cornerRadius = CGRectGetWidth(self.bounds)/2.f;
    self.iconImageView.layer.cornerRadius = CGRectGetWidth(self.bounds)/2;
    [self sendSubviewToBack:self.iconImageView];
    [self bringSubviewToFront:self.titleLabel];
}

@end
