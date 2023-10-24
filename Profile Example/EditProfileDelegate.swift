//
//  EditProfileDelegateProt.swift
//  Profile Example
//
//  Created by XE on 24.10.2023.
//

import UIKit

protocol EditProfileDelegate: AnyObject {
    func userDidChange(firstname: String, lastname: String)

    func userDidResetInfo()
}
