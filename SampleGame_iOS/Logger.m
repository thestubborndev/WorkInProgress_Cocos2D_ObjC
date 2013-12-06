//
//  Logger.m
//  SampleGame
//
//  Created by Carlotta Tatti on 29/11/13.
//  Copyright (c) 2013 Carlotta Tatti. All rights reserved.
//

#import "Logger.h"

@implementation Logger

+ (Logger *)sharedInstance {
    static dispatch_once_t onceToken;
    static Logger *sharedInstance = nil;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[Logger alloc] init];
    });
    return sharedInstance;
}

/**
 * @param string The string to log
 * @param sender The class who called the method
 */
- (void)log:(NSString *)string sender:(id)sender {
    NSLog(@"[ %@ ] %@", [sender class], string);
}

@end
