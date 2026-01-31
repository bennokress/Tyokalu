//
// 📄 Hour Check.swift
// 👨🏼‍💻 Author: Benno Kress
//

import AppIntents
import Foundation

struct IsHourInTimeFrameIntent: AppIntent {

    static var title: LocalizedStringResource = "Hour Check"
    static var description = IntentDescription("This action will return a Boolean value representing if the hour of the given date is inside the given time frame.", categoryName: "Date & Time", searchKeywords: ["morning", "afternoon", "evening", "night"])
    static var openAppWhenRun = false
    static var authenticationPolicy: IntentAuthenticationPolicy = .alwaysAllowed

    @Parameter(title: "Date")
    var date: Date

    @Parameter(title: "Earlier Hour", description: "The beginning of the time frame to check against (15 means at or after 15:00/3pm)")
    var lowerBound: Int

    @Parameter(title: "Later Hour", description: "The end of the time frame to check against (17 means before 17:00/5pm)")
    var upperBound: Int

    static var parameterSummary: some ParameterSummary {
        Summary("Is the hour of \(\.$date) between \(\.$lowerBound) and \(\.$upperBound)?")
    }

    func perform() async throws -> some ReturnsValue<Bool> {
        try .result(value: isInGivenTimeFrame())
    }

    private func isInGivenTimeFrame() throws -> Bool {
        try isDateInTimeFrame(between: lowerBound, and: upperBound)
    }

    private func isDateInTimeFrame(between lowerBound: Int, and upperBound: Int) throws -> Bool {
        guard lowerBound != upperBound else { throw IsInTimeFrameIntentError.boundsAreEqual }
        guard lowerBound >= 0, upperBound >= 0 else { throw IsInTimeFrameIntentError.boundIsTooLow }
        guard lowerBound <= 24, upperBound <= 24 else { throw IsInTimeFrameIntentError.boundIsTooHigh }

        // Switch technically correct, but mathematically unusable bounds
        let min = lowerBound == 24 ? 0 : lowerBound
        let max = upperBound == 0 ? 24 : upperBound

        let calendar = Calendar.current
        let isAfterLowerBound = calendar.component(.hour, from: date) >= min
        let isBeforeUpperBound = calendar.component(.hour, from: date) < max

        // lowerBound < upperBound means the bounds are on the same day and the hour has to be between them (9 - 17)
        // lowerBound > upperBound means the bounds are on following days and the hour has to be after the lowerBound on the first day or before the upperBound on the next day (22 - 6)
        let result = lowerBound < upperBound ? (isAfterLowerBound && isBeforeUpperBound) : (isAfterLowerBound || isBeforeUpperBound)

        logV("Checking if the hour of \(date.formatted(date: .omitted, time: .standard)) is between \(min):00 and \(max):00 -> \(result ? "Yes" : "No")", category: .intent)
        return result
    }

}

enum IsInTimeFrameIntentError: Error, CustomLocalizedStringResourceConvertible {

    case boundIsTooHigh
    case boundIsTooLow
    case boundsAreEqual

    var localizedStringResource: LocalizedStringResource {
        switch self {
        case .boundIsTooHigh: return "A day has 24 hours, so checking against hours higher than 24 is impossible"
        case .boundIsTooLow: return "A day has no negative hours, so checking against hours lower than 0 is impossible"
        case .boundsAreEqual: return "A Date can never be between two equal hours, please enter different numbers as earlier and later hours"
        }
    }

}
