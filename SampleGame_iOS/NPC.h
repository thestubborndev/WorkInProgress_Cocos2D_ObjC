//
//  NPC.h
//  SampleGame
//
//  Created by Carlotta Tatti on 30/11/13.
//  Copyright (c) 2013 Carlotta Tatti. All rights reserved.
//

#import "cocos2d.h"
#import "Character.h"

@interface NPC : Character

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSArray *quests;

@end
