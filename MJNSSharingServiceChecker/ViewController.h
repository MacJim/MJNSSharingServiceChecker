//
//  ViewController.h
//  MJNSSharingServiceChecker
//
//  Created by Jim Macintosh Shi on 9/4/19.
//  Copyright © 2019 Creative Sub. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface ViewController : NSViewController <NSSharingServicePickerDelegate>


// MARK: - IB Outlets
@property (weak) IBOutlet NSScrollView *testInputField;
@property (weak) IBOutlet NSButton *shareButton;


// MARK: - IB Actions
- (IBAction)shareButtonPressed:(NSButton *)sender;


// MARK: - NSSharingServicePickerDelegate stuff
- (NSArray<NSSharingService *> *)sharingServicePicker:(NSSharingServicePicker *)sharingServicePicker sharingServicesForItems:(NSArray *)items proposedSharingServices:(NSArray<NSSharingService *> *)proposedServices;


@end

