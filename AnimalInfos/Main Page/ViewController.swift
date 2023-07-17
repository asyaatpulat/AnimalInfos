//
//  ViewController.swift
//  AnimalInfos
//
//  Created by Asya Atpulat on 16.07.2023.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var cheetahView: AnimalView!
    @IBOutlet weak var elephantView: AnimalView!
    @IBOutlet weak var giraffeView: AnimalView!
    @IBOutlet weak var gorillaView: AnimalView!
    @IBOutlet weak var hippoView: AnimalView!
    @IBOutlet weak var lionView: AnimalView!
    @IBOutlet weak var ostrichView: AnimalView!
    @IBOutlet weak var zebraView: AnimalView!

        
    
    private var playerViewController: AVPlayerViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Animals"
        setupViews()

    }
    
    private func setupViews() {
        cheetahView.webLink = "https://en.wikipedia.org/wiki/Cheetah"
        elephantView.webLink = "https://en.wikipedia.org/wiki/Elephant"
        giraffeView.webLink = "https://en.wikipedia.org/wiki/Giraffe"
        gorillaView.webLink = "https://en.wikipedia.org/wiki/Gorilla"
        hippoView.webLink = "https://en.wikipedia.org/wiki/Hippopotamus"
        lionView.webLink = "https://en.wikipedia.org/wiki/Lion"
        ostrichView.webLink = "https://en.wikipedia.org/wiki/Common_ostrich"
        zebraView.webLink = "https://en.wikipedia.org/wiki/Zebra"
        
        cheetahView.WebAction = routeWebVC()
        elephantView.WebAction = routeWebVC()
        giraffeView.WebAction = routeWebVC()
        gorillaView.WebAction = routeWebVC()
        hippoView.WebAction = routeWebVC()
        lionView.WebAction = routeWebVC()
        ostrichView.WebAction = routeWebVC()
        zebraView.WebAction = routeWebVC()
        

        cheetahView.imageView.image = UIImage(named: "cheetah.png")
        cheetahView.imageView.contentMode = .scaleAspectFill
        cheetahView.imageView.clipsToBounds = true
        cheetahView.imageView.layer.cornerRadius = 10
            
        elephantView.imageView.image = UIImage(named: "elephant.png")
        elephantView.imageView.contentMode = .scaleAspectFill
        elephantView.imageView.clipsToBounds = true
        elephantView.imageView.layer.cornerRadius = 10
            
        giraffeView.imageView.image = UIImage(named: "giraffe.png")
        giraffeView.imageView.contentMode = .scaleAspectFill
        giraffeView.imageView.clipsToBounds = true
        giraffeView.imageView.layer.cornerRadius = 10
            
        gorillaView.imageView.image = UIImage(named: "gorilla.png")
        gorillaView.imageView.contentMode = .scaleAspectFill
        gorillaView.imageView.clipsToBounds = true
        gorillaView.imageView.layer.cornerRadius = 10
            
        hippoView.imageView.image = UIImage(named: "hippo.png")
        hippoView.imageView.contentMode = .scaleAspectFill
        hippoView.imageView.clipsToBounds = true
        hippoView.imageView.layer.cornerRadius = 10
            
        lionView.imageView.image = UIImage(named: "lion.png")
        lionView.imageView.contentMode = .scaleAspectFill
        lionView.imageView.clipsToBounds = true
        lionView.imageView.layer.cornerRadius = 10
            
        ostrichView.imageView.image = UIImage(named: "ostrich.png")
        ostrichView.imageView.contentMode = .scaleAspectFill
        ostrichView.imageView.clipsToBounds = true
        ostrichView.imageView.layer.cornerRadius = 10
            
        zebraView.imageView.image = UIImage(named: "zebra.png")
        zebraView.imageView.contentMode = .scaleAspectFill
        zebraView.imageView.clipsToBounds = true
        zebraView.imageView.layer.cornerRadius = 10



        
        cheetahView.VideoAction = { [weak self] in
              self?.routeVideo("cheetah")
          }
          elephantView.VideoAction = { [weak self] in
              self?.routeVideo("elephant")
          }
        giraffeView.VideoAction = { [weak self] in
              self?.routeVideo("giraffe")
          }
        gorillaView.VideoAction = { [weak self] in
              self?.routeVideo("gorilla")
          }
        hippoView.VideoAction = { [weak self] in
              self?.routeVideo("hippo")
          }
          lionView.VideoAction = { [weak self] in
              self?.routeVideo("lion")
          }
        ostrichView.VideoAction = { [weak self] in
              self?.routeVideo("ostrich")
          }
          zebraView.VideoAction = { [weak self] in
              self?.routeVideo("zebra")
          }
    }

    func routeWebVC() -> (String) -> () {
        return { urlString in
            let storyboard = UIStoryboard(name: "WebViewController", bundle: nil)
            if let webVC = storyboard.instantiateViewController(withIdentifier: "WebViewController") as? WebViewController {
                webVC.urlString = urlString
                self.navigationController?.pushViewController(webVC, animated: true)
            }
        }
    }
    
    func routeVideo(_ videoPath: String) {
           guard let videoURL = Bundle.main.url(forResource: videoPath, withExtension: "mp4")
            else {
               return
           }
           let player = AVPlayer(url: videoURL)
           let playerViewController = AVPlayerViewController()
           playerViewController.player = player
           present(playerViewController, animated: true) {
               playerViewController.player?.play()
           }
       }
    
}

