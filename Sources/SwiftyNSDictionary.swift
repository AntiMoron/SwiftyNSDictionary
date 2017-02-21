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

extension NSDictionary {
  func get<T>(_ key: String) -> T? {
    let ret: T? = getImpl_(flatten(self.object(forKey: key)))
    return ret
  }
  private func flatten(_ o: Any?) -> Any? {
    guard let o_ = o else { return nil }
    switch o_ {
    case let arr as [Any]:
      return arr.flatMap { flatten($0) }
    case let dict as [String: Any]:
      return dict.flatMap { ($0.0, flatten($0.1)) }
    default:
      return o_  
    }
  }
  
  func valueAsInt(forKey: String) -> Int? {
    return get(forKey)
  }
  func valueAsArray(forKey: String) -> [Any]? {
    return get(forKey)
  }
  func valueAsDouble(forKey: String) -> Double? {
    return get(forKey)
  }
  func valueAsBool(forKey: String) -> Bool? {
    return get(forKey)
  }
  func valueAsDictionary(forKey: String) -> [String: Any]? {
    return get(forKey)
  }
  func valueAsString(forKey: String) -> String? {
    return get(forKey)
  }
}

