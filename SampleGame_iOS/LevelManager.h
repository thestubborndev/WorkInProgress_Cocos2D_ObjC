//
//  LevelManager.h
//  SampleGame
//
//  Created by Carlotta Tatti on 28/11/13.
//  Copyright (c) 2013 Carlotta Tatti. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Level.h"

@interface LevelManager : NSObject

+ (LevelManager *)sharedInstance;

- (Level *)currentLevel;
- (void)loadNextLevel;
- (void)loadPreviousLevel;
- (void)loadLevelAtIndex:(NSUInteger)levelIndex;

@end
