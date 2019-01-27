//
//  UIPlaceHolderTextView.h
//  MonosView
//
//  Created by eQ on 1/17/14.
//  Copyright (c) 2014 eQ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface UIPlaceHolderTextView : UITextView

@property (nonatomic, retain) NSString *placeholder;
@property (nonatomic, retain) UIColor *placeholderColor;
@property (nonatomic, assign) NSUInteger type;

-(void)textChanged:(NSNotification*)notification;

@end
