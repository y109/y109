//
//  CamaraSnap.m
//  LoginFace
//
//  Created by YaoJungang on 13-6-13.
//  Copyright (c) 2013年 YaoJungang. All rights reserved.
//

#import "CamaraSnap.h"

@interface CamaraSnap ()

- (void)captureOutput:(QTCaptureOutput *)captureOutput
  didOutputVideoFrame:(CVImageBufferRef)videoFrame
     withSampleBuffer:(QTSampleBuffer *)sampleBuffer
       fromConnection:(QTCaptureConnection *)connection;

@end

@implementation CamaraSnap

// This delegate method is called whenever the QTCaptureDecompressedVideoOutput receives a frame
- (void)captureOutput:(QTCaptureOutput *)captureOutput
  didOutputVideoFrame:(CVImageBufferRef)videoFrame
     withSampleBuffer:(QTSampleBuffer *)sampleBuffer
       fromConnection:(QTCaptureConnection *)connection
{
    if (videoFrame == nil ) {
        return;
    }

    CVImageBufferRef imageBufferToRelease;
    CVBufferRetain(videoFrame);

    @synchronized(self){
        imageBufferToRelease = mCurrentImageBuffer;
        mCurrentImageBuffer = videoFrame;
    }
    CVBufferRelease(imageBufferToRelease);
}

/**
 获取系统默认摄像头
 */
- (QTCaptureDevice *) defaultVideoDevice {

    QTCaptureDevice *device = nil;

    device = [QTCaptureDevice defaultInputDeviceWithMediaType:QTMediaTypeVideo];
    if (device == nil) {
        device = [QTCaptureDevice defaultInputDeviceWithMediaType:QTMediaTypeMuxed];
    }

    return device;
}

- (NSImage *) snapshotFrom:(QTCaptureDevice *) device {

    NSError *error = nil;
    // start session
    mCaptureSession = [[QTCaptureSession alloc] init];
    [device open:&error];
    // create input object
    mCaptureDeviceInput = [[QTCaptureDeviceInput alloc] initWithDevice:device];
    [mCaptureSession addInput:mCaptureDeviceInput error:&error];
    // decompressed video output
    mCaptureDecompressedVideoOutput = [[QTCaptureDecompressedVideoOutput alloc] init];
    [mCaptureDecompressedVideoOutput setDelegate:self];
    [mCaptureSession addOutput:mCaptureDecompressedVideoOutput error:&error];

    [mCaptureSession startRunning];

    // taking snapshot
    CVImageBufferRef frame = nil;
    while( frame == nil ){                      // While waiting for a frame
        @synchronized(self){                    // Lock since capture is on another thread
            frame = mCurrentImageBuffer;        // Hold current frame
            CVBufferRetain(frame);              // Retain it (OK if nil)
        }

        if( frame == nil ){                     // Still no frame? Wait a little while.
            [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow: 0.1]];
        }

    }

    // Convert frame to an NSImage
    NSCIImageRep *imageRep = [NSCIImageRep imageRepWithCIImage:[CIImage imageWithCVImageBuffer:frame]];
    NSImage *image = [[[NSImage alloc] initWithSize:[imageRep size]] autorelease];
    [image addRepresentation:imageRep];

    // stop session
    [mCaptureSession stopRunning];
    if( [mCaptureSession isRunning] ){
        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow: 0.1]];
    }else {
        if( mCaptureSession )					[mCaptureSession release];
        if( mCaptureDeviceInput )				[mCaptureDeviceInput release];
        if( mCaptureDecompressedVideoOutput )	[mCaptureDecompressedVideoOutput release];

        mCaptureSession = nil;
        mCaptureDeviceInput = nil;
        mCaptureDecompressedVideoOutput = nil;
    }

    return image;
}

- (BOOL) saveImage: (NSImage *) image toPath: (NSString *) path {

    NSData *tiffData = [image TIFFRepresentation];

    NSBitmapImageFileType imageType = NSJPEGFileType;
    NSDictionary *imageProps = nil;

    imageType = NSJPEGFileType;
    imageProps = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:0.9] forKey:NSImageCompressionFactor];

    NSBitmapImageRep *imageRep = [NSBitmapImageRep imageRepWithData:tiffData];
    NSData *photoData = [imageRep representationUsingType:imageType properties:imageProps];

    return [photoData writeToFile:path atomically:NO];
}

@end
