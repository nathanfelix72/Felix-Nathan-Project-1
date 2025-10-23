//
//  SaveData.swift
//  Felix Nathan Project 1
//
//  Created by IS 543 on 10/21/25.
//

import Foundation

// I had chatGPT help me write this out since I wasn't quite how to do it, but I do understand it now, looking at how it compares to what we've done before
struct SaveData {
    
    // MARK: - Properties
    
    var model: OgniloudModel {
        didSet {
            save()
        }
    }
    
    // MARK: - Constants
    
    private enum Key {
        static let modelData = "OgniloudModelData"
    }
    
    // MARK: - Initialization
    
    init() {
        if let savedModel = Self.load() {
            self.model = savedModel
        } else {
            self.model = OgniloudModel(topics: spanishTopics)
        }
    }
    
    // MARK: - Persistence Methods
    
    private func save() {
        if let encoded = try? JSONEncoder().encode(model) {
            UserDefaults.standard.set(encoded, forKey: Key.modelData)
        }
    }
    
    private static func load() -> OgniloudModel? {
        guard let data = UserDefaults.standard.data(forKey: Key.modelData),
              let decoded = try? JSONDecoder().decode(OgniloudModel.self, from: data) else {
            return nil
        }
        return decoded
    }
    
    // MARK: - Reset
    
    mutating func resetToDefaults() {
        model = OgniloudModel(topics: spanishTopics)
    }
}
