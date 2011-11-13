//
//  TDTowerFriendly.m
//  chaoswar
//
//  Created by Mac on 11-10-27.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "TDTowerFriendly.h"
#import "TDDefenceTower.h"
#import "GamePubDef.h"
#import "TDSprite.h"
#import "TDEnemy.h"

@implementation TDTowerFriendly

@synthesize tower = _tower;

- (void) setTower:(TDDefenceTower *)tower
{
    if (_tower) {
        if (self == _tower.friendly1) {
            _tower.friendly1 = nil;
        }
        if (self == _tower.friendly2) {
            _tower.friendly2 = nil;
        }
        if (self == _tower.friendly3) {
            _tower.friendly3 = nil;
        }
    }
    _tower = tower;
    if (_tower) {
        if (!_tower.friendly1) {
            _tower.friendly1 = self;
            return;
        }
        if (!_tower.friendly2) {
            _tower.friendly2 = self;
            return;
        }
        if (!_tower.friendly3) {
            _tower.friendly3 = self;
            return;
        }
    }
}

- (void) clearSpriteData
{
    [super clearSpriteData];
    //发射的防御塔清空
    self.tower = nil;
}

- (CCAnimation*) getAnimation:(int)level kind:(NSString*)kind
{
    CCSpriteFrameCache *cache = [CCSpriteFrameCache sharedSpriteFrameCache];
    NSMutableArray *animArray = [NSMutableArray array];
    CCSpriteFrame *frame = nil;
    int i = 1;
    do {
        frame = [cache spriteFrameByName:[NSString stringWithFormat:@"dtf%02d%@%04d.png", level, kind, i]];
        i++;
        if (frame != nil) {
            [animArray addObject:frame];
        }
    } while (frame != nil);
    return [CCAnimation animationWithFrames:animArray delay:0.05f];
}

@end

@implementation TDTowerFriendly1

+ (id) getSprite {
    TDTowerFriendly1 *friendly = [TDTowerFriendly1 spriteWithSpriteFrameName:@"dtf01mv0001.png"];
    if (friendly) {
        [friendly setScale:TDS_TFL1_SCALE];
        friendly.maxHP = TDS_TFL1_MAXHP;
        friendly.currentHP = TDS_TFL1_CURRENTHP;
        friendly.moveSpeed = TDS_TFL1_MOVESPEED;
        friendly.attacttime = TDS_TFL1_ATTACTTIME;
        friendly.attactRange = TDS_TFL1_ATTACTRANGE;     
        friendly.attact = TDS_TFL1_ATTACT;
        friendly.attactMode = TDS_TFL1_ATTACTMODE;
        friendly.defence = TDS_TFL1_DEFENCE;
        friendly.defenceMode = TDS_TFL1_DEFENCEMODE;
        friendly.searchRange = TDS_TFL1_SEARCHRANGE;
    }
    return friendly;
}

- (void) initAnimate
{
    [super initAnimate];
    int level = 1;
    self.movAni = [self getAnimation:level kind:@"mv"];
    self.ddAni = [self getAnimation:level kind:@"dd"];
    self.atAni = [self getAnimation:level kind:@"at"];
    [self.movAni setName:[NSString stringWithFormat:@"dtf%02dmv", level]];
    [self.ddAni setName:[NSString stringWithFormat:@"dtf%02ddd", level]];
    [self.atAni setName:[NSString stringWithFormat:@"dtf%02dat", level]];
    [self addAnimation:self.movAni];
    [self addAnimation:self.ddAni];
    [self addAnimation:self.atAni];
}

@end

@implementation TDTowerFriendly2

+ (id) getSprite {
    TDTowerFriendly2 *friendly = [TDTowerFriendly2 spriteWithSpriteFrameName:@"dtf02mv0001.png"];
    if (friendly) {
        [friendly setScale:TDS_TFL2_SCALE];
        friendly.maxHP = TDS_TFL2_MAXHP;
        friendly.currentHP = TDS_TFL2_CURRENTHP;
        friendly.moveSpeed = TDS_TFL2_MOVESPEED;
        friendly.attacttime = TDS_TFL2_ATTACTTIME;
        friendly.attactRange = TDS_TFL2_ATTACTRANGE;     
        friendly.attact = TDS_TFL2_ATTACT;
        friendly.attactMode = TDS_TFL2_ATTACTMODE;
        friendly.defence = TDS_TFL2_DEFENCE;
        friendly.defenceMode = TDS_TFL2_DEFENCEMODE;
        friendly.searchRange = TDS_TFL2_SEARCHRANGE;
    }
    return friendly;
}

- (void) initAnimate
{
    [super initAnimate];
    int level = 2;
    self.movAni = [self getAnimation:level kind:@"mv"];
    self.ddAni = [self getAnimation:level kind:@"dd"];
    self.atAni = [self getAnimation:level kind:@"at"];
    [self.movAni setName:[NSString stringWithFormat:@"dtf%02dmv", level]];
    [self.ddAni setName:[NSString stringWithFormat:@"dtf%02ddd", level]];
    [self.atAni setName:[NSString stringWithFormat:@"dtf%02dat", level]];
    [self addAnimation:self.movAni];
    [self addAnimation:self.ddAni];
    [self addAnimation:self.atAni];
}

@end

@implementation TDTowerFriendly3

+ (id) getSprite {
    TDTowerFriendly3 *friendly = [TDTowerFriendly3 spriteWithSpriteFrameName:@"dtf03mv0001.png"];
    if (friendly) {
        [friendly setScale:TDS_TFL3_SCALE];
        friendly.maxHP = TDS_TFL3_MAXHP;
        friendly.currentHP = TDS_TFL3_CURRENTHP;
        friendly.moveSpeed = TDS_TFL3_MOVESPEED;
        friendly.attacttime = TDS_TFL3_ATTACTTIME;
        friendly.attactRange = TDS_TFL3_ATTACTRANGE;     
        friendly.attact = TDS_TFL3_ATTACT;
        friendly.attactMode = TDS_TFL3_ATTACTMODE;
        friendly.defence = TDS_TFL3_DEFENCE;
        friendly.defenceMode = TDS_TFL3_DEFENCEMODE;
        friendly.searchRange = TDS_TFL3_SEARCHRANGE;
    }
    return friendly;
}

- (void) initAnimate
{
    [super initAnimate];
    int level = 3;
    self.movAni = [self getAnimation:level kind:@"mv"];
    self.ddAni = [self getAnimation:level kind:@"dd"];
    self.atAni = [self getAnimation:level kind:@"at"];
    [self.movAni setName:[NSString stringWithFormat:@"dtf%02dmv", level]];
    [self.ddAni setName:[NSString stringWithFormat:@"dtf%02ddd", level]];
    [self.atAni setName:[NSString stringWithFormat:@"dtf%02dat", level]];
    [self addAnimation:self.movAni];
    [self addAnimation:self.ddAni];
    [self addAnimation:self.atAni];
}

@end



