//
//  StateManager.m
//  SampleGame
//
//  Created by Carlotta Tatti on 30/11/13.
//  Copyright (c) 2013 Carlotta Tatti. All rights reserved.
//

#import "StateManager.h"

@implementation StateManager

+ (StateManager *)sharedInstance {
    static dispatch_once_t onceToken;
    static StateManager *sharedInstance = nil;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[StateManager alloc] init];
    });
    return sharedInstance;
}

- (void)setMeta:(id)value forKey:(NSString *)key
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:value forKey:key];
    [defaults synchronize];
}

- (id)getMetaValueForKey:(id)key
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults objectForKey:key];
}

@end
