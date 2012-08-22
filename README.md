#OPExtensionKit - categories up the whazoo

OPUIKit was built to collect all of those random categories/functions/macros we came across while building apps. 

##Highlights

`UIColor` : Tons of extra methods and macros... some our favorites:

* `+colorWithHue:saturation:lightness:alpha` (note: *lightness*, not *brightness*)
* `-lighten:`
* `-darken:`
* `-mix:`
* `$hex` macro: `$hex(0x87c442)`

`GCD`

* `dispatch_next_runloop` Dispatches a block onto the next loop of the current run loop.

`NSCache`

* `fetch::` You read that right. The second argument in this method is unnamed. This allows you to do cache retrieval/setting in the same statement with the syntax:

```obj-c
[cache fetch:@"key" :^id{
  return @"value"
}];
```

`NSDictionary`

* `stringForKey:`, `numberForKey:`, `arrayForKey:`, etc. for some basic type checking when retrieving values. Useful handling JSON from a web service.

`UIView`

* `-top`, `-bottom`, `-left`, etc. Makes view positioning much nicer:

```obj-c
view.top = label.bottom + 4.0f;
view.width = image.width;
```

##Installation

We love [CocoaPods](http://github.com/cocoapods/cocoapods), so we recommend you use it.

##Author

Brandon Williams  
brandon@opetopic.com  
[www.opetopic.com](http://www.opetopic.com)
