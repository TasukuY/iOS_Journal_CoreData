//
//  EntryTableViewCell.swift
//  Journal_CoreData
//
//  Created by Tasuku Yamamoto on 4/18/22.
//

import UIKit

class EntryTableViewCell: UITableViewCell {

    //MARK: - IBOutlets
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var timestampLabel: UILabel!

    //MARK: - Methods
    func configure(entry: Entry){
        guard let timestamp = entry.timestamp else { return }
        titleLable.text = entry.title
        let format = DateFormatter()
        format.dateFormat = "MMM d, h:mm a"
        let timestampString = format.string(from: timestamp)
        timestampLabel.text = timestampString
    }
}
