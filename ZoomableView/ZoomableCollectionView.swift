//
//  ZoomableCollectionView.swift
//  ZoomableView
//
//  Created by kevin.ngh54 on 01/01/2023.
//

import UIKit

public protocol ZoomableCollectionViewCell: UICollectionViewCell {
    var zoomableView: ZoomableView { get }
}

public class ZoomableCollectionView: UICollectionView {
    public func stopZooming() {
        for cell in visibleCells {
            if let cell = cell as? ZoomableCollectionViewCell {
                cell.zoomableView.reset()
            }
        }
    }

    /// make sure to stop zooming before reload data
    public override func reloadData() {
        stopZooming()
        super.reloadData()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(disableScroll(_:)),
            name: ZoomableNotification.didZoom,
            object: nil
        )
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(enableScroll(_:)),
            name: ZoomableNotification.didZoom,
            object: nil
        )
    }
    
    public override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(disableScroll(_:)),
            name: ZoomableNotification.didZoom,
            object: nil
        )
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(enableScroll(_:)),
            name: ZoomableNotification.didZoom,
            object: nil
        )
    }
    
    /// make sure to disable scrolling before begin zooming
    @objc private func disableScroll(_ notification: NSNotification?) {
        if let userInfo = notification?.userInfo,
           let view = userInfo["view"] as? ZoomableView,
           view.isDescendant(of: self) {
            isScrollEnabled = false
        }
    }
    
    /// make sure to enable scrolling after stop zooming
    @objc private func enableScroll(_ notification: NSNotification?) {
        if let userInfo = notification?.userInfo,
           let view = userInfo["view"] as? ZoomableView,
           view.isDescendant(of: self) {
            isScrollEnabled = true
        }
    }
}
