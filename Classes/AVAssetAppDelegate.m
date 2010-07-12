//
//  AVAssetAppDelegate.m
//  AVAsset
//
//  Created by Tom Potter on 10/07/11.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "AVAssetAppDelegate.h"
#import "RootViewController.h"
#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>


@implementation AVAssetAppDelegate

@synthesize window;
@synthesize navigationController;


#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	
	
	MPMediaQuery *everything = [[MPMediaQuery alloc] init];
	
	NSLog(@"Logging items from a generic query...");
	NSArray *itemsFromGenericQuery = [everything items];
	for (MPMediaItem *song in itemsFromGenericQuery) {
		NSString *songTitle = [song valueForProperty: MPMediaItemPropertyTitle];
		NSURL *songURL = [song valueForProperty:MPMediaItemPropertyAssetURL];
		NSLog(@"Title: %@", songTitle);
		NSLog(@"URL: %@",   songURL);
		
		AVAudioPlayer *player = [[AVAudioPlayer alloc] initWithContentsOfURL:songURL error:nil];
		[player play];
		
		NSLog(@"Length: %i", [[[NSFileManager defaultManager] contentsAtPath:[songURL path]] length]);
		
		break;
	}
	
	// Override point for customization after app launch.  
	return YES;
}


- (void)applicationWillTerminate:(UIApplication *)application {
	// Save data if appropriate.
}


#pragma mark -
#pragma mark Memory management

- (void)dealloc {
	[navigationController release];
	[window release];
	[super dealloc];
}


@end

