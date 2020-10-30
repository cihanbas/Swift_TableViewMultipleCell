//
// Created by cihan bas on 29.10.2020.
//

import Foundation
import UIKit

enum ProfileViewModelItemType {
    case about
    case email
    case friend
}

protocol ProfileViewModelItem {
    var type: ProfileViewModelItemType { get }
    var rowCount: Int { get }
    var sectionTitle: String { get }
    
}

extension ProfileViewModelItem {
    var rowCount: Int {
        1
    }
}


class ProfileViewModelAbout: ProfileViewModelItem {
    var type: ProfileViewModelItemType {
        .about
    }
    
    var sectionTitle: String {
        "About US"
    }
    var about: String
    
    init(about: String) {
        self.about = about
    }
    
}

class ProfileVMEmail: ProfileViewModelItem {
    var type: ProfileViewModelItemType {
        .email
    }
    var sectionTitle: String {
        "E mail"
    }
    var email: String
    
    init(email: String) {
        self.email = email
    }
}

class ProfileVMFriends: ProfileViewModelItem {
    var type: ProfileViewModelItemType {
        .friend
    }
    var sectionTitle: String {
        "Friends"
    }
    var friends: [Friend]
    var rowCount: Int {self.friends.count}
    init(friends: [Friend]) {
        self.friends = friends
    }
}


class ProfileViewModel: NSObject {
    var items = [ProfileViewModelItem]()
    
    override init() {
        super.init()
        guard let data = dataFromFile("profileData"), let profile = Profile(data: data) else {
            return
        }
        if let about = profile.about {
            let aboutItem = ProfileViewModelAbout(about: about)
            items.append(aboutItem)
        }
        if let email = profile.email {
            let dobItem = ProfileVMEmail(email: email)
            items.append(dobItem)
        }
        let friends = profile.friends
               if !profile.friends.isEmpty {
                   let friendsItem = ProfileVMFriends(friends: friends)
                   items.append(friendsItem)
               }
        // we only need attributes item if attributes not empty
        
    }
}

extension ProfileViewModel: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.section]
        print(item.type)
        switch item.type {
        case .about:
            if let cell = tableView.dequeueReusableCell(withIdentifier: AboutCell.identifier, for: indexPath) as? AboutCell {
                cell.item = item
                return cell
            }
        case .email:
            if let cell = tableView.dequeueReusableCell(withIdentifier: EmailCell.identifier, for: indexPath) as? EmailCell {
                cell.item = item
                return cell
            }
        case .friend:
             if let item = item as? ProfileVMFriends, let cell = tableView.dequeueReusableCell(withIdentifier: FriendCell.identifier, for: indexPath) as? FriendCell {
                 let friend = item.friends[indexPath.row]
                 cell.item = friend
                 return cell
             }
        }
        
        let cell = UITableViewCell()
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items[section].rowCount
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return items[section].sectionTitle
    }
    
    
}
