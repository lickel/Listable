//
//  RefreshControl.swift
//  ListableUI
//
//  Created by Kyle Van Essen on 8/4/19.
//

import Foundation


/// Represents a standard UIKit refresh control that is shown at the top
/// of a list to indicate that the list is refreshing. If you've used Mail.app, you know what this is!
public struct RefreshControl
{
    /// If the list is current refreshing.
    public var isRefreshing : Bool

    /// Controls how the refresh control affects the list when it is visible.
    public var offsetAdjustmentBehavior: OffsetAdjustmentBehavior

    /// The title of the control.
    public var title : Title?
    
    /// The color of the control.
    public var tintColor : UIColor?
    
    public typealias OnRefresh = () -> ()
    
    /// Invoked when a customer triggers a refresh event.
    public var onRefresh : OnRefresh
    
    public init(
        isRefreshing: Bool,
        offsetAdjustmentBehavior: OffsetAdjustmentBehavior = .none,
        title : Title? = nil,
        tintColor : UIColor? = nil,
        onRefresh : @escaping OnRefresh
        )
    {
        self.isRefreshing = isRefreshing
        self.offsetAdjustmentBehavior = offsetAdjustmentBehavior

        self.title = title
        self.tintColor = tintColor
        
        self.onRefresh = onRefresh
    }
}


extension RefreshControl
{
    /// Controls the visibility and position of the refresh control.
    public enum OffsetAdjustmentBehavior : Equatable
    {
        /// Does not apply any visibility or offset change to the refresh control.
        case none
        
        /// If a refresh (TODO what does this do? ...)
        case displayWhenRefreshing(animate: Bool, scrollToTop: Bool)
    }

    /// How the title of the refresh control is displayed.
    public enum Title : Hashable
    {
        /// A standard string is displayed according to iOS appearance rules.
        case string(String)
        
        /// An attributed string is displayed which provides specific appearance rules.
        case attributed(NSAttributedString)
    }
}
