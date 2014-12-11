## FWCollectionViewDialLayout ##

According to Dial degree to layout UICollectionViewCell, 
center point of cell is averge to dial degree.


## How to use DialLayout
override layout instance method:
	
	- (UICollectionViewLayoutAttributes 	*)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath;

	FWCollectionViewDialLayout *layout = [[FWCollectionViewDialLayout alloc] initWithDegree:120 cellSize:CGSizeMake(50, 50)];
	
    [self.collectionView setCollectionViewLayout:layout];
    
    
## Demo image effect :##
   
   screenshot 1
   
   ![image ](https://raw.githubusercontent.com/CyonLeu/FWCollectionDialLayout/master/screenshot2.png)
   
   screenshot 2
   
   ![image ](https://raw.githubusercontent.com/CyonLeu/FWCollectionDialLayout/master/screenshot1.png)