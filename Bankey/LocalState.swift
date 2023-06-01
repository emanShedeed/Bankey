//
//  LocalState.swift
//  Bankey
//
//  Created by Eman Shedeed on 01/06/2023.
//

import Foundation

public class LocalState{
    
    private enum Keys: String{
        case hasonboarder
    }
    
    private static let userDefaults = UserDefaults.standard
    
    public static var hasOnboarderd: Bool {
        get{
            userDefaults.bool(forKey: Keys.hasonboarder.rawValue )
        }
        set(newValue){
            userDefaults.set(newValue, forKey: Keys.hasonboarder.rawValue)
        }
    }
}
