import Foundation

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
