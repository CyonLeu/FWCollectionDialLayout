//
//  ViewController.m
//  FWCollectionDialLayout
//
//  Created by CyonLeu on 14/12/11.
//  Copyright (c) 2014年 CyonLeuInc. All rights reserved.
//

#import "ViewController.h"
#import "FWCollectionViewCell.h"
#import "FWCollectionViewDialLayout.h"


NSString *const kFWCollectionViewCell = @"FWCollectionViewCell";


@interface ViewController ()<UICollectionViewDataSource, UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *currentCountLabel;

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (assign, nonatomic) NSInteger cellCount;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.cellCount = 6;
    
    [self.collectionView registerNib:[UINib nibWithNibName:kFWCollectionViewCell bundle:nil] forCellWithReuseIdentifier:kFWCollectionViewCell];
    
    
    FWCollectionViewDialLayout *layout = [[FWCollectionViewDialLayout alloc] initWithDegree:120 cellSize:CGSizeMake(50, 50)];
    [self.collectionView setCollectionViewLayout:layout];
    [self.collectionView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onSliderValueChanged:(id)sender {
    UISlider *slider = (UISlider *)sender;
    self.cellCount = slider.value;
    self.currentCountLabel.text = [NSString stringWithFormat:@"%ld", self.cellCount];
    
    [self.collectionView reloadData];
}

#pragma mark - UICollectionViewDelegate

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.cellCount;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    FWCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kFWCollectionViewCell forIndexPath:indexPath];
    cell.titleLabel.text = [NSString stringWithFormat:@"%ld", indexPath.item];
    
    return cell;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"didSelected:%ld", indexPath.item);
    
}

@end
