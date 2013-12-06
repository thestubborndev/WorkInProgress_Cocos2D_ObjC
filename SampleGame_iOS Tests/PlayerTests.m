//
//  PlayerTests.m
//  SampleGame
//
//  Created by Carlotta Tatti on 28/11/13.
//  Copyright (c) 2013 Carlotta Tatti. All rights reserved.
//

#import "Kiwi.h"
#import "Player.h"

SPEC_BEGIN(PlayerTests)
describe(@"The player", ^{
    Player *player = [[Player alloc] init];
    context(@"when initialized", ^{
        it(@"has an empty inventory.", ^{
            [[[player inventory] should] beEmpty];
        });
    });
});
SPEC_END
