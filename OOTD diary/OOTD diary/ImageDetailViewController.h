//
//  ImageDetailViewController.h
//  OOTD diary
//
//  Created by Shirley Du on 2014-11-08.
//  Copyright (c) 2014 Shirley Du. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageDetailViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *imageDetail;
@property (strong, nonatomic) IBOutlet UILabel *detailLabel;

@property (strong, nonatomic) UIImage *image;
@property (strong, nonatomic) NSString *detail;

@end
