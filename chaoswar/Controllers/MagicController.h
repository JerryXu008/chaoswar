//
//  MagicController.h
//  chaoswar
//
//  Created by Swimming on 11-11-13.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SpritesImp.h"

@interface MagicC : NSObject {
    
}

@property float startTime;

- (void) run;

@end

@interface FireController : MagicC {
    
}

+ (FireController*) getFireController:(float)st pos:(CGPoint)pos;

@property CGPoint position;

@end

@interface FriendlyController : MagicC {
    
}

+ (FriendlyController*) getFriendlyController:(float)st pos:(CGPoint)pos;

@property CGPoint position;

@end

@interface ThunderController : MagicC {
    
}

@property (nonatomic, assign) TDEnemy *enemy;

@end

@interface StoneController : MagicC {
    
}

@property (nonatomic, assign) TDEnemy *enemy;

@end















@interface StopController : NSObject {
    CCSprite *magicSprite;
    TDUnit *unit;
}

- (void) doMagic:(TDUnit*)u;

@end

@interface SpeedController : NSObject {
    CCSprite *magicSprite;
    TDUnit *unit;
}

- (void) doMagic:(TDUnit*)u;

@end

@interface LifeController : NSObject {
    CCSprite *magicSprite;
    TDUnit *unit;
}

- (void) doMagic:(TDUnit*)u;

@end

@interface MagicController : NSObject {
    StopController *stopController;
    SpeedController *speedController;
    LifeController *lifeController;
}

@property (nonatomic, assign) TDUnit *unit;

- (void) doMagicStopStatus;

- (void) doMagicSpeedStatus;

- (void) doMagicLifeStatus;

@end
