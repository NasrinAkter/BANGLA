//
//  AppDelegate_iPad.h
//  101-BanglaBook-BornoPath
//
//  Created by Huq Majharul on 10/3/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate_iPad : NSObject <UIApplicationDelegate> {
	
	UINavigationController	*navigationController;
    UIWindow *window;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

