//
//  NoteWindowController.h
//  pomodorable
//
//  Created by Kyle Kinkade on 2/28/12.
//  Copyright (c) 2012 Monocle Society LLC. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "ModelStore.h"
#import "ColorView.h"

@interface HistoryWindowController : NSWindowController
{
    IBOutlet NSScrollView   *scrollContentView;
    IBOutlet ColorView      *contentView;
    IBOutlet NSImageView    *imageView;
    IBOutlet NSButton       *clearButton;
    
    IBOutlet NSArrayController *arrayController;
    
    NSManagedObjectContext  *__weak _managedObjectContext;
}
@property (weak, nonatomic, readonly) NSManagedObjectContext  *managedObjectContext;

- (IBAction)clearTextSelected:(id)sender;
- (IBAction)close:(id)sender;
@end
