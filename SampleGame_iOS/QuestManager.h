//
//  QuestManager.h
//  SampleGame
//
//  Created by Carlotta Tatti on 29/11/13.
//  Copyright (c) 2013 Carlotta Tatti. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QuestManager : NSObject

+ (QuestManager *)sharedInstance;

- (NSArray *)currentQuests;

@end
