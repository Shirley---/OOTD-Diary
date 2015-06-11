#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface MainViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *imageView;
- (IBAction)takePhoto:(UIButton *)sender;
- (IBAction)selectPhoto:(UIButton *)sender;

@end

