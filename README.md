# OneTwoThreeSDK

## Installation

#### Swift Package Manager

To integrate *OneTwoThreeSDK* using Swift Package Manager, you can easily add this to your Xcode project:

```swift
dependencies: [
    .package(url: "https://github.com/2C2P/OneTwoThreeSDK-iOS.git", .upToNextMajor(from: "1.0.0"))
]
```


#### Import

```swift
import OneTwoThreeSDK
```

## Usage

```swift
import OneTwoThreeSDK

class ViewController: UIViewController {

    let service = OneTwoThreeSDKService(
        checksumkey: "CHECKSUM_KEY",
        publicKey: "PUBLIC_KEY",
        privateKey: "PRIVATE_KEY",
        passphrase: "PASSPHASE"
    )
    
    let merchant = Merchant(
        id: "merchant@shopping.com",
        redirectURL: "onetwothreeapp://",
        notificationURL: "https://uat2.123.co.th/DemoShopping/apicallurl.aspx",
        merchantData: [
            MerchantData(key: "item", value: "943-cnht302gg"),
            MerchantData(key: "item", value: "FH403"),
            MerchantData(key: "item", value: "10,000.00"),
            MerchantData(key: "item", value: "Ref. 43, par. 7")
        ]
    )
    let transaction = Transaction(
        merchantReference: "309321249653",
        preferredAgent: "SCB",
        productDesc: "",
        amount: "100",
        currencyCode: "THB",
        paymentInfo: "",
        paymentExpiry: "2021-12-31 11:22:33"
    )
    let buyer = Buyer(
        email: "example@gmail.com",
        mobile: "09912345678",
        language: "EN",
        notifyBuyer: true,
        title: "Mr",
        firstName: "John",
        lastName: "Doe"
    )
    
    func startDeeplink() {
        service.startDeeplink(merchant: merchant, transaction: transaction, buyer: buyer) { response in
            // TODO: Success
            
            // NOTE: Redirect to bank app using 'deeplinkURL' from the response.
            if let deeplinkURL = response?.deeplinkURL, let url = URL(string: deeplinkURL) {
                UIApplication.shared.open(url) { (result) in
                    if result {
                        // TODO: Success
                    } else {
                        // TODO: Failed
                    }
                }
            }
            
        } failureBlock: { error in
            // TODO: Failed
        }
    }
        
}
```


## Contributing
2C2P

## License
[MIT](https://choosealicense.com/licenses/mit/)
