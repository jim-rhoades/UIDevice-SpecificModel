# UIDevice+SpecificModel
A Swift extension for UIDevice that will enable you to:

Check for a specific device:
```swift
if UIDevice.current.specificModel == .iPhone5 {
	// do something
}
```

Get the human readable device name (like “iPhone 7”). For convenience, either of these will work:
```swift
print(UIDevice.current.specificModelName)
print(UIDevice.current.specificModel.name)
```

Get the identifier for the device (like "iPhone8,1”). For convenience, either of these will work:
```swift
print(UIDevice.current.specificModelIdentifier)
print(UIDevice.current.specificModel.identifier)
```

Note that if the specific model can't be determined - most likely because Apple released a new model not yet handled by the code - `specificModel.name` will instead return the device identifier.