#import <UIKit/UIKit.h>

static NSMutableArray * capturedImages;
static NSMutableArray * defaultImages;

@interface CollectionViewController : UICollectionViewController <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) NSMutableArray *descriptions;
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;

- (UIImage *)imageWithImage:(UIImage *)image scaledToFillSize:(CGSize)size;
+ (void) initialize;
- (id) init;
+ (void) setCapturedImages:(UIImage *) image;
+ (void) setDefaultImages: (NSMutableArray *) array;
+ (NSMutableArray *)capturedImages;
+ (NSMutableArray *)defaultImages;

@end
