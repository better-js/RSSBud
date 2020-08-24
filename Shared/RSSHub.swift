//
//  RSSHub.swift
//  RSSBud
//
//  Created by Cay Zhang on 2020/8/24.
//

import SwiftUI

enum RSSHub {
    static var defaultBaseURLString: String = "https://example.com"
}

extension RSSHub {
    @propertyWrapper struct BaseURL: DynamicProperty {
        @AppStorage("baseURLString", store: RSSBud.userDefaults) var string: String = RSSHub.defaultBaseURLString
        
        var wrappedValue: URLComponents {
            get {
                URLComponents(string: string)!
            }
        }
        
        func validate(string: String) -> Bool {
            URLComponents(string: string)?.host != nil
        }
    }
}
