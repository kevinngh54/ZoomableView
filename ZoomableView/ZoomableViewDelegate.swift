//
//  ZoomableViewDelegate.swift
//  ZoomableView
//
//  Created by kevin.ngh54 on 01/01/2023.
//

import UIKit

public protocol ZoomableViewDelegate: AnyObject {
    func zoomableViewShouldZoom(_ view: ZoomableView) -> Bool
    func zoomableViewDidZoom(_ view: ZoomableView)
    func zoomableViewEndZoom(_ view: ZoomableView)
    func zoomableViewGetBackground(_ view: ZoomableView) -> UIView?
}

extension ZoomableViewDelegate {
    func zoomableViewShouldZoom(_ view: ZoomableView) -> Bool {
        return true
    }
    
    func zoomableViewGetBackground(_ view: ZoomableView) -> UIView? {
        return nil
    }
}
