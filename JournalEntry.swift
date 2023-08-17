import Foundation

struct JournalEntry: Identifiable, Encodable {
    let id: UUID = UUID()
    let date: Date
    var text: String

    static func == (lhs: JournalEntry, rhs: JournalEntry) -> Bool {
        return lhs.id == rhs.id
    }

    // Encode the JournalEntry into a JSON representation
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(date, forKey: .date)
        try container.encode(text, forKey: .text)
    }

    enum CodingKeys: String, CodingKey {
        case id
        case date
        case text

        var hashValue: Int {
            return rawValue.hashValue
        }

        var rawValue: String {
            return self.name
        }
    }
}

class JournalDataStore {
    static let shared = JournalDataStore()

    private let userDefaultsKey = "SmartJournalEntries"

    func saveEntry(_ entry: JournalEntry) {
        var entries = fetchEntries()
        entries.append(entry)
        if let encoded = try? JSONEncoder().encode(entries) {
            UserDefaults.standard.set(encoded, forKey: userDefaultsKey)
        }
    }

    func fetchEntries() -> [JournalEntry] {
        if let data = UserDefaults.standard.data(forKey: userDefaultsKey),
           let entries = try? JSONDecoder().decode([JournalEntry].self, from: data) {
            return entries.sorted(by: { $0.date > $1.date })
        }
        return []
    }

    // Additional CRUD operations can be added as needed
} 
