// Created by Jim Rhoades on 2/2/17.
//
// with help from various answers here:
// http://stackoverflow.com/q/26028918/234609

// usage:

// check for a specific device:
// if UIDevice.current.specificModel == .iPhone5 { ... }

// get the human readable device name
// for convenience, either of these will work:
// print(UIDevice.current.specificModelName)
// print(UIDevice.current.specificModel.name)

// get the identifer for the device (similar to "iPhone8,1")
// for convenience, either of these will work:
// print(UIDevice.current.specificModelIdentifier)
// print(UIDevice.current.specificModel.identifier)

// note that if the specific model can't be determined
// (because Apple released a new model not included here),
// specificModel.name will instead return the device identifier

import UIKit

public enum SpecificModel {
	case iPodTouch5
	case iPodTouch6
	case iPhone4
	case iPhone4s
	case iPhone5
	case iPhone5c
	case iPhone5s
	case iPhone6
	case iPhone6Plus
	case iPhone6s
	case iPhone6sPlus
	case iPhoneSE
	case iPhone7
	case iPhone7Plus
	case iPhone8
	case iPhone8Plus
	case iPhoneX
	case iPad2
	case iPad3
	case iPad4
	case iPad5
	case iPadAir
	case iPadAir2
	case iPadMini
	case iPadMini2
	case iPadMini3
	case iPadMini4
	case iPadPro9_7
	case iPadPro12_9
	case iPadPro10_5
	case iPadPro12_9_gen2
	case appleTV
	case appleTV4K
	case simulator
	case other
	
	var identifier: String {
		return deviceIdentifier()
	}
	
	var name: String {
		switch self {
		case .iPodTouch5:
			return "iPod Touch (5th gen.)"
		case .iPodTouch6:
			return "iPod Touch (6th gen.)"
		case .iPhone4:
			return "iPhone 4"
		case .iPhone4s:
			return "iPhone 4S"
		case .iPhone5:
			return "iPhone 5"
		case .iPhone5c:
			return "iPhone 5c"
		case .iPhone5s:
			return "iPhone 5s"
		case .iPhone6:
			return "iPhone 6"
		case .iPhone6Plus:
			return "iPhone 6 Plus"
		case .iPhone6s:
			return "iPhone 6s"
		case .iPhone6sPlus:
			return "iPhone 6s Plus"
		case .iPhoneSE:
			return "iPhone SE"
		case .iPhone7:
			return "iPhone 7"
		case .iPhone7Plus:
			return "iPhone 7 Plus"
		case .iPhone8:
			return "iPhone 8"
		case .iPhone8Plus:
			return "iPhone 8 Plus"
		case .iPhoneX:
			return "iPhone X"
		case .iPad2:
			return "iPad 2"
		case .iPad3:
			return "iPad 3"
		case .iPad4:
			return "iPad 4"
		case .iPad5:
			return "iPad 5"
		case .iPadAir:
			return "iPad Air"
		case .iPadAir2:
			return "iPad Air 2"
		case .iPadMini:
			return "iPad Mini"
		case .iPadMini2:
			return "iPad Mini 2"
		case .iPadMini3:
			return "iPad Mini 3"
		case .iPadMini4:
			return "iPad Mini 4"
		case .iPadPro9_7:
			return "iPad Pro (9.7\")"
		case .iPadPro12_9:
			return "iPad Pro (12.9\")"
		case .iPadPro10_5:
			return "iPad Pro (10.5\")"
		case .iPadPro12_9_gen2:
			return "iPad Pro (12.9\", 2nd gen.)"
		case .appleTV:
			return "Apple TV"
		case .appleTV4K:
			return "Apple TV 4K"
		case .simulator:
			return "Simulator"
		case .other:
			// return the identifier string since we don't know the actual model name
			return identifier
		}
	}
}

public extension UIDevice {
	var specificModel: SpecificModel {
		let identifier = deviceIdentifier()
		switch identifier {
		case "iPod5,1":
			return .iPodTouch5
		case "iPod7,1":
			return .iPodTouch6
		case "iPhone3,1", "iPhone3,2", "iPhone3,3":
			return .iPhone4
		case "iPhone4,1":
			return .iPhone4s
		case "iPhone5,1", "iPhone5,2":
			return .iPhone5
		case "iPhone5,3", "iPhone5,4":
			return .iPhone5c
		case "iPhone6,1", "iPhone6,2":
			return .iPhone5s
		case "iPhone7,2":
			return .iPhone6
		case "iPhone7,1":
			return .iPhone6Plus
		case "iPhone8,1":
			return .iPhone6s
		case "iPhone8,2":
			return .iPhone6sPlus
		case "iPhone8,4":
			return .iPhoneSE
		case "iPhone9,1", "iPhone9,3":
			return .iPhone7
		case "iPhone9,2", "iPhone9,4":
			return .iPhone7Plus
		case "iPhone10,1", "iPhone10,4":
			return .iPhone8
		case "iPhone10,2", "iPhone10,5":
			return .iPhone8Plus
		case "iPhone10,3", "iPhone10,6":
			return .iPhoneX
		case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4":
			return .iPad2
		case "iPad3,1", "iPad3,2", "iPad3,3":
			return .iPad3
		case "iPad3,4", "iPad3,5", "iPad3,6":
			return .iPad4
		case "iPad6,11", "iPad6,12":
			return .iPad5
		case "iPad4,1", "iPad4,2", "iPad4,3":
			return .iPadAir
		case "iPad5,3", "iPad5,4":
			return .iPadAir2
		case "iPad2,5", "iPad2,6", "iPad2,7":
			return .iPadMini
		case "iPad4,4", "iPad4,5", "iPad4,6":
			return .iPadMini2
		case "iPad4,7", "iPad4,8", "iPad4,9":
			return .iPadMini3
		case "iPad5,1", "iPad5,2":
			return .iPadMini4
		case "iPad6,3", "iPad6,4":
			return .iPadPro9_7
		case "iPad6,7", "iPad6,8":
			return .iPadPro12_9
		case "iPad7,3", "iPad7,4":
			return .iPadPro10_5
		case "iPad7,1", "iPad7.2":
			return .iPadPro12_9_gen2
		case "AppleTV5,3":
			return .appleTV
		case "AppleTV6,2":
			return .appleTV4K
		case "i386", "x86_64":
			return .simulator
		default:
			return .other
		}
	}
	
	var specificModelName: String {
		return self.specificModel.name
	}
	
	var specificModelIdentifier: String {
		return deviceIdentifier()
	}
}

fileprivate func deviceIdentifier() -> String {
	var systemInfo = utsname()
	uname(&systemInfo)
	let machineMirror = Mirror(reflecting: systemInfo.machine)
	let identifier = machineMirror.children.reduce("") { identifier, element in
		guard let value = element.value as? Int8 , value != 0 else { return identifier }
		return identifier + String(UnicodeScalar(UInt8(value)))
	}
	return identifier
}
