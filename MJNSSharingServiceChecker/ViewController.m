//
//  ViewController.m
//  MJNSSharingServiceChecker
//
//  Created by Jim Macintosh Shi on 9/4/19.
//  Copyright © 2019 Creative Sub. All rights reserved.
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


// MARK: - IB Actions
- (IBAction)shareButtonPressed:(NSButton *)sender {
    NSTextView* textView = [[self testInputField] documentView];
    NSString* testString = textView.string;
    
    NSSharingServicePicker* picker = [[NSSharingServicePicker alloc] initWithItems:@[testString]];
    [picker setDelegate:self];
    [picker showRelativeToRect:NSZeroRect ofView:sender preferredEdge:NSRectEdgeMinY];
}


// MARK: - NSSharingServicePickerDelegate stuff
- (NSArray<NSSharingService *> *)sharingServicePicker:(NSSharingServicePicker *)sharingServicePicker sharingServicesForItems:(NSArray *)items proposedSharingServices:(NSArray<NSSharingService *> *)proposedServices {
    
    NSMutableArray* returnValue = [proposedServices mutableCopy];
    
    // Add a "copy text" button.
    NSImage* systemCopyImage = [NSImage imageNamed:NSImageNameMultipleDocuments];
    if (systemCopyImage) {
        NSSharingService* copyTextService = [[NSSharingService alloc] initWithTitle:@"Copy Text" image:systemCopyImage alternateImage:systemCopyImage handler:^() {
            for (id anItem in items) {
                if ([anItem isKindOfClass:[NSString class]]) {
                    NSPasteboard* pasteboard = [NSPasteboard generalPasteboard];
                    [pasteboard declareTypes:@[NSPasteboardTypeString] owner:nil];
                    [pasteboard setString:anItem forType:NSPasteboardTypeString];
                    
                    break;
                }
            }
        }];
        
        [returnValue insertObject:copyTextService atIndex:0];    // You must insert to the first place for the share item to appear first.
    }
    
    return returnValue;
}


@end
