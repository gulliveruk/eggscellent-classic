//
//  ShellController.m
//  Eggscellent
//
//  Created by Gulliver on 11/03/2016.
//  Copyright © 2016 Monocle Society LLC. All rights reserved.
//

#import "ShellController.h"
#import "ScriptManager.h"

@implementation ShellController

- (id)init
{
    if(self = [super init])
    {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(PomodoroXStarted:) name:EGG_START object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(PomodoroXTimeCompleted:) name:EGG_COMPLETE object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(PomodoroXStopped:) name:EGG_STOP object:nil];
    }
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver: self];
}

#pragma mark - NSNotifications

- (void)PomodoroXStarted:(NSNotification *)note
{
    EggTimer *pomo = (EggTimer *)[note object];
    if(pomo.type == TimerTypeEgg)
    {
        [self setFocus];
    }
}

- (void)PomodoroXTimeCompleted:(NSNotification *)note
{
    EggTimer *pomo = (EggTimer *)[note object];
    if(pomo.type == TimerTypeEgg)
    {
        [self setUnfocus];
    }
}

- (void)PomodoroXStopped:(NSNotification *)note
{
    EggTimer *pomo = (EggTimer *)[note object];
    if(pomo.type == TimerTypeEgg)
    {
        [self setUnfocus];
    }
}

#pragma mark - custom methods

- (void)setFocus;
{

    if([[NSUserDefaults standardUserDefaults] boolForKey:@"useStartCommand"])
    {
        NSString *startCommand = [[NSUserDefaults standardUserDefaults] stringForKey:@"startCommand"];
        system([startCommand UTF8String]);
    }
    
    
}

- (void)setUnfocus
{
    if([[NSUserDefaults standardUserDefaults] boolForKey:@"useEndCommand"])
    {
        NSString *endCommand = [[NSUserDefaults standardUserDefaults] stringForKey:@"endCommand"];
        system([endCommand UTF8String]);
    }
}

@end

