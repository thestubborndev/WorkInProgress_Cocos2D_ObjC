//
//  QuestTests.m
//  SampleGame
//
//  Created by Carlotta Tatti on 29/11/13.
//  Copyright (c) 2013 Carlotta Tatti. All rights reserved.
//

#import "Kiwi.h"
#import "Quest.h"

SPEC_BEGIN(QuestTests)
describe(@"The Quest class", ^{
    context(@"when created", ^{
        NSDictionary *questDict = @{};
        Quest *quest = [[Quest alloc] initWithDictionary:questDict];
        it(@"is not nil", ^{
            [[quest shouldNot] beNil];
        });
    });
});
SPEC_END
