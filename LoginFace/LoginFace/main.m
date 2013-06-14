//
//  main.m
//  LoginFace
//
//  Created by YaoJungang on 13-6-13.
//  Copyright (c) 2013年 YaoJungang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CamaraSnap.h"


int processArguments(int argc, const char * argv[]);
void printUsage(int argc, const char * argv[]);

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        return processArguments(argc, argv);
    }

    return 0;
}


/**
 * Process command line arguments and execute program.
 */
int processArguments(int argc, const char * argv[] ) {

    NSString *filename = nil;
    QTCaptureDevice *device = nil;

    int i;
    for( i = 1; i < argc; ++i ){

        if (argv[i][0] == '-') {

            if( argv[i][1] == 0 ){
                filename = @"-";
            } else {

                switch (argv[i][1]) {

                    case '?':
                    case 'h':
                        printUsage( argc, argv );
                        return 0;
                        break;
                        // default:
                        // break;

                }
            }
        } else {
            filename = [NSString stringWithUTF8String:argv[i]];
        }
    }


    if( filename == nil ){
        
        NSString *path = [[NSString stringWithFormat:@"%@/Pictures", NSHomeDirectory()] stringByAppendingPathComponent:@"LoginFaces"];
        NSError *error;
        NSFileManager *fileManager = [NSFileManager defaultManager];
        if (![fileManager fileExistsAtPath:path]) {
            [fileManager createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:&error];
        }

        NSDateFormatter *dateFormater = [[NSDateFormatter alloc] init];
        [dateFormater setDateFormat:@"yyyy-MM-dd_HH-mm-ss"];
        NSDate *now = [[NSDate alloc] init];
        NSString *nowStr = [dateFormater stringFromDate:now];
        filename = [NSString stringWithFormat:@"%@/loginFace_%@.jpg", path, nowStr];
        [now release];
        [dateFormater release];
    }


    CamaraSnap *snap = [CamaraSnap new];
    device = [snap defaultVideoDevice];

    NSImage *image = [snap snapshotFrom:device];
    [snap saveImage:image toPath:filename];

    [snap release];

    return 0;
}

void printUsage(int argc, const char * argv[]){

    printf( "USAGE: %s [options] [filename]\n", argv[0] );
    printf( "Captures an image from a video device and saves it in a file.\n" );
    printf( "If no filename is specfied, {$HOME}/Pictures/LoginFaces/loginFace_{yyyy-MM-dd_HH-mm-ss}.jpg will be used.\n" );
    printf( "  -h          This help message\n" );
    printf( "\nhttp://y109.jzland.com\n");

}

