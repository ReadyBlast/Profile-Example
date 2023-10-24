//
//  ProfileViewController.swift
//  Profile Example
//
//  Created by XE on 23.10.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var surnameLabel: UILabel!
    
    var initName = ""
    var initSurame = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = initName
        surnameLabel.text = initSurame
        title = "Profile"
        // Do any additional setup after loading the view.
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        guard segue.identifier == "showProfilePreferences" else { return }
        guard let editingProfileVC = segue.destination as? EditingProfileViewController else { return }
        editingProfileVC.nameTFValue = nameLabel.text
        editingProfileVC.surnameTFValue = surnameLabel.text
        editingProfileVC.delegate = self
    }

}

extension ProfileViewController: EditProfileDelegate {
    func userDidChange(firstname: String, lastname: String) {
        nameLabel.text = firstname
        surnameLabel.text = lastname
    }
    
    func userDidResetInfo() {
        nameLabel.text = initName
        surnameLabel.text = initSurame
    }
}
