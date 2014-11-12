//
//  CollectionViewController.m
//  OOTD diary
//
//  Created by Shirley Du on 2014-11-08.
//  Copyright (c) 2014 Shirley Du. All rights reserved.
//

#import "CollectionViewController.h"
#import "CHTCollectionViewWaterfallCell.h"
#import "ImageDetailViewController.h"

#define CELL_COUNT 30
#define CELL_IDENTIFIER @"WaterfallCell"
#define HEADER_IDENTIFIER @"WaterfallHeader"
#define FOOTER_IDENTIFIER @"WaterfallFooter"

@interface CollectionViewController ()
@property (nonatomic, strong) NSMutableArray *cellSizes;
@end

@implementation CollectionViewController

static NSString * const reuseIdentifier = @"WaterfallCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    //[self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:CELL_IDENTIFIER];
    
    // Do any additional setup after loading the view.
    self.capturedImages = [[NSMutableArray alloc] init];
    self.descriptions = [[NSMutableArray alloc] init];
    
    [self.capturedImages addObject: @"cat1.jpg"];
    [self.capturedImages addObject: @"cat2.jpg"];
    [self.capturedImages addObject: @"cat3.jpg"];
    [self.capturedImages addObject: @"cat4.jpg"];
    
    [self.descriptions addObject:@"cat1"];
    [self.descriptions addObject:@"cat2"];
    [self.descriptions addObject:@"cat3"];
    [self.descriptions addObject:@"cat4"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    UICollectionViewCell *cell = (UICollectionViewCell *)sender;
    //The indexPath will be what we'll use to know which cell was selected
    NSIndexPath *indexPath = [self.collectionView indexPathForCell:cell];
    
    ImageDetailViewController *imageDetailViewController = (ImageDetailViewController *)segue.destinationViewController;
    imageDetailViewController.image = [UIImage imageNamed:[self.capturedImages objectAtIndex:indexPath.row]];
    imageDetailViewController.detail = [self.descriptions objectAtIndex:indexPath.row];
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.capturedImages.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    // Configure the cell
    CHTCollectionViewWaterfallCell *cell = (CHTCollectionViewWaterfallCell *)[collectionView dequeueReusableCellWithReuseIdentifier:CELL_IDENTIFIER forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    //cell.displayString = [NSString stringWithFormat:@"%ld", (long)indexPath.item];
    UIImage *myImage = [[UIImage alloc] init];
    NSLog(@"count: %i",self.capturedImages.count);
    NSLog(@"index: %i", indexPath.row);
    myImage = [UIImage imageNamed:[self.capturedImages objectAtIndex:indexPath.row]];
    cell.imageView.image = myImage;
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

#pragma mark - UICollectionViewDataSource

/*
 - (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
 UICollectionReusableView *reusableView = nil;
 
 if ([kind isEqualToString:CHTCollectionElementKindSectionHeader]) {
 reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:kind
 withReuseIdentifier:HEADER_IDENTIFIER
 forIndexPath:indexPath];
 } else if ([kind isEqualToString:CHTCollectionElementKindSectionFooter]) {
 reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:kind
 withReuseIdentifier:FOOTER_IDENTIFIER
 forIndexPath:indexPath];
 }
 
 return reusableView;
 }
 */
 


#pragma mark - CHTCollectionViewDelegateWaterfallLayout
/*
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.cellSizes[indexPath.item] CGSizeValue];
}

/*
@synthesize collectionView = _collectionView;

 - (UICollectionView *)collectionView {
 if (!_collectionView) {
 CHTCollectionViewWaterfallLayout *layout = [[CHTCollectionViewWaterfallLayout alloc] init];
 
 layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
 layout.headerHeight = 15;
 layout.footerHeight = 10;
 layout.minimumColumnSpacing = 20;
 layout.minimumInteritemSpacing = 30;
 
 _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
 _collectionView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
 _collectionView.dataSource = self;
 _collectionView.delegate = self;
 _collectionView.backgroundColor = [UIColor whiteColor];
 [_collectionView registerClass:[CHTCollectionViewWaterfallCell class]
 forCellWithReuseIdentifier:CELL_IDENTIFIER];
 //[_collectionView registerClass:[CHTCollectionViewWaterfallHeader class]
// forSupplementaryViewOfKind:CHTCollectionElementKindSectionHeader
// withReuseIdentifier:HEADER_IDENTIFIER];
// [_collectionView registerClass:[CHTCollectionViewWaterfallFooter class]
// forSupplementaryViewOfKind:CHTCollectionElementKindSectionFooter
// withReuseIdentifier:FOOTER_IDENTIFIER];
 }
 return _collectionView;
 }
*/
 
 

#pragma mark - cell sizes
- (NSMutableArray *)cellSizes {
    if (!_cellSizes) {
        _cellSizes = [NSMutableArray array];
        for (NSInteger i = 0; i < self.capturedImages.count; i++) {
            //CGSize size = CGSizeMake(arc4random() % 50 + 50, arc4random() % 50 + 50);
            UIImage *myImage = [UIImage imageNamed: [self.capturedImages objectAtIndex:i]];
            CGSize size = myImage.size;
            size.height  = 100;
            size.width = 100;
            _cellSizes[i] = [NSValue valueWithCGSize:size];
        }
    }
    return _cellSizes;
}

/*
- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    [super willAnimateRotationToInterfaceOrientation:toInterfaceOrientation duration:duration];
    [self updateLayoutForOrientation:toInterfaceOrientation];
}

- (void)updateLayoutForOrientation:(UIInterfaceOrientation)orientation {
    CHTCollectionViewWaterfallLayout *layout =
    (CHTCollectionViewWaterfallLayout *)self.collectionView.collectionViewLayout;
    layout.columnCount = UIInterfaceOrientationIsPortrait(orientation) ? 2 : 3;
}
 */

@end
