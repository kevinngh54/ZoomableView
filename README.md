[![LinkedIn][linkedin-shield]][linkedin-url]

## About the project
Replicate easily the Instagram zooming feature on UIView. 
Base on https://github.com/paulemmanuel-garcia/InstaZoom

<!-- GETTING STARTED -->
## Getting Started

To get a local copy up and running follow these simple steps.

### Installation

1. Clone the repo
   ```sh
   git clone https://github.com/huykhoi98hn/ZoomableView.git
   ```
   
<!-- USAGE EXAMPLES -->
## Usage

![Demo](https://media.giphy.com/media/ulgiV6nUJBeBG6Kleq/giphy.gif?cid=790b7611b05bfe588f98fa46fcfc6a8a0c5024c2b0580cd0&rid=giphy.gif&ct=g)

[Example](https://github.com/huykhoi98hn/ZoomableView/tree/main/ZoomableView)

## Use case
- To add in your view:
```swift
let zoomableView = ZoomableView()
```
- To activate the zoom:
```swift
let yourView = YourView()
zoomableView.sourceView = yourView
zoomableView.isZoomable = true // add gesture recognizer
```
- To enable/disable it:
```swift
zoomableView.isEnableZoom = true
zoomableView.isEnableZoom = false
```
- ZoomableViewDelegate:
```swift
protocol ZoomableViewDelegate: AnyObject {
    func zoomableViewShouldZoom(_ view: ZoomableView) -> Bool //ask if it can be zoomed
    func zoomableViewDidZoom(_ view: ZoomableView) //trigger when view begin zooming
    func zoomableViewEndZoom(_ view: ZoomableView) //trigger when view finish zooming
    func zoomableViewGetBackground(_ view: ZoomableView) -> UIView? //add your background when zoom
}
```

<!-- CONTACT -->
## Contact

Nguyen Huy Khoi - Email: huykhoi98hn@gmail.com


<!-- MARKDOWN LINKS & IMAGES -->
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://www.linkedin.com/in/khoinhios/
