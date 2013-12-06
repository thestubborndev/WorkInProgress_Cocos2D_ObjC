//
//  Quest.h
//  SampleGame
//
//  Created by Carlotta Tatti on 29/11/13.
//  Copyright (c) 2013 Carlotta Tatti. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Quest : NSObject

@property (strong, nonatomic) NSString *questDescription;
@property (strong, nonatomic) NSDictionary *info;

@property (nonatomic) int amount;
@property (nonatomic) QuestActionType actionType;
@property (nonatomic) QuestObjectType objectType;
@property (nonatomic) QuestStatus questStatus;

- (id)initWithDictionary:(NSDictionary *)questDict;

@end