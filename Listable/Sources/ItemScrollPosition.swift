//
//  ItemScrollPosition.swift
//  Listable
//
//  Created by Kyle Van Essen on 11/5/19.
//

///
///
///
///
///
///
public struct ItemScrollPosition : Equatable
{
    /// The position to scroll to within the list.
    var position : Position
    
    /// The rule to apply if the item is already partially visible within the list.
    var ifAlreadyVisible : IfAlreadyVisible
   
    /// The offset to apply when scrolling to the item in the list.
    var offset : CGFloat
    
    public init(position : Position, ifAlreadyVisible : IfAlreadyVisible = .doNothing, offset : CGFloat = 0.0)
    {
        self.position = position
        self.ifAlreadyVisible = ifAlreadyVisible
        self.offset = offset
    }
    
    /// How the item should be positioned within the list.
    public enum Position : Equatable
    {
        /// Scroll the item to the top of the list.
        case top
        
        /// The scroll the item to the middle of the list.
        case centered
        
        /// Scroll the item to the bottom of the list.
        case bottom
        
        var UICollectionViewScrollPosition : UICollectionView.ScrollPosition {
            switch self {
            case .top: return .top
            case .centered: return .centeredVertically
            case .bottom: return .bottom
            }
        }
    }
    
    /// What action should be taken if an item is already partially visible within a list.
    public enum IfAlreadyVisible : Equatable
    {
        /// Do not perform any action if the item is already partially visible.
        case doNothing
        
        /// Scroll the item to the desired `Position`, even if it is already partially visible.
        case scrollToPosition
    }
}
