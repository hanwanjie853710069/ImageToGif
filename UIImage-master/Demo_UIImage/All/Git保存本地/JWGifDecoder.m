//
//  JWGifDecoder.m
//  Gif
//
//  Created by 王木木 on 2018/3/7.
//  Copyright © 2018年 Mr.H. All rights reserved.
//

#import "JWGifDecoder.h"
#import <UIKit/UIKit.h>
#import <ImageIO/ImageIO.h>

@interface JWGifDecoder ()
{
    CGImageSourceRef _source;
    
    NSUInteger _frameCount;
}
@end

@implementation JWGifDecoder

+(instancetype)decoderWithData:(NSData *)data
{
    if ( !data ) return nil;
    
    JWGifDecoder *decoder = [[JWGifDecoder alloc] init];
    [decoder _decoderPrepareWithData:data];
    return decoder;
}

- (void)dealloc
{
    CFRelease(_source);
}

-(void)_decoderPrepareWithData:(NSData *)data
{
    
    NSTimeInterval loopCount = 0;
    _data = data;
    _source = CGImageSourceCreateWithData((__bridge CFDataRef)data, NULL);
    _frameCount = CGImageSourceGetCount(_source);
    
    CFDictionaryRef properties = CGImageSourceCopyProperties(_source, NULL);
    CFDictionaryRef gifProperties = CFDictionaryGetValue(properties, kCGImagePropertyGIFDictionary);
    CFTypeRef loop = CFDictionaryGetValue(gifProperties, kCGImagePropertyGIFLoopCount);
    if (loop) CFNumberGetValue(loop, kCFNumberNSIntegerType, &loopCount);
    CFRelease(properties);
}

-(JWGifFrame *)frameAtIndex:(NSUInteger)index
{
    if ( index >= _frameCount ) return nil;
    
    JWGifFrame *gifframe = [[JWGifFrame alloc] init];
    
    gifframe.index = index;
    
    NSTimeInterval duration = 0;
    CFDictionaryRef frameProperties = CGImageSourceCopyPropertiesAtIndex(_source, index, NULL);
    CFDictionaryRef gifFrameProperties = CFDictionaryGetValue(frameProperties, kCGImagePropertyGIFDictionary);
    CFTypeRef delayTime = CFDictionaryGetValue(gifFrameProperties, kCGImagePropertyGIFUnclampedDelayTime);
    if(delayTime) CFNumberGetValue(delayTime, kCFNumberDoubleType, &duration);
    
    CFRelease(frameProperties);
    
    gifframe.duration = duration;
    
    CGImageRef cgImage = CGImageSourceCreateImageAtIndex(_source, index, NULL);
    
    UIImage *image = [UIImage imageWithCGImage:cgImage];
    
    gifframe.image = image;
    
    CFRelease(cgImage);
    
    return gifframe;
}

@end
