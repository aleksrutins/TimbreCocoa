//
//  TimbreCocoa.h
//  TimbreCocoa
//
//  Created by Aleks Rutins on 4/16/23.
//
#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>
#import <vector>

@interface TimbreView : NSView
@end

namespace Timbre {
namespace Cocoa {
class Widget {
public:
    virtual void draw(NSGraphicsContext *ctx, CGRect rect) = 0;
};
class Timbre {
    TimbreView *view;
public:
    Timbre(NSView *parent);
    void add(Widget *child);
    void remove(Widget *child);
    std::vector<Widget *> widgets;
};
}
}
