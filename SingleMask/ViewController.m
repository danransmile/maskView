//
//  ViewController.m
//  SingleMask
//
//  Created by lyq on 2018/12/28.
//  Copyright © 2016年 lyq. All rights reserved.
//

#import "ViewController.h"
#import "ReportHotelSummaryMaskView.h"
@interface ViewController ()
@property (nonatomic, strong) ReportHotelSummaryMaskView *maskSubView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.maskSubView = [[ReportHotelSummaryMaskView alloc]initWithFrame:self.view.frame];
    [self.view addSubview:self.maskSubView];
    [self.maskSubView addRect:CGRectMake(13, 200, self.view.frame.size.width - 13 * 2, 113) withRadius:6];
    
}



@end
