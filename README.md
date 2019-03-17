# Add associated values to NSAttributedString.Key cases

Currently, in order to use NSAttributedString APIs, we usually have codes like this one:

    let attributes:[NSAttributedString.Key:Any] = [
        .font : UIFont.systemFont(ofSize: 100),
    	.backgroundColor : UIColor.yellow,
    	.strokeWidth : -2,
        .strokeColor : UIColor.black,
        .foregroundColor : UIColor.red,
    ]
    let attrString = NSAttributedString(string: "A string", attributes: attributes)

We are using `Any` which is not cool since we know the expected value for each possible `NSAttributedString.Key`.

With enum and associated values in Swift, wouldn't make more sense to write the previous code like below?

    let attributes:[StringAttribute] = [
        .font(.systemFont(ofSize: 100)),
        .backgroundColor(.yellow),
        .strokeWidth(-2),
        .strokeColor(.black),
        .foregroundColor(.white)
    ]
    let attrString = NSAttributedString(string: "A string", attributes: attributes)

# Advantages
## Type Safety
The associated value will always have the expected value by that attribute. 

## Type Inference
We can leverage type inference to make the code smaller when using a static/class var/func.

## Testability
Apps that strongly rely on attributed strings to set its theme 

# Disadvantages
## Swift bridging overhead

The implementation can add some overhead to bridge the enum with this associated value
