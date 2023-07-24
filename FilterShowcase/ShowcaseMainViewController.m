//
//  ShowcaseMainViewController.m
//  FilterShowcase
//
//  Created by 陈春光 on 2017/8/2.
//  Copyright © 2017年 Cell Phone. All rights reserved.
//

#import <Masonry/Masonry.h>
#import "ShowcaseMainViewController.h"
#import "ShowcaseFilterListController.h"

@interface ShowcaseMainViewController ()

@property (nonatomic, strong) UIButton *usePictureBtn;
@property (nonatomic, strong) UIButton *usePhotosBtn;
@property (nonatomic, strong) UIButton *useCameraBtn;
@property (nonatomic, strong) ShowcaseFilterListController *filterListController;
@property (nonatomic, strong) UIImagePickerController *imagePickerController;

@end

@implementation ShowcaseMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.filterListController setInputImage:nil];
}

- (void)initUI {
    self.title = @"GPUImage Demo";
    [self.view addSubview:self.usePictureBtn];
    [self.view addSubview:self.usePhotosBtn];
    [self.view addSubview:self.useCameraBtn];
    
    [self.usePictureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(60);
        make.leading.equalTo(self.view).offset(50);
        make.trailing.equalTo(self.view).offset(-50);
        make.height.mas_equalTo(60);
    }];
    
    [self.usePhotosBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.usePictureBtn.mas_bottom).offset(60);
        make.leading.trailing.height.equalTo(self.usePictureBtn);
    }];
    
    [self.useCameraBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.usePhotosBtn.mas_bottom).offset(60);
        make.leading.trailing.height.equalTo(self.usePictureBtn);
    }];
}

- (UIButton *)usePictureBtn {
    if (!_usePictureBtn) {
        _usePictureBtn = [UIButton new];
        _usePictureBtn.backgroundColor = [UIColor greenColor];
        [_usePictureBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_usePictureBtn setTitle:@"Picture" forState:UIControlStateNormal];
        [_usePictureBtn addTarget:self
                           action:@selector(usePicture)
                 forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _usePictureBtn;
}

- (void)usePicture {
     UIImage *inputImage = [UIImage imageNamed:@"dog.jpg"];
    [self.filterListController setInputImage:inputImage];
    [self.navigationController pushViewController:self.filterListController animated:YES];
}

- (UIButton *)usePhotosBtn {
    if (!_usePhotosBtn) {
        _usePhotosBtn = [UIButton new];
        _usePhotosBtn.backgroundColor = [UIColor orangeColor];
        [_usePhotosBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_usePhotosBtn setTitle:@"Photos" forState:UIControlStateNormal];
        [_usePhotosBtn addTarget:self
                          action:@selector(usePhotos)
                forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _usePhotosBtn;
}

- (void)usePhotos {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.delegate = self;
    picker.allowsEditing = NO;
    [self presentViewController:picker animated:YES completion:nil];
}

- (UIButton *)useCameraBtn {
    if (!_useCameraBtn) {
        _useCameraBtn = [UIButton new];
        _useCameraBtn.backgroundColor = [UIColor purpleColor];
        [_useCameraBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_useCameraBtn setTitle:@"Camera" forState:UIControlStateNormal];
        [_useCameraBtn addTarget:self
                          action:@selector(useCamera)
                forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _useCameraBtn;
}

- (void)useCamera {
    [self.navigationController pushViewController:self.filterListController animated:YES];
}

- (ShowcaseFilterListController *)filterListController {
    if (!_filterListController) {
        _filterListController = [ShowcaseFilterListController new];
    }
    
    return _filterListController;
}

// MARK: UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController*)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    NSString *type = [info objectForKey:UIImagePickerControllerMediaType];
    UIImage* inputImage = nil;
    if ([type isEqualToString:@"public.image"]) {
        inputImage = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
        [picker dismissViewControllerAnimated:YES completion:nil];
    }
    
    if (inputImage) {
        [self.filterListController setInputImage:inputImage];
        [self.navigationController pushViewController:self.filterListController animated:YES];
    }
}


@end
