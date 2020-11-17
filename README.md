# ARToaster


# Usage
Ex. 
# ARToaster

`ARToaster`  is display message on screen for some time.


## Display position 
- Top
- Center
- Bottom

## Display with status  
- success
- error
- warning
- normal

## Requirements

- iOS 11.0+
- Xcode 11.0+
- Swift 4.2+

## Usage

Firstly, download `ARToaster`.

```swift
add files in your project
```
By code, using initializer. 

```swift
let config = ARToasterConfigs(messageColor: .white, messageFont: UIFont.systemFont(ofSize: 12, weight: .regular),
                              messageAlignment: .center, backgrounColor: .black)
ARToaster(message: "Copyright © 2020 Rohit Makwana. All rights reserved.",
          duration: 5, position: .top,
          status: .success, config: config)
```
```
### Control

Set selection type
```swift
ARToasterConfigs 
```

### Change properties

- `messageColor` : display message default color ( UIColor.white )
- `messageFont`  : display message default font ( UIFont.systemFont(ofSize: 15) )
- `messageAlignment` :  Message Alignment default left ( NSTextAlignment.left )
- `backgrounColor` : View background color ( UIColor.black )
