//
//  ViewController.h
//  myBlogger
//
//  Created by Saito Keisei on 6/7/15.
//  Copyright (c) 2015 keisei. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController

@property (strong) IBOutlet NSTextField *titleTextField;
@property (strong) IBOutlet NSTextField *categoryTextField;
@property (strong) IBOutlet NSTextField *articleIDTextField;

@property (strong) IBOutlet NSTextView *contentTextView;
@property (strong) IBOutlet NSTextField *pukeTextField;
- (IBAction)pukeButton:(NSButton *)sender;
- (IBAction)goButton:(NSButton *)sender;
- (IBAction)putButton:(NSButton *)sender;


@end