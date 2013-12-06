//
//  StateManager.h
//  SampleGame
//
//  Created by Carlotta Tatti on 30/11/13.
//  Copyright (c) 2013 Carlotta Tatti. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StateManager : NSObject

+ (StateManager *)sharedInstance;

- (void)setMeta:(id)value forKey:(NSString *)key;
- (id)getMetaValueForKey:(id)key;

@end
