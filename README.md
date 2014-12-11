## FWCollectionViewDialLayout ##

According to Dial degree to layout UICollectionViewCell, 
center point of cell is averge to dial degree.


## How to use DialLayout
override layout instance method:
	
	- (UICollectionViewLayoutAttributes 	*)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath;

	FWCollectionViewDialLayout *layout = [[FWCollectionViewDialLayout alloc] initWithDegree:120 cellSize:CGSizeMake(50, 50)];
	
    [self.collectionView setCollectionViewLayout:layout];
    
    
## Demo image effect :##
   
   ![image ]()
   