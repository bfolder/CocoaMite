## Readme

CocoaMite is an Objective-C wrapper around the [mite api](http://mite.yo.lk/en/api/index.html "mite api").
[mite](http://mite.yo.lk/en/ "mite") is "sleek time tracking for teams & freelancers". 

Compatibility: iOS 5+ / Mac OS X 10.7+

---
### Installation

Installing CocoaMite is pretty straight-forward if you have CocoaPods installed.

Step 1: Add the CocoaMite dependency to your podfile:

```Ruby
pod 'CocoaMite', :podspec => 'https://raw.github.com/bfolder/CocoaMite/master/CocoaMite.podspec'
```

Step 2: Include the header:

`#import "CocoaMite.h"`

Step 3: Initialize and setup the CocoaMite client:

```objc
CocoaMite *client = [[CocoaMite alloc] initWithApiKey: @"YOUR_KEY" subdomain: @"YOUR_SUBDOMAIN"];
```

If you happen to clone this repository, don't forget to update corresponding submodules.

### Problems?!

In order to run CocoaMite you need to activate api access inside your mite account settings. (More info [here](http://mite.yo.lk/en/api/basics.html "more info"))  

If you want to play with the example and tests, fill in your personal api key & subdomain (Tests: Define.h / Example: AppDelegate.m).

### Usage

As mentioned at the beginning, CocoaMite is just a wrapper around the public REST api. Take a look at the header file to get an idea of what the wrapper is capable of. Most of the comments are derived from the mite api documentation. 

### Todos (10/9/13)

* The included iOS example needs to be reworked (or rather 'extended').
* Mac example
* Further documentation

---
## Licensing

CocoaMite is licensed under MIT License. Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
