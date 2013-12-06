//
//  Logger.h
//  SampleGame
//
//  Created by Carlotta Tatti on 29/11/13.
//  Copyright (c) 2013 Carlotta Tatti. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Logger : NSObject

+ (Logger *)sharedInstance;

- (void)log:(NSString *)string sender:(id)sender;

@end
