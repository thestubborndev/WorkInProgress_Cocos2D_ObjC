//
//  QuestManager.m
//  SampleGame
//
//  Created by Carlotta Tatti on 29/11/13.
//  Copyright (c) 2013 Carlotta Tatti. All rights reserved.
//

#import "QuestManager.h"
#import "Quest.h"

@interface QuestManager ()
@property (strong, nonatomic) NSMutableArray *allQuests;
@property (strong, nonatomic) NSMutableArray *currentlyOpenedQuests;
@end

@implementation QuestManager

- (id)init {
    self = [super init];
    if (self) {
        NSString * path = [[NSBundle mainBundle] pathForResource:@"Quests" ofType:@"plist"];
        NSArray *questsArray = [NSArray arrayWithContentsOfFile:path];
        for (NSDictionary *questDict in questsArray) {
            Quest *aQuest = [[Quest alloc] initWithDictionary:questDict];
            [_allQuests addObject:aQuest];
            [[Logger sharedInstance] log:[NSString stringWithFormat:@"%@", aQuest] sender:self];
        }
    }
    return self;
}

+ (QuestManager *)sharedInstance {
    static dispatch_once_t onceToken;
    static QuestManager *sharedInstance = nil;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[QuestManager alloc] init];
    });
    return sharedInstance;
}

- (NSArray *)currentQuests {
    return _currentlyOpenedQuests;
}

@end
