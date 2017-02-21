# SwiftyNSDictionary

```SwiftyNSDictionary``` is a library that can help you convert values stored in a NSDictionary into non-objective-c types safely. 
As we all know that Objective C containers such as ```NSArray```,```NSDictionary``` cannot store built-in types.
Because of this the evil ```NSNull``` borns which causing lots of chaos. This library is to help fetch values safely without considering
Objective-C types.

## About

- It requires minimum swift version is ```3.0```.
- Issues are welcomed.

## Usage

We have functions that get values stored for a ```key: String```, and cast to types which are widely used safely.

All those functions are in the form of:
```
func valueAs${Type}(forKey: String) -> ${Type}?
```

Let's see how to use


```swift
import SwiftyNSDictionary

let dict: NSDictionary = ["1": [1,2,3,4,[5,6,7]],
                          "2": ["2.1":[1,2,3],
                                "2.2":2.2, 
                               ],
                          "3": NSNull()]
let x = dict.valueAsInt(forKey: "1")
let arr = dict.valueAsArray(forKey: "1")
let dic = dict.valueAsDictionary(forKey: "2")
```

## Install

Open your ```Package.swift``` file.
Add this to your ```depedencies``` array:

```swift
.Package(url: "https://github.com/AntiMoron/SwiftyNSDictionary.git",
                 versions: Version(1,0,0)..<Version(2,0,0))
```
## LICENSE

This project is licensed under the terms of the MIT license.