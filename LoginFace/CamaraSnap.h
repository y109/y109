//
//  CamaraSnap.h
//  LoginFace
//
//  Created by YaoJungang on 13-6-13.
//  Copyright (c) 2013年 YaoJungang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>
#import <QTKit/QTKit.h>

@interface CamaraSnap : NSObject {
    QTCaptureSession *mCaptureSession;
    QTCaptureDeviceInput *mCaptureDeviceInput;
    QTCaptureDecompressedVideoOutput *mCaptureDecompressedVideoOutput;
    CVImageBufferRef    mCurrentImageBuffer;
}

/**
 获取系统默认摄像头
 */
- (QTCaptureDevice *) defaultVideoDevice;

- (NSImage *) snapshotFrom:(QTCaptureDevice *) device;

- (BOOL) saveImage: (NSImage *) image toPath: (NSString *) path;

@end
