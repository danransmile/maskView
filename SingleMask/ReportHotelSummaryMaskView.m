//
//  ReportHotelSummaryMaskView.m
//  TuJiaMine
//
//  Created by lyq on 2018/12/28.
//  Copyright © 2018年 lyq. All rights reserved.
//

#import "ReportHotelSummaryMaskView.h"

@interface ReportHotelSummaryMaskView ()

@property (nonatomic, strong) CAShapeLayer *fullScreenLayer;
@property (nonatomic, strong) UIBezierPath *fullScreenPath;
@end

@implementation ReportHotelSummaryMaskView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        [self configLayerWithFrame:frame];
    }
    return self;
}

-(void)configLayerWithFrame:(CGRect)frame{
    self.fullScreenLayer = [CAShapeLayer layer];
    [self.layer addSublayer:self.fullScreenLayer];
    self.fullScreenLayer.frame = frame;
    self.fullScreenLayer.path = self.fullScreenPath.CGPath;
    self.fullScreenLayer.fillRule = kCAFillRuleEvenOdd;
    self.fullScreenLayer.fillColor = [UIColor colorWithRed:0.0/255 green:0.0/255 blue:0.0/255 alpha:0.7].CGColor;
    self.fullScreenPath = [UIBezierPath bezierPathWithRect:self.frame];
    [self.fullScreenPath setUsesEvenOddFillRule:YES];
}

- (void)addRect:(CGRect)rect withRadius:(CGFloat)radius{
    UIBezierPath *rectPath = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:radius];
    [self.fullScreenPath appendPath:rectPath];
    self.fullScreenLayer.path = self.fullScreenPath.CGPath;
    CGRect rect1 = CGRectMake(rect.origin.x - 3, rect.origin.y - 3, rect.size.width + 6, rect.size.height + 6);
    [self drawLineOfDashByCAShapeLayer:3 lineSpacing:2 lineColor:[UIColor whiteColor] rect:rect1];
}

/**
 *  通过 CAShapeLayer 方式绘制虚线
 *
 *  param lineLength:     虚线的宽度
 *  param lineSpacing:    虚线的间距
 *  param lineColor:      虚线的颜色
 **/
- (void)drawLineOfDashByCAShapeLayer:(NSInteger)lineLength lineSpacing:(NSInteger)lineSpacing lineColor:(UIColor *)lineColor rect:(CGRect)rect{
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.frame = self.frame;
    [shapeLayer setFillColor:[UIColor clearColor].CGColor];
    [shapeLayer setStrokeColor:lineColor.CGColor];
    [shapeLayer setLineWidth:1];
    [shapeLayer setLineJoin:kCALineJoinRound];
    [shapeLayer setLineDashPattern:[NSArray arrayWithObjects:[NSNumber numberWithInteger:lineLength], [NSNumber numberWithInteger:lineSpacing], nil]];
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, rect.origin.x, rect.origin.y);
    
    CGPathAddLineToPoint(path, NULL,rect.origin.x, rect.origin.y + rect.size.height);
    CGPathAddLineToPoint(path, NULL,rect.origin.x + rect.size.width, rect.origin.y + rect.size.height);
    CGPathAddLineToPoint(path, NULL,rect.origin.x + rect.size.width, rect.origin.y);
    CGPathAddLineToPoint(path, NULL, rect.origin.x, rect.origin.y);
    [shapeLayer setPath:path];
    CGPathRelease(path);
    [self.fullScreenLayer addSublayer:shapeLayer];
}

- (void)showMaskView{
    self.alpha = 0;
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha = 1;
    }];
}

- (void)dismissMaskView{
    __weak typeof(self)weakSelf = self;
    [UIView animateWithDuration:0.3 animations:^{
        weakSelf.alpha = 0;
    } completion:^(BOOL finished) {
        [weakSelf removeFromSuperview];
    }];
}


@end
