//
//  MainMenuSence.m
//  Defend
//
//  Created by apple on 11-9-12.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "MainMenuSence.h"
#import "SelectSence.h"
#import "SceneManager.h"

@implementation MainMenuSence

+(CCScene *) scene
{
	CCScene *scene = [CCScene node];
	MainMenuSence *layer = [MainMenuSence node];
	[scene addChild: layer];
	return scene;
}

-(id) init
{
	if( (self=[super init])) {
        CGSize size = [[CCDirector sharedDirector] winSize];
        //加载背景图片
		bgImg = [CCSprite spriteWithFile:@"MainMenubg.png"];
		bgImg.position = CGPointMake(size.width /2 , size.height/2);
		bgImg.scale = 1;
		[self addChild:bgImg z:1];
        
        //加载开始按钮
		btnPlay = [[CCMenuItemImage alloc] initFromNormalImage:@"btnPlay.png" selectedImage:@"btnPlay.png" disabledImage:@"btnPlay.png" target:self selector:@selector(goToSelectSence:)];		
		CCMenu *btnPlayMenu = [CCMenu menuWithItems:btnPlay, nil];
		btnPlayMenu.position = CGPointMake(405 , 130);
		[self addChild:btnPlayMenu z:2];
		
		//加载开发团队介绍
		btnCredits = [[CCMenuItemImage alloc] initFromNormalImage:@"btnCredit.png" selectedImage:@"btnCredit.png" disabledImage:@"btnCredit.png" target:self selector:@selector(goToCreditsSence:)];		
		CCMenu *btnCreditsMenu = [CCMenu menuWithItems:btnCredits, nil];
		btnCreditsMenu.position = CGPointMake(405 , 30);
		[self addChild:btnCreditsMenu z:2];
        
        //加载帮助介绍
		btnHelp = [[CCMenuItemImage alloc] initFromNormalImage:@"btnHelp.png" selectedImage:@"btnHelp.png" disabledImage:@"btnHelp.png" target:self selector:@selector(goToHelpSence:)];		
        CCMenu *btnHelpMenu = [CCMenu menuWithItems:btnHelp, nil];
		btnHelpMenu.position = CGPointMake(405 , 80);
		[self addChild:btnHelpMenu z:2];
	}
	return self;
}

-(void) goToSelectSence:(id) sender 
{
    [[CCDirector sharedDirector] replaceScene: [SceneManager TransFadeUp:0.56f layer:[SelectSence node]]];
}

-(void) goToHelpSence:(id) sender 
{
    //[[CCDirector sharedDirector] replaceScene: [SceneManager TransFadeUp:0.6f layer:[LoadSence node]]];
}

-(void) goToCreditsSence:(id) sender 
{
    //[[CCDirector sharedDirector] replaceScene: [SceneManager TransFadeUp:0.6f layer:[CreditsSence node]]];
}

- (void) dealloc
{
	[super dealloc];
}

@end