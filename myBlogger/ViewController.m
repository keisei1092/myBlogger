//
//  ViewController.m
//  myBlogger
//
//  Created by Saito Keisei on 6/7/15.
//  Copyright (c) 2015 keisei. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (IBAction)pukeButton:(NSButton *)sender {
    NSString *post = [NSString stringWithFormat:@"{\"content\":\"%@\"}", [_pukeTextField stringValue]];
    NSData *postData = [post dataUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"\nSending data:\n%@", [[NSString alloc] initWithData:postData encoding:NSUTF8StringEncoding]);
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:@"http://inside.miraitoarumachi.com/tweets.json"]];
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
    NSLog(@"%@", [request allHTTPHeaderFields]);
    NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    if(conn) {
        NSLog(@"Puke Successful");
        _pukeTextField.stringValue = @"";
    } else {
        NSLog(@"Puke could not be made");
    }
}

- (IBAction)goButton:(NSButton *)sender {
    NSLog(@"\nTitle: %@\nCategory: %@\nContent: %@",
          [_titleTextField stringValue],
          [_categoryTextField stringValue],
          [_contentTextView string]);
    NSString *post = [NSString stringWithFormat:@"{\"title\":\"%@\",\"category\":\"%@\",\"content\":\"%@\"}",
                      [_titleTextField stringValue], [_categoryTextField stringValue], [_contentTextView string]];
    post = [post stringByReplacingOccurrencesOfString:@"\n" withString:@"\\n"];
    NSData *postData = [post dataUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"\nSending data:\n%@", [[NSString alloc] initWithData:postData encoding:NSUTF8StringEncoding]);
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:@"http://inside.miraitoarumachi.com/articles.json"]];
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
    NSLog(@"%@", [request allHTTPHeaderFields]);
    NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    if(conn) {
        NSLog(@"Submit Successful");
    } else {
        NSLog(@"Submit could not be made");
    }
}

- (IBAction)putButton:(NSButton *)sender {
    NSLog(@"\nTitle: %@\nCategory: %@\nContent: %@",
          [_titleTextField stringValue],
          [_categoryTextField stringValue],
          [_contentTextView string]);
    NSString *post = [NSString stringWithFormat:@"{\"title\":\"%@\",\"category\":\"%@\",\"content\":\"%@\"}",
                      [_titleTextField stringValue], [_categoryTextField stringValue], [_contentTextView string]];
    post = [post stringByReplacingOccurrencesOfString:@"\n" withString:@"\\n"];
    NSData *postData = [post dataUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"\nSending data:\n%@", [[NSString alloc] initWithData:postData encoding:NSUTF8StringEncoding]);
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:[[NSString alloc] initWithFormat:@"http://inside.miraitoarumachi.com/articles/%@.json", [_articleIDTextField stringValue]]]];
    [request setHTTPMethod:@"PUT"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
    NSLog(@"%@", [request allHTTPHeaderFields]);
    NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    if(conn) {
        NSLog(@"Submit Successful");
    } else {
        NSLog(@"Submit could not be made");
    }
}
@end
