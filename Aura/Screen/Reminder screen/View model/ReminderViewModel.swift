//
//  ReminderViewModel.swift
//  Aura
//
//  Created by Rafael Agayev on 02.01.26.
//

import Foundation
import SwiftUI
internal import Combine
import UserNotifications
import CoreData

@available(iOS 18.0, *)
class ReminderViewModel: ObservableObject{
    
    @AppStorage("reminder_enabled") var isEnabled: Bool =  false {
        didSet {
            if isEnabled {
                historyVM?.add(
                    type: "Reminder",
                    title: "Reminder enabled",
                    subtitle: "You will get daily notifications at \(reminderTime.formatted(date: .omitted, time: .shortened))"
                )
            } else {
                historyVM?.add(
                    type: "Reminder",
                    title: "Reminder disabled",
                    subtitle: "You won't get daily notifications"
                )
                disableReminder()
            }
        }
    }
    @AppStorage("reminder_time") var reminderTime: Date = Date()
    
    @AppStorage("reminder_repeat") var repeatDaily: Bool = true {
        didSet {
            historyVM?.add(
                type: "Reminder",
                title: "Repeat changed",
                subtitle: repeatDaily ? "Repeats daily" : "Repeats only once"
            )
        }
    }
    
    @Published var tempTime: Date = Date()
    
    private var historyVM: HistoryViewModel?
    
    init(historyVM: HistoryViewModel? = nil){
        self.historyVM = historyVM
    }
    
    func save(){
        guard isEnabled else { return }
        
        let content = UNMutableNotificationContent()
        content.title = "Health reminder"
        content.body = "Don't forget to check your health today  💕"
        content.sound = .default
        
        var date = Calendar.current.dateComponents(
            [.hour, .minute],
            from: reminderTime
        )
        
        let trigger = UNCalendarNotificationTrigger(
            dateMatching: date,
            repeats: repeatDaily
        )
        
        let id = "health_reminder"
        let request = UNNotificationRequest(
            identifier: id,
            content: content,
            trigger: trigger
        )
        
        UNUserNotificationCenter.current().add(request)
        
        historyVM?.add(
            type: "Reminder",
            title: "Health reminder",
            subtitle: "Time: \(reminderTime.formatted(date: .omitted, time: .shortened))")
    }
    
    func requestPermission(){
        UNUserNotificationCenter.current()
            .requestAuthorization(options: [.alert, .badge , .sound]) { granted, _  in
                DispatchQueue.main.async {
                    self.isEnabled = granted
                }
            }
    }
    
    func disableReminder(){
        UNUserNotificationCenter.current()
            .removePendingNotificationRequests(withIdentifiers:
                                            ["health_reminder"])
    }
}
