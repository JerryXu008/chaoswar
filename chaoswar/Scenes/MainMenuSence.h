//
//  MainMenuSence.h
//  Defend
//
//  Created by apple on 11-9-12.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "GamePubDef.h"

@interface MainMenuSence : CCLayer {
    CCSprite *bgImg;
    CCSprite *logoImg;
	CCMenuItemImage *btnHelp;
	CCMenuItemImage *btnPlay;
	CCMenuItemImage *btnCredits;
}

+(CCScene *) scene;

@end
