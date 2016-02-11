
/**
 Given a value from a JSON hash, try to convert it to a string. Converts NSNulls to nil, calls `stringValue` on NSNumbers and `description` on CustomStringConvertibles
 */
func StringFromJSONValue(value: Any?) -> String? {
    guard let value = value else {
        return nil
    }

    if value is NSNull {
        return nil
    }

    if let string = value as? String {
        return string
    }

    if let number = value as? NSNumber {
        return number.stringValue
    }

    if let string = value as? CustomStringConvertible {
        return string.description
    }

    return nil
}