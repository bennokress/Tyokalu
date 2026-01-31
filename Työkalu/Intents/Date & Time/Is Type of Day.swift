//
// 📄 Is Type of Day.swift
// 👨🏼‍💻 Author: Benno Kress
//

import AppIntents
import Foundation

struct IsTypeOfDayIntent: AppIntent {

    static var title: LocalizedStringResource = "Is Type of Day"
    static var description = IntentDescription("This action will return a Boolean value representing if the given date has the given type of day.", categoryName: "Date & Time", searchKeywords: ["monday", "tuesday", "wednesday", "thursday", "friday", "saturday", "sunday", "weekday", "weekend", "yesterday", "today", "tomorrow"])
    static var openAppWhenRun = false
    static var authenticationPolicy: IntentAuthenticationPolicy = .alwaysAllowed

    @Parameter(title: "Date")
    var date: Date

    @Parameter(title: "Type of Day", description: "The type of day you want to check for")
    var typeOfDay: TypeOfDay

    static var parameterSummary: some ParameterSummary {
        Switch(\.$typeOfDay) {
            Case(.weekend) {
                Summary("Is \(\.$date) on a \(\.$typeOfDay)?")
            }
            Case(.yesterday) {
                Summary("Was \(\.$date) \(\.$typeOfDay)?")
            }
            Case([.today, .tomorrow]) {
                Summary("Is \(\.$date) \(\.$typeOfDay)?")
            }
            DefaultCase {
                Summary("Is \(\.$date) a \(\.$typeOfDay)?")
            }
        }
    }

    func perform() async throws -> some ReturnsValue<Bool> {
        .result(value: isGivenTypeOfDay)
    }

    private var isGivenTypeOfDay: Bool {
        let result = isDateOfType(typeOfDay)
        logV("Checking if \(date.formatted(date: .long, time: .omitted)) \(typeOfDay.logDescription) -> \(result ? "Yes" : "No")", category: .intent)
        return result
    }

    private func isDateOfType(_ typeOfDay: TypeOfDay) -> Bool {
        let calendar = Calendar.current
        switch typeOfDay {
        case .friday, .monday, .saturday, .sunday, .thursday, .tuesday, .wednesday:
            return calendar.component(.weekday, from: date) == typeOfDay.weekdayIdentifier

        case .weekday:
            return !calendar.isDateInWeekend(date)

        case .weekend:
            return calendar.isDateInWeekend(date)

        case .yesterday:
            return calendar.isDateInYesterday(date)

        case .today:
            return calendar.isDateInToday(date)

        case .tomorrow:
            return calendar.isDateInTomorrow(date)
        }
    }

}

enum TypeOfDay: String, AppEnum, CustomStringConvertible {

    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
    case sunday
    case weekday
    case weekend
    case yesterday
    case today
    case tomorrow
    // TODO: Add Bavarian School Holiday
    // TODO: Add configurable "My birthday"

    static var typeDisplayRepresentation = TypeDisplayRepresentation(name: "Type of Day")

    static var caseDisplayRepresentations: [Self: DisplayRepresentation] = [
        .monday: DisplayRepresentation(title: "Monday"),
        .tuesday: DisplayRepresentation(title: "Tuesday"),
        .wednesday: DisplayRepresentation(title: "Wednesday"),
        .thursday: DisplayRepresentation(title: "Thursday"),
        .friday: DisplayRepresentation(title: "Friday"),
        .saturday: DisplayRepresentation(title: "Saturday"),
        .sunday: DisplayRepresentation(title: "Sunday"),
        .weekday: DisplayRepresentation(title: "Weekday"),
        .weekend: DisplayRepresentation(title: "Weekend"),
        .yesterday: DisplayRepresentation(title: "Yesterday"),
        .today: DisplayRepresentation(title: "Today"),
        .tomorrow: DisplayRepresentation(title: "Tomorrow")
    ]

    var description: String {
        switch self {
        case .monday: return "Monday"
        case .tuesday: return "Tuesday"
        case .wednesday: return "Wednesday"
        case .thursday: return "Thursday"
        case .friday: return "Friday"
        case .saturday: return "Saturday"
        case .sunday: return "Sunday"
        case .weekday: return "Weekday"
        case .weekend: return "Weekend"
        case .yesterday: return "Yesterday"
        case .today: return "Today"
        case .tomorrow: return "Tomorrow"
        }
    }

    var logDescription: String {
        switch self {
        case .monday: return "is a Monday"
        case .tuesday: return "is a Tuesday"
        case .wednesday: return "is a Wednesday"
        case .thursday: return "is a Thursday"
        case .friday: return "is a Friday"
        case .saturday: return "is a Saturday"
        case .sunday: return "is a Sunday"
        case .weekday: return "is a Weekday"
        case .weekend: return "is on a Weekend"
        case .yesterday: return "was Yesterday"
        case .today: return "is Today"
        case .tomorrow: return "is Tomorrow"
        }
    }

    /// This represents the numbers returned by the Calender Component weekday.
    var weekdayIdentifier: Int? {
        switch self {
        case .sunday: return 1
        case .monday: return 2
        case .tuesday: return 3
        case .wednesday: return 4
        case .thursday: return 5
        case .friday: return 6
        case .saturday: return 7
        default:
            return nil
        }
    }

}
