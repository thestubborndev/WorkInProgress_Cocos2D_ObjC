//
//  LevelTests.m
//  SampleGame
//
//  Created by Carlotta Tatti on 30/11/13.
//  Copyright (c) 2013 Carlotta Tatti. All rights reserved.
//

#import "Kiwi.h"
#import "Level.h"

SPEC_BEGIN(LevelTests)
describe(@"The Level", ^{
    context(@"when created", ^{
        NSDictionary *levelDict = @{@"mapName": @"darkforest.tmx"};
        Level *level = [[Level alloc] initWithDictionary:levelDict];
        it(@"is not nil", ^{
            [[level shouldNot] beNil];
        });
    });
});
SPEC_END
