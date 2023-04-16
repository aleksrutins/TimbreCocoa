//
//  TimbreCocoa.m
//  TimbreCocoa
//
//  Created by Aleks Rutins on 4/16/23.
//

#import "TimbreCocoa.hh"

@interface TimbreView ()
@property Timbre::Cocoa::Timbre *instance;
@end

@implementation TimbreView
@synthesize instance;
- (id) initWithInstance:(Timbre::Cocoa::Timbre*)instance
{
    self = [super init];
    [self setInstance:instance];
    return self;
}
- (void)drawRect:(NSRect)dirtyRect
{
    auto widgets = [self instance]->widgets;
    for(auto widget = widgets.begin(); widget < widgets.end(); widget++) {
        (*widget)->draw([NSGraphicsContext currentContext], dirtyRect);
    }
}
@end

namespace Timbre::Cocoa {
    Timbre::Timbre(NSView *parent) {
        auto view = [[TimbreView alloc] initWithInstance:this];
        this->view = view;
        [parent addSubview:view];
    }
}
