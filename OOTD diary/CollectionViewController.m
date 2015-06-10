#import "CollectionViewController.h"

#import "ImageDetailViewController.h"
#import "CHTCollectionViewWaterfallCell.h"

#define CELL_IDENTIFIER @"WaterfallCell"

@interface CollectionViewController ()
@property (nonatomic, strong) NSMutableArray *cellSizes;
//@property (nonatomic, strong) CHTCollectionViewWaterfallCell *cell;
@end



@implementation CollectionViewController

static NSString * const reuseIdentifier = @"WaterfallCell";

+ (void) initialize {
  capturedImages = [[NSMutableArray alloc] init];
  defaultImages = [[NSMutableArray alloc] init];
  NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
  if ([defaults objectForKey:@"data"]) {
    defaultImages = [defaults objectForKey:@"data"];
    for (int i =0; i < defaultImages.count; i++) {
      [capturedImages addObject:[UIImage imageWithData:defaultImages[i]]];
    }
  }
}

+ (void) setCapturedImages:(UIImage *) image {
  [capturedImages addObject:image];
  NSData *myData = UIImagePNGRepresentation(image);
  [defaultImages addObject:myData];
  NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
  [defaults setObject:defaultImages forKey:@"data"];
  [defaults synchronize];
}

+ (NSMutableArray *)capturedImages {
  return capturedImages;
}

+ (NSMutableArray *)defaultImages {
  return defaultImages;
}

- (id) init {
  self = [super init];
  if (self == nil){
    [capturedImages addObject: [UIImage imageNamed:@"cat1.jpg"]];
    [capturedImages addObject: [UIImage imageNamed:@"cat2.jpg"]];
    [capturedImages addObject: [UIImage imageNamed:@"cat3.jpg"]];
    [capturedImages addObject: [UIImage imageNamed:@"cat4.jpg"]];
  }
  return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.descriptions = [[NSMutableArray alloc] init];
  
  [self.descriptions addObject:@"cat1"];
  [self.descriptions addObject:@"cat2"];
  [self.descriptions addObject:@"cat3"];
  [self.descriptions addObject:@"cat4"];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  // Get the new view controller using [segue destinationViewController].
  // Pass the selected object to the new view controller.
  UICollectionViewCell *cell = (UICollectionViewCell *)sender;
  //The indexPath will be what we'll use to know which cell was selected
  NSIndexPath *indexPath = [self.collectionView indexPathForCell:cell];
  
  ImageDetailViewController *imageDetailViewController =
      (ImageDetailViewController *)segue.destinationViewController;
  imageDetailViewController.image = [capturedImages objectAtIndex:indexPath.row];
  imageDetailViewController.detail = [self.descriptions objectAtIndex:indexPath.row];
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
  return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
  return capturedImages.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
  
  // Configure the cell
  CHTCollectionViewWaterfallCell *cell = (CHTCollectionViewWaterfallCell *)[collectionView dequeueReusableCellWithReuseIdentifier:CELL_IDENTIFIER forIndexPath:indexPath];
  cell.backgroundColor = [UIColor whiteColor];
  UIImage *myImage = [[UIImage alloc] init];
  myImage = [capturedImages objectAtIndex:indexPath.row];
  cell.imageView.image = myImage;
  return cell;
}



#pragma mark - CHTCollectionViewDelegateWaterfallLayout

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
  return [self.cellSizes[indexPath.item] CGSizeValue];
}

- (UIImage *)imageWithImage:(UIImage *)image scaledToFillSize:(CGSize)size {
  CGFloat scale = MAX(size.width/image.size.width, size.height/image.size.height);
  CGFloat width = image.size.width * scale;
  CGFloat height = image.size.height * scale;
  CGRect imageRect =
      CGRectMake((size.width - width)/2.0f, (size.height - height)/2.0f, width, height);
  UIGraphicsBeginImageContext(size);
  [image drawInRect:imageRect];
  UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return newImage;
}

#pragma mark - cell sizes
- (NSMutableArray *)cellSizes {
  if (!_cellSizes) {
    _cellSizes = [NSMutableArray array];
    for (NSInteger i = 0; i < capturedImages.count; i++) {
      UIImage *myImage =  [capturedImages objectAtIndex:i];
      UIImage *newImage = [self imageWithImage:myImage scaledToFillSize:CGSizeMake(150, 150)];
      CGSize size = newImage.size;
      _cellSizes[i] = [NSValue valueWithCGSize:size];
    }
  }
  return _cellSizes;
}

@end
