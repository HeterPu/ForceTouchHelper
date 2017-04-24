//
//  Mydrawview.m
//  sad
//
//  Created by Peter Hu on 2017/4/24.
//  Copyright © 2017年 Peter Hu. All rights reserved.
//

#import "Mydrawview.h"

@implementation Mydrawview


- (void)drawRect:(CGRect)rect {

    CGContextRef ref = UIGraphicsGetCurrentContext();
//    CGContextSetRGBStrokeColor(ref, 0.5, 0.5, 0.5, 1.0);
    CGContextSetLineWidth(ref, 3.0); // 让线条变粗
    CGPoint points[] = { // 设置四个点画三条线让线连起来
        CGPointMake(10, 20),
        CGPointMake(50, 40),
        CGPointMake(70, 10),
        CGPointMake(50, 80),
    };
    CGContextAddLines(ref, points, sizeof(points) / sizeof(points[0]));
    CGFloat redColor[4] = {1.0, 0, 0, 1.0};
    CGContextSetFillColor(ref, redColor); // 填充颜色，这两句可使用[[UIColor redColor] setFill];
    CGContextDrawPath(ref, kCGPathFillStroke); // 画填充的图案
}


@end
