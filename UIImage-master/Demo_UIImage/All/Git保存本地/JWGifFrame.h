//
//  JWGifFrame.h
//  Gif
//
//  Created by 王木木 on 2018/3/7.
//  Copyright © 2018年 Mr.H. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface JWGifFrame : NSObject

@property (nonatomic,assign) NSUInteger index;

@property (nonatomic, assign) NSTimeInterval duration;

@property (nonatomic, strong) UIImage *image;

@end
