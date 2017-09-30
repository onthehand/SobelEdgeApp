//
//  ImageProcessing.m
//  SobelEdgeApp
//
//  Created by Isao on 2016/06/25.
//  Copyright © 2016年 On The Hand. All rights reserved.
//

#import "SobelEdgeApp-Bridging-Header.h"

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import <opencv2/opencv.hpp>
#import <opencv2/imgcodecs/ios.h>

@implementation ImageProcessing: NSObject

+(UIImage *)SobelFilter:(UIImage *)image{
    
    //UIImageをcv::Matに変換
    cv::Mat mat;
    UIImageToMat(image, mat);
    
    //グレースケールに変換
    cv::Mat gray;
    cv::cvtColor(mat, gray, cv::COLOR_BGR2GRAY);
    
    // エッジ抽出
    cv::Mat edge;
    cv::Canny(gray, edge, 100, 200);
    
    //cv::Mat を UIImage に変換
    UIImage *result = MatToUIImage(edge);
    return result;
}
@end
