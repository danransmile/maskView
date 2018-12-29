//
//  ReportHotelSummaryMaskView.h
//
//  Created by lyq on 2018/12/28.
//  Copyright © 2018年 lyq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReportHotelSummaryMaskView : UIView

- (void)addRect:(CGRect)rect withRadius:(CGFloat)radius;

- (void)showMaskView;

- (void)dismissMaskView;

@end
