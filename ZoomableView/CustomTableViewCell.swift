//
//  CustomTableViewCell.swift
//  ZoomableView
//
//  Created by Savvycom2021 on 19/09/2021.
//

import UIKit
import MediaPlayer

enum CellType {
    case view
    case image
    case video
}

protocol CustomTableViewCellDelegate: AnyObject {
    func customCellDidZoom(cell: CustomTableViewCell)
    func customCellEndZoom(cell: CustomTableViewCell)
}

class CustomTableViewCell: UITableViewCell {
    @IBOutlet weak var zoomableView: ZoomableView!
    weak var delegate: CustomTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        zoomableView.delegate = self
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

extension CustomTableViewCell: ZoomableViewDelegate {
    func zoomableViewShouldZoom(_ view: ZoomableView) -> Bool {
        return true
    }
    
    func zoomableViewDidZoom(_ view: ZoomableView) {
        delegate?.customCellDidZoom(cell: self)
    }
    
    func zoomableViewEndZoom(_ view: ZoomableView) {
        delegate?.customCellEndZoom(cell: self)
    }
}
