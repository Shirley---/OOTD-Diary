#import <UIKit/UIKit.h>

static NSMutableArray *capturedImages;
static NSMutableArray *defaultImages;

@interface CollectionViewController : UICollectionViewController <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;

- (UIImage *)imageWithImage:(UIImage *)image scaledToFillSize:(CGSize)size;
+ (void) initialize;
+ (void) setCapturedImages:(UIImage *) image;
+ (NSMutableArray *)capturedImages;
+ (NSMutableArray *)defaultImages;

@end
