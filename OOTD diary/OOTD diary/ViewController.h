//
//  ViewController.h
//  OOTD diary
//
//  Created by Shirley Du on 2014-10-28.
//  Copyright (c) 2014 Shirley Du. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *imageView;
- (IBAction)takePhoto:(UIButton *)sender;
- (IBAction)selectPhoto:(UIButton *)sender;

@end

