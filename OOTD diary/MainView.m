#import "MainView.h"

static const CGFloat kPaddingTop = 20;

@implementation MainView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        _imageView = [[UIImageView alloc] init];
        _takePhotoButton = [[UIButton alloc] init];
        _selectPhotoButton = [[UIButton alloc] init];
        
        [self addSubview:_imageView];
        
        _takePhotoButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [_takePhotoButton setTitle:@"Take Photo" forState:UIControlStateNormal];
        [self addSubview:_takePhotoButton];
        
        _selectPhotoButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [_selectPhotoButton setTitle:@"Select Photo" forState:UIControlStateNormal];
        [self addSubview:_selectPhotoButton];
        
        _diaryButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [_diaryButton setTitle:@"Diary" forState:UIControlStateNormal];
        [self addSubview:_diaryButton];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGRect screen = [[UIScreen mainScreen] bounds];
    
    _imageView.frame = CGRectMake(0, 0, screen.size.width - 60, screen.size.height - 80);
    _imageView.center = CGPointMake(screen.size.width / 2, screen.size.height / 2);
    
    _takePhotoButton.frame = CGRectMake(0, 0, 100, 100);
    _takePhotoButton.center = CGPointMake(screen.size.width / 2, kPaddingTop + _imageView.frame.size.height + 10);
    
    _selectPhotoButton.frame = CGRectMake(0, 0, 100, 100);
    _selectPhotoButton.center = CGPointMake(screen.size.width / 2, kPaddingTop + _imageView.frame.size.height + 30);
    
    _diaryButton.frame = CGRectMake(screen.size.width - 120, _selectPhotoButton.frame.origin.y, 100, 100);
}

@end
