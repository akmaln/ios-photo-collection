//
//  ThemeHelper.swift
//  PhotoApp
//
//  Created by Akmal Nurmatov on 3/26/20.
//  Copyright © 2020 Akmal Nurmatov. All rights reserved.
//

import Foundation

extension String {
    static var themePreferenceKey = "ThemePreference"
}

class ThemeHelper {
    func setThemePreferenceToDark() {
        UserDefaults.standard.set("Dark",forKey: .themePreferenceKey)
    }

    func setThemePreferenceToYourColorHere() {
        UserDefaults.standard.set("Blue", forKey: .themePreferenceKey)
    }
    
    var themePreference: String? {
        guard let themePreference = UserDefaults.standard.string(forKey: .themePreferenceKey) else {return nil}
        
        return themePreference
    }
    
    init() {
        if themePreference == nil {
            setThemePreferenceToDark()
        }
    }
}




