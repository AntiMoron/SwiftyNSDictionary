// Author: AntiMoron
// Createtime: 2017-02-21

import Foundation
//MARK: swift 3
private func getImpl_<T>(_ o: Any?) -> T? {
  if let o_ = o as? T {
    return o_
  }
  return nil
}

public extension NSDictionary {
  private func get<T>(_ key: String) -> T? {
    let ret: T? = getImpl_(flatten(self.object(forKey: key)))
    return ret
  }
  private func flatten(_ o: Any?) -> Any? {
    guard let o_ = o else { return nil }
    switch o_ {
      case let nothing as NSNull:
        return nil
      case let num as NSNumber:
        return num.doubleValue
      case let str as NSString:
        return String(str)
      case let arr as [Any]:
        return arr.flatMap { flatten($0) }
      case let dict as [String: Any]:
        var ret = [String: Any]()
        _ = dict.flatMap { ret[$0.0] = flatten($0.1) }
        return ret
      default:
        return o_  
    }
  }
  
  public func valueAsInt(forKey: String) -> Int? {
    return get(forKey)
  }
  public func valueAsArray(forKey: String) -> [Any]? {
    return get(forKey)
  }
  public func valueAsDouble(forKey: String) -> Double? {
    return get(forKey)
  }
  public func valueAsBool(forKey: String) -> Bool? {
    return get(forKey)
  }
  public func valueAsDictionary(forKey: String) -> [String: Any]? {
    return get(forKey)
  }
  public func valueAsString(forKey: String) -> String? {
    return get(forKey)
  }
  public func valueAsAny(forKey: String) -> Any? {
    return get(forKey)
  }
}

