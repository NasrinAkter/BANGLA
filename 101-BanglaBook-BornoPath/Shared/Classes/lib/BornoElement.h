//
//  BornoElement.h
//  101-BanglaBook-BornoPath
//
//  Created by Huq Majharul on 10/3/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface BornoElement : NSObject {
	
	NSString	*bornoImageName;
	NSString	*bornoSoundName;
	CGRect		bornoFrame;
}

@property (nonatomic, retain) NSString      *bornoImageName;
@property (nonatomic, retain) NSString      *bornoSoundName;
@property (nonatomic, assign) CGRect		bornoFrame;

-(void)print;

@end
