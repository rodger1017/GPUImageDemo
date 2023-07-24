//
//  ShowcasePictureViewController.h
//  FilterShowcase
//
//  Created by 陈春光 on 2017/8/2.
//  Copyright © 2017年 Cell Phone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShowcaseFilterViewController.h"

@interface ShowcasePictureViewController : UIViewController<GPUImageVideoCameraDelegate>

// Initialization and teardown
- (id)initWithFilterType:(GPUImageShowcaseFilterType)filterType inputImage:(UIImage *)inputImage;
- (void)willOutputSampleBuffer:(CMSampleBufferRef)sampleBuffer;
- (IBAction)updateFilterFromSlider:(id)sender;
- (void)GPUVCWillOutputFeatures:(NSArray*)featureArray forClap:(CGRect)clap
                 andOrientation:(UIDeviceOrientation)curDeviceOrientation;
- (IBAction)facesSwitched:(id)sender;


@end
