#import <UIKit/UIKit.h>

@interface ImageDetailViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *imageDetail;
@property (strong, nonatomic) IBOutlet UILabel *detailLabel;

@property (strong, nonatomic) UIImage *image;
@property (strong, nonatomic) NSString *detail;

@end
