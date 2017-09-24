//
//  ActionViewController.m
//  Our Action Extension
//
//  Created by swyx on 9/23/17.
//  Copyright © 2017 Facebook. All rights reserved.
//

#import "ActionViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import <React/RCTBundleURLProvider.h>
#import <React/RCTRootView.h>

@interface ActionViewController ()

@property(strong,nonatomic) IBOutlet UIImageView *imageView;

@end

ActionViewController * actionViewController = nil;

@implementation ActionViewController

- (void)loadView {
  NSURL *jsCodeLocation;
  
  jsCodeLocation = [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index.ios" fallbackResource:nil];
//  NSExtensionItem *item = self.extensionContext.inputItems.firstObject;
//  NSItemProvider *itemProvider = item.attachments.firstObject;
  NSItemProvider *itemProvider;
  [itemProvider loadItemForTypeIdentifier: (NSString *) kUTTypePropertyList
                                  options: 0
                        completionHandler: ^(id<NSSecureCoding> item, NSError *error) {
                          if (item != nil) {
                            NSDictionary *resultDict = (NSDictionary *) item;
                            NSDictionary *jsOutput = resultDict[NSExtensionJavaScriptPreprocessingResultsKey];
                            NSString *jsString = jsOutput[@"currentUrl"];
                            NSDictionary *initialProps = [NSDictionary dictionaryWithObjects:@[[NSNumber numberWithBool: TRUE], jsString] forKeys:@[@"isActionExtension",@"key2"]];
                            RCTRootView *rootView = [[RCTRootView alloc] initWithBundleURL:jsCodeLocation
                                                                                moduleName:@"ActionExtensionExample4"
                                                                         initialProperties:initialProps
                                                                             launchOptions:nil];
                            rootView.backgroundColor = [[UIColor alloc] initWithRed:1.0f green:1.0f blue:1.0f alpha:1];
                            self.view = rootView;
                            actionViewController = self;
                          }
                          
                        }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)done {
    // Return any edited content to the host app.
    // This template doesn't do anything, so we just echo the passed in items.
    [self.extensionContext completeRequestReturningItems:self.extensionContext.inputItems completionHandler:nil];
    actionViewController = nil;
}

@end
