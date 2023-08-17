import UserNotifications

class NotificationService {
    static let shared = NotificationService()

    func requestPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, _ in
            if granted {
                self.scheduleNotification()
            }
        }

    }

    func scheduleNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Time to write in your journal!"
        content.sound = .default

        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5 * 3600, repeats: true)

        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

        UNUserNotificationCenter.current().add(request)
    }
}
