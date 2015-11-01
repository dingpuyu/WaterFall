//
//  ViewController.m
//  UICollectionView瀑布流尝试
//
//  Created by xiaotei on 15/8/26.
//  Copyright (c) 2015年 xiaotei. All rights reserved.
//

#import "ViewController.h"
#import "WaterFallContentView.h"


@interface ViewController ()
@property (nonatomic,strong)NSArray* picturesArray;
@end

@implementation ViewController

-(NSArray*)picturesArray{
    if (_picturesArray == nil) {
        NSString* picPath = [[NSBundle mainBundle]pathForResource:@"photos" ofType:@"plist"];
        _picturesArray = [NSArray arrayWithContentsOfFile:picPath];
    }
    
    return _picturesArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    WaterFallContentView* waterView = [WaterFallContentView waterFallContentView];
    
    waterView.picturesArray = self.picturesArray;
    
    [self.view addSubview:waterView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)prefersStatusBarHidden{
    return YES;
}

@end
