![playbuzz logo](http://i68.tinypic.com/55o84j.png)

[![Version](https://img.shields.io/cocoapods/v/PlaybuzzSDK.svg)](http://cocoapods.org/pods/PlaybuzzSDK)
[![Support](https://img.shields.io/badge/contact-LudaFux-brightgreen.svg)](mailto:luda@playbuzz.com)
[![CI Status](http://img.shields.io/travis/Luda Fux/PlaybuzzSDK.svg)](https://travis-ci.org/Luda Fux/PlaybuzzSDK)
[![Swift 3 compatible](https://img.shields.io/badge/language-Swift-yellowgreen.svg)](https://developer.apple.com/swift)
![Platform iOS](https://img.shields.io/badge/platform-iOS-yellow.svg)
[![License: MIT](https://img.shields.io/badge/license-MIT-orange.svg)](https://github.com/orazz/CreditCardForm-iOS/blob/master/LICENSE)


## Get Started

The Playbuzz SDK enabled developers easily embed Playbuzz games in native apps.

## Prerequisites

- Xcode 8
- iOS 9.0+
- Installation of [CocoaPods](http://cocoapods.org)

## Example

- To check out example, download the repo, open PlaybuzzSDK.xcworkspace and run the project.

## Installation

 Add Playbuzz SDK using [CocoaPods](http://cocoapods.org) 

```
pod 'PlaybuzzSDK'
```

- Enable html loads
 Enable **Allow Arbitrary Loads** in **App Transport Security Settings** in your Info.plist
![plist](http://i68.tinypic.com/286wzet.png)

## Usage

Click the Main.storyboard tab. In the bottom-right corner, select a UIView element and drag it into your view controller. Then in the Custom Class section in the top-right corner, select the custom class PlaybuzzQuiz as the Class for this view.

![view](http://i66.tinypic.com/2vv464j.png)

Add constraints on the PlaybuzzSDK so it would properly fit your views

Adding a reference to your PlaybuzzQuiz in code
Open up the Assistant Editor by navigating to View > Assistant Editor > Show Assistant Editor. Make sure the ViewController.Swift file is showing in the Assistant Editor (the right pane of the screen). Next, holding the control key, click the PlaybuzzQuiz, and drag your cursor over to ViewController.Swift 

![referance](http://i66.tinypic.com/elbp8z.png)
![referance](http://i68.tinypic.com/210mwc5.png)

To resolve a compilation error, add **import PlaybuzzSDK** to ViewController.swift so the compiler knows that PlaybuzzQuiz is a valid class.

Load the quiz with your preferable configuration 

**ViewController.swift**

Finally, add code into ViewController.m or ViewController.swift that loads an ad into the banner view.

```Swift
import UIKit
import PlaybuzzSDK

class ViewController: UIViewController{
    
    //MARK: - IBOutlets
    @IBOutlet weak var playbuzzQuiz: PlaybuzzQuiz!
    
    //MARK: - Setup
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let itemAlias = "shpaltman/10-best-commercials-for-the-olympic-games-rio-2016"
        let companyDomain = "http://www.playbuzz.com"
        let userID = UIDevice.current.identifierForVendor!.uuidString
        
        playbuzzQuiz.reloadItem(userID,
                                itemAlias: itemAlias,
                                showRecommendations: true,
                                showShareButton: true,
                                showFacebookComments: true,
                                showItemInfo: true,
                                companyDomain: companyDomain)
    } 
}
```

- itemAlies - the url suffix of your item 
![url](http://i63.tinypic.com/1z35k7b.png)
- companyDomain - the domain configered for your compony 
- userID - uniq identifier for every device 

### Build and run the app
![finished](http://i65.tinypic.com/f4phya.png)

Congratulations, you've successfully made your first PlaybuzzQuiz!
## Author

Luda Fux, luda@playbuzz.com

## License

PlaybuzzSDK is available under the MIT license. See the LICENSE file for more info.
