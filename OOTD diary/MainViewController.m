#import "MainViewController.h"
#import "CollectionViewController.h"

@interface MainViewController ()

@property (nonatomic, strong) UIImage *chosenImage;
@property (nonatomic, strong) NSMutableArray *myImages;
@property (nonatomic, strong) UICollectionViewFlowLayout *layout;
@end

@implementation MainViewController {
}

- (id) init
{
  self = [super initWithNibName:@"MainViewController" bundle:nil];
  return self;
}

- (void)viewDidLoad {
  
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  
  if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
      
      UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                            message:@"Device has no camera"
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles: nil];
      
      [myAlertView show];
      
  }
  self.myImages = [[NSMutableArray alloc]init];

}

#pragma  mark - choose photo
- (IBAction)takePhoto:(UIButton *)sender {
  UIImagePickerController *picker = [[UIImagePickerController alloc] init];
  picker.delegate = self;
  picker.allowsEditing = YES;
  picker.sourceType = UIImagePickerControllerSourceTypeCamera;
  [self presentViewController:picker animated:YES completion:NULL];
}

- (IBAction)selectPhoto:(UIButton *)sender {
  UIImagePickerController *picker = [[UIImagePickerController alloc] init];
  picker.delegate = self;
  picker.allowsEditing = YES;
  picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;

  [self presentViewController:picker animated:YES completion:NULL];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
  
  self.chosenImage = info[UIImagePickerControllerEditedImage];
  [CollectionViewController setCapturedImages: self.chosenImage];
  self.imageView.image = self.chosenImage;
  
  
  [picker dismissViewControllerAnimated:YES completion:NULL];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
[picker dismissViewControllerAnimated:YES completion:NULL];
}

@end
