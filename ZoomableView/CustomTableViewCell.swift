//
//  CustomTableViewCell.swift
//  ZoomableView
//
//  Created by kevin.ngh54 on 01/01/2023.
//

import UIKit
import MediaPlayer

enum CellType {
    case view
    case image
    case video
}

class CustomTableViewCell: UITableViewCell, ZoomableTableViewCell {
    @IBOutlet private weak var mediaView: ZoomableView!
    
    var zoomableView: ZoomableView {
        return mediaView
    }
    
    func setData(type: CellType) {
        switch type {
        case .view:
            let view = UIView()
            view.backgroundColor = .red
            zoomableView.sourceView = view
        case .image:
            let imageView = UIImageView(image: UIImage(named: "vinhhalong.pdf"))
            imageView.contentMode = .scaleToFill
            zoomableView.sourceView = imageView
        case .video:
            guard let url = URL(string: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4") else {
                return
            }
            let player = AVPlayer(url: url)
            player.isMuted = true
            let layer = AVPlayerLayer(player: player)
            layer.videoGravity = .resizeAspectFill
            let videoView = UIView()
            videoView.layer.addSublayer(layer)
            zoomableView.sourceView = videoView
            layer.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
            player.play()
        }
        zoomableView.isZoomable = true
    }
}
