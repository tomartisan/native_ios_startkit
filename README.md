## FastApp

> A starter kit for iOS developer which wrote by Swift and Objective-C

Use **FastApp** you can makes creating standard iOS app more simple.

FastApp is build on the mainstream frameworks and use **SnapKit** to auto layout.

### Build-in frameworks

- SnapKit
- Alamofire
- Kingfisher
- APNGKit
- SwiftyJSON
- MBProgressHUD(Objc version)

Some tools were built on top of the above libraries. Such as **FSAutolayoutor**, **FSServerCommunicator**, **MBProgressHUD+Show**, etc.

It's also provide many common ui components. That means you don’t need to develop from zero. Just rename project and your want to renamed...

## Usage

To run the example project, clone the repo, and run `carthage bootstrap` or `pod install` from the root directory first.

## Requirements

FastApp supports Swift5 and iOS 13.6+.

## Installation

Swift is default develop language. If you need Objc support, just change branch to **Objective-C**

```
git clone https://github.com/tangkunyin/FastApp.git
cd FastApp

# install all swift frameworks
carthage bootstrap
	
# add or update a single framework
carthage update Box

## or multiple frameworks
carthage update Box1 Box2
```


## Other things

In the earlier years, I have written a little useful shells. Such as [auto packaging tool](https://github.com/tangkunyin/Shellbox/blob/master/bin/ipaTool.sh)

If you want be more efficient in development. Just clone the repo [shellbox](https://github.com/tangkunyin/Shellbox)

## License

FastApp is available under the MIT license. See the [LICENSE](https://opensource.org/licenses/MIT) for more info.




