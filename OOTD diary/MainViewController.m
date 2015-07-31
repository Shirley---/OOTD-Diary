#import "MainViewController.h"

#import "MainView.h"
#import "CollectionViewController.h"
#import "CHTCollectionViewWaterfallLayout.h"

@interface MainViewController ()<UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (nonatomic, strong) UIImage *chosenImage;
@property (nonatomic, strong) NSMutableArray *myImages;
@property (nonatomic, strong) UICollectionViewFlowLayout *layout;

@end

@implementation MainViewController {
    UIView *_imageView;
    UIButton *_takePhotosButton;
    UIButton *_selectPhotosButton;
    UIButton *_diaryButton;
}

- (id)init {
  self = [super init];
  return self;
}

- (void)loadView {
    self.view = [[MainView alloc] init];
}

- (void)viewDidLoad {
  [super viewDidLoad];
    
    _takePhotosButton = [self mainView].takePhotoButton;
    [_takePhotosButton addTarget:self action:@selector(takePhoto) forControlEvents:UIControlEventTouchUpInside];
    
    _selectPhotosButton = [self mainView].selectPhotoButton;
    [_selectPhotosButton addTarget:self action:@selector(selectPhoto) forControlEvents:UIControlEventTouchUpInside];
    
    _diaryButton = [self mainView].diaryButton;
    [_diaryButton addTarget:self action:@selector(diary) forControlEvents:UIControlEventTouchUpInside];
    
  self.myImages = [[NSMutableArray alloc]init];

}

- (MainView *)mainView {
    return (MainView *)self.view;
}

#pragma  mark - choose photo
- (void)takePhoto {
  if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
    UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                          message:@"Device has no camera"
                                                         delegate:nil
                                                cancelButtonTitle:@"OK"
                                                otherButtonTitles: nil];
    [myAlertView show];
    return;
  }
  UIImagePickerController *picker = [[UIImagePickerController alloc] init];
  picker.delegate = self;
  picker.allowsEditing = NO;
  picker.sourceType = UIImagePickerControllerSourceTypeCamera;
  [self presentViewController:picker animated:YES completion:NULL];
}

- (void)diary {
    CHTCollectionViewWaterfallLayout *layout = [[CHTCollectionViewWaterfallLayout alloc] init];
  CollectionViewController *collectionViewController = [[CollectionViewController alloc] initWithCollectionViewLayout:layout];
  [self.navigationController pushViewController:collectionViewController animated:YES];
}

- (void)selectPhoto {
  UIImagePickerController *picker = [[UIImagePickerController alloc] init];
  picker.delegate = self;
  picker.allowsEditing = NO;
  picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;

  [self presentViewController:picker animated:YES completion:NULL];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
  
  self.chosenImage = info[UIImagePickerControllerOriginalImage];
  [CollectionViewController setCapturedImages: self.chosenImage];
  [self mainView].imageView.image = self.chosenImage;
  
  [picker dismissViewControllerAnimated:YES completion:NULL];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
  [picker dismissViewControllerAnimated:YES completion:NULL];
}

@end
