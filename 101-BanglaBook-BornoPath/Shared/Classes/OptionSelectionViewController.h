//
//  OptionSelectionViewController.h
//  101-BanglaBook-BornoPath
//
//  Created by Huq Majharul on 10/3/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>
#import "SA_UIViewController.h"

@interface OptionSelectionViewController : SA_UIViewController {

	IBOutlet	UIActivityIndicatorView		*indicatorLoading;
	IBOutlet	UIButton					*buttonOptionType;
	SystemSoundID						optionSoundID;
}

@property(nonatomic) SystemSoundID	optionSoundID;

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil withBornoType:(NSString*)type;

-(IBAction)actionGotoBornoSikhi:(id)sender;
-(IBAction)actionGotoLekhaSikhi:(id)sender;
-(IBAction)actionGotoChobiDekheBoli:(id)sender;
-(IBAction)actionGotoBornoShuneMilai:(id)sender;

-(IBAction)actionGotoHome;

-(IBAction)actionBornoPress;

@end
