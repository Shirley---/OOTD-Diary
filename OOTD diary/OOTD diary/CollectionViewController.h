//
//  CollectionViewController.h
//  OOTD diary
//
//  Created by Shirley Du on 2014-11-08.
//  Copyright (c) 2014 Shirley Du. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CHTCollectionViewWaterfallLayout.h"

static NSMutableArray * capturedImages;

@interface CollectionViewController : UICollectionViewController <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout> //CHTCollectionViewDelegateWaterfallLayout>

@property (strong, nonatomic) NSMutableArray *descriptions;
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;

- (UIImage *)imageWithImage:(UIImage *)image scaledToFillSize:(CGSize)size;
+ (void) initialize;
- (id) init;
- (void) setCapturedImages:(NSString *) imageName;

@end
