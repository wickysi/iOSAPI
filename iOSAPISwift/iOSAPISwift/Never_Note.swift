//
//  Never_Note.swift
//  iOSAPISwift
//
//  Created by user on 10/30/21.
//

import Foundation

/// The return type of functions that do not return normally, that is, a type
/// with no values.
///
/// Use `Never` as the return type when declaring a closure, function, or
/// method that unconditionally throws an error, traps, or otherwise does
/// not terminate.
///
///     func crashAndBurn() -> Never {
///         fatalError("Something very, very bad happened")
///     }
@frozen public enum Never {

    /// Returns a closed range that contains both of its bounds.
    ///
    /// Use the closed range operator (`...`) to create a closed range of any type
    /// that conforms to the `Comparable` protocol. This example creates a
    /// `ClosedRange<Character>` from "a" up to, and including, "z".
    ///
    ///     let lowercase = "a"..."z"
    ///     print(lowercase.contains("z"))
    ///     // Prints "true"
    ///
    /// - Parameters:
    ///   - minimum: The lower bound for the range.
    ///   - maximum: The upper bound for the range.
    ///
    /// - Precondition: `minimum <= maximum`.
    public static func ... (minimum: Never, maximum: Never) -> ClosedRange<Never>

    /// Returns a Boolean value indicating whether the value of the first argument
    /// is greater than that of the second argument.
    ///
    /// This is the default implementation of the greater-than operator (`>`) for
    /// any type that conforms to `Comparable`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    @inlinable public static func > (lhs: Never, rhs: Never) -> Bool

    /// Returns a Boolean value indicating whether the value of the first argument
    /// is less than or equal to that of the second argument.
    ///
    /// This is the default implementation of the less-than-or-equal-to
    /// operator (`<=`) for any type that conforms to `Comparable`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    @inlinable public static func <= (lhs: Never, rhs: Never) -> Bool

    /// Returns a Boolean value indicating whether the value of the first argument
    /// is greater than or equal to that of the second argument.
    ///
    /// This is the default implementation of the greater-than-or-equal-to operator
    /// (`>=`) for any type that conforms to `Comparable`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    /// - Returns: `true` if `lhs` is greater than or equal to `rhs`; otherwise,
    ///   `false`.
    @inlinable public static func >= (lhs: Never, rhs: Never) -> Bool

    public static func != (lhs: Never, rhs: Never) -> Bool

    /// Returns a half-open range that contains its lower bound but not its upper
    /// bound.
    ///
    /// Use the half-open range operator (`..<`) to create a range of any type
    /// that conforms to the `Comparable` protocol. This example creates a
    /// `Range<Double>` from zero up to, but not including, 5.0.
    ///
    ///     let lessThanFive = 0.0..<5.0
    ///     print(lessThanFive.contains(3.14))  // Prints "true"
    ///     print(lessThanFive.contains(5.0))   // Prints "false"
    ///
    /// - Parameters:
    ///   - minimum: The lower bound for the range.
    ///   - maximum: The upper bound for the range.
    ///
    /// - Precondition: `minimum <= maximum`.
    public static func ..< (minimum: Never, maximum: Never) -> Range<Never>

    /// Returns a partial range up to, but not including, its upper bound.
    ///
    /// Use the prefix half-open range operator (prefix `..<`) to create a
    /// partial range of any type that conforms to the `Comparable` protocol.
    /// This example creates a `PartialRangeUpTo<Double>` instance that includes
    /// any value less than `5.0`.
    ///
    ///     let upToFive = ..<5.0
    ///
    ///     upToFive.contains(3.14)       // true
    ///     upToFive.contains(6.28)       // false
    ///     upToFive.contains(5.0)        // false
    ///
    /// You can use this type of partial range of a collection's indices to
    /// represent the range from the start of the collection up to, but not
    /// including, the partial range's upper bound.
    ///
    ///     let numbers = [10, 20, 30, 40, 50, 60, 70]
    ///     print(numbers[..<3])
    ///     // Prints "[10, 20, 30]"
    ///
    /// - Parameter maximum: The upper bound for the range.
    ///
    /// - Precondition: `maximum` must compare equal to itself (i.e. cannot be NaN).
    prefix public static func ..< (maximum: Never) -> PartialRangeUpTo<Never>

    /// Returns a partial range up to, and including, its upper bound.
    ///
    /// Use the prefix closed range operator (prefix `...`) to create a partial
    /// range of any type that conforms to the `Comparable` protocol. This
    /// example creates a `PartialRangeThrough<Double>` instance that includes
    /// any value less than or equal to `5.0`.
    ///
    ///     let throughFive = ...5.0
    ///
    ///     throughFive.contains(4.0)     // true
    ///     throughFive.contains(5.0)     // true
    ///     throughFive.contains(6.0)     // false
    ///
    /// You can use this type of partial range of a collection's indices to
    /// represent the range from the start of the collection up to, and
    /// including, the partial range's upper bound.
    ///
    ///     let numbers = [10, 20, 30, 40, 50, 60, 70]
    ///     print(numbers[...3])
    ///     // Prints "[10, 20, 30, 40]"
    ///
    /// - Parameter maximum: The upper bound for the range.
    ///
    /// - Precondition: `maximum` must compare equal to itself (i.e. cannot be NaN).
    prefix public static func ... (maximum: Never) -> PartialRangeThrough<Never>

    /// Returns a partial range extending upward from a lower bound.
    ///
    /// Use the postfix range operator (postfix `...`) to create a partial range
    /// of any type that conforms to the `Comparable` protocol. This example
    /// creates a `PartialRangeFrom<Double>` instance that includes any value
    /// greater than or equal to `5.0`.
    ///
    ///     let atLeastFive = 5.0...
    ///
    ///     atLeastFive.contains(4.0)     // false
    ///     atLeastFive.contains(5.0)     // true
    ///     atLeastFive.contains(6.0)     // true
    ///
    /// You can use this type of partial range of a collection's indices to
    /// represent the range from the partial range's lower bound up to the end
    /// of the collection.
    ///
    ///     let numbers = [10, 20, 30, 40, 50, 60, 70]
    ///     print(numbers[3...])
    ///     // Prints "[40, 50, 60, 70]"
    ///
    /// - Parameter minimum: The lower bound for the range.
    ///
    /// - Precondition: `minimum` must compare equal to itself (i.e. cannot be NaN).
    postfix public static func ... (minimum: Never) -> PartialRangeFrom<Never>
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Never where Never : AnyObject {

    /// The stable identity of the entity associated with this instance.
    public var id: ObjectIdentifier { get }
}

@available(macOS 12.0, iOS 15.0, watchOS 8.0, tvOS 15.0, *)
extension Never : Identifiable {

    /// The stable identity of the entity associated with this instance.
    public var id: Never { get }

    /// A type representing the stable identity of the entity associated with
    /// an instance.
    public typealias ID = Never
}

extension Never : Equatable, Comparable, Hashable {

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: Never, b: Never) -> Bool

    /// Returns a Boolean value indicating whether the value of the first
    /// argument is less than that of the second argument.
    ///
    /// This function is the only requirement of the `Comparable` protocol. The
    /// remainder of the relational operator functions are implemented by the
    /// standard library for any type that conforms to `Comparable`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func < (a: Never, b: Never) -> Bool

    /// Hashes the essential components of this value by feeding them into the
    /// given hasher.
    ///
    /// Implement this method to conform to the `Hashable` protocol. The
    /// components used for hashing must be the same as the components compared
    /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
    /// with each of these components.
    ///
    /// - Important: Never call `finalize()` on `hasher`. Doing so may become a
    ///   compile-time error in the future.
    ///
    /// - Parameter hasher: The hasher to use when combining the components
    ///   of this instance.
    public func hash(into hasher: inout Hasher)

    /// The hash value.
    ///
    /// Hash values are not guaranteed to be equal across different executions of
    /// your program. Do not save hash values to use during a future execution.
    ///
    /// - Important: `hashValue` is deprecated as a `Hashable` requirement. To
    ///   conform to `Hashable`, implement the `hash(into:)` requirement instead.
    public var hashValue: Int { get }
}

