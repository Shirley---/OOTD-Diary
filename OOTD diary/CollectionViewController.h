#import <UIKit/UIKit.h>

@class CHTCollectionViewWaterfallLayout;

static NSMutableArray *capturedImages;
static NSMutableArray *defaultImages;

@interface CollectionViewController : UICollectionViewController <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property(nonatomic, strong) UICollectionViewLayout *collectionViewLayout;

- (UIImage *)imageWithImage:(UIImage *)image scaledToFillSize:(CGSize)size;
//+ (void) initialize;
- (instancetype)initWithCollectionViewLayout:(UICollectionViewLayout *)layout;

+ (void) setCapturedImages:(UIImage *) image;
+ (NSMutableArray *)capturedImages;
+ (NSMutableArray *)defaultImages;

@end
