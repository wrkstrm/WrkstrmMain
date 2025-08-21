import Foundation

/// Represents a selectable brokerage environment in the UI.
///
/// The tag name includes the first character of the associated account so that
/// multiple accounts can be distinguished when presented in a picker.
public struct BrokerageEnvironmentSelectionTag: Hashable {
    /// The available brokerage environments for Tradier.
    public enum Environment: String {
        case sandbox = "Tradier - Sandbox"
        case production = "Tradier - Prod"
    }

    /// Account identifier used to uniquely name the tag.
    public let account: String

    /// The environment this tag refers to.
    public let environment: Environment

    /// Creates a new tag for an account and environment.
    public init(account: String, environment: Environment) {
        self.account = account
        self.environment = environment
    }

    /// A human readable tag name that includes the first letter of the account
    /// followed by the environment name (e.g. "A: Tradier - Sandbox").
    public var name: String {
        let prefix = account.first.map { String($0).uppercased() } ?? ""
        return "\(prefix): \(environment.rawValue)"
    }
}
