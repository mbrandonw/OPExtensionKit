#OPExtensionKit - categories up the whazoo

OPUIKit was built to collect all of those random categories/functions/macros we came across while building apps. 

##Highlights

`UIColor` : Tons of extra methods... some our favorites:

* `+colorWithHue:saturation:lightness:alpha`
* `-lighten:`
* `-darken:`
* `-mix:`

`OPCoalesce` : A macro that returns the first non-`nil` value in a variable number of arguments, i.e. 

    id obj1 = nil;
	id obj2 = @"foo";
	id obj3 = [NSObject new];
	OPCoalesce(obj1, obj2, obj3); // @"foo"

`OP_SYNTHESIZE_SINGLETON_FOR_CLASS` : A macro for properly making a class into a singleton using the `dispatch_once` function.

##Installation

We love [CocoaPods](http://github.com/cocoapods/cocoapods), so we recommend you use it.

##Demo

Checkout [OPKitDemo](http://www.opetopic.com) for a demo application using OPExtensionKit, among other things.

##Author

Brandon Williams  
brandon@opetopic.com  
[www.opetopic.com](http://www.opetopic.com)
