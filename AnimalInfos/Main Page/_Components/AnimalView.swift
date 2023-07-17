//
//  AnimalView.swift
//  AnimalInfos
//
//  Created by Asya Atpulat on 16.07.2023.
//

import UIKit

class AnimalView : UIView {
    
    var webLink: String?
    var video: String?
    var WebAction: ((_ urlString: String) -> ())?
    var VideoAction: (() -> Void)?
    @IBOutlet weak var imageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
       // setUpImageView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpView()
        //setUpImageView()
    }
    
    private func setUpView() {
        let nibname = String(describing: AnimalView.self)
        let nibs = Bundle.main.loadNibNamed(nibname, owner: self)
        if let viewForXib = nibs?.first as? UIView {
              viewForXib.frame = self.bounds
              addSubview(viewForXib)
          }
      }
            
    @IBAction func VideoBtn(_ sender: Any) {
        print("clicked1")
        VideoAction?()
    }
    
    @IBAction func WebBtn(_ sender: Any) {
        print("clicked2")
        WebAction?(webLink!)
    }
    
   /* private func setUpImageView() {
        imageView = UIImageView(frame: bounds)
        imageView.contentMode = .scaleToFill
        insertSubview(imageView, at: 0)
        addSubview(imageView)
    }*/
}
