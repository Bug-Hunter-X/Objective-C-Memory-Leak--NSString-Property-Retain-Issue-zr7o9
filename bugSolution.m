To fix the memory leak, we need to ensure that the retain count of `myString` is correctly managed.  ARC (Automatic Reference Counting) is highly recommended in modern Objective-C development.  If you cannot use ARC, modify the code as follows:

```objectivec
@interface MyClass : NSObject
@property (nonatomic, retain) NSString *myString;
@end

@implementation MyClass
- (void)dealloc {
    [myString release];
    [super dealloc];
}
@end

// ... in some other method ...
MyClass *myObject = [[MyClass alloc] init];
myObject.myString = [NSString stringWithString: "Hello"]; // Use autorelease
[myObject release];
```

By using `[NSString stringWithString:"Hello"]`, we get an autoreleased string, eliminating the need to manually manage the extra retain.  Alternatively, and highly recommended, use ARC by enabling it in your Xcode project settings. ARC automatically handles retain counts for you, preventing these memory leaks.