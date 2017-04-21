import PlaygroundSupport
import UIKit
import AVFoundation


//Playground by : Kenny Batista
// Here is a GIF of this playground running just in case this it doesn't run in your computer : http://www.giphy.com/gifs/xUA7aQAGLt2Crmu9X2


    // Creates the backgroundView
    func createView() -> UIView {
        
        let myView = UIView(frame: CGRect(x: 0, y: 0, width: 400, height: 400))
        
        myView.backgroundColor = UIColor.black
        
        return myView
    }



    // Create imageview
    func createImageView() -> UIImageView {
        
        let imageView = UIImageView(frame: CGRect(x: 120, y: 110, width: 150, height: 150))
        imageView.image = UIImage(named: "white_apple_logo.png")
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }




    // Instantiate views
    let backgroundView = createView()
    let imageView = createImageView()

    // Add apple logo
    backgroundView.addSubview(imageView)





    // Stars
    func starsEmitter() -> CAEmitterLayer {
        
        // Emitter background
        let starsEmitter = CAEmitterLayer()
        starsEmitter.emitterPosition = CGPoint(x: backgroundView.frame.midX, y: -50)
        starsEmitter.emitterShape = kCAEmitterLayerSurface
        starsEmitter.emitterMode = kCAEmitterLayerSurface
        
        //star cell
        let starCell = CAEmitterCell()
        starCell.scale = 0.15
        starCell.scaleRange = 0.4
        
        // birth
        starCell.birthRate = 10
        starCell.lifetime = 10
        starCell.lifetimeRange = 2
        starCell.contents = UIImage(named: "particle")?.cgImage
        
        //speed/velocity
        starCell.velocityRange = 100
        starCell.emissionLongitude = .pi
        starCell.yAcceleration = 15
        
        starsEmitter.emitterCells = [starCell]
        
        backgroundView.layer.addSublayer(starsEmitter)
        
        
        return starsEmitter
        
    }


    func createApplesEmitter() -> CAEmitterLayer {
        
        let emitterLayer = CAEmitterLayer()
        emitterLayer.emitterSize = backgroundView.frame.size
        
        emitterLayer.emitterPosition = CGPoint(x: backgroundView.frame.midX, y: backgroundView.frame.midY)
        
        // Create Emitter Cell
        let cell = CAEmitterCell()
        cell.contents = UIImage(named: "apple2")?.cgImage
        cell.minificationFilter = kCAFilterLinear
        cell.scale = 0.01
        cell.scaleRange = 1.5
        cell.scaleSpeed = -0.50
        
        cell.birthRate = 10
        
        //Life in seconds
        cell.lifetime = 15
        cell.lifetimeRange = 4
        
        //Magnitude of initial velocity with which particles travel
        cell.velocity = 300
        cell.velocityRange = 60
        
        cell.alphaRange = 0.5
        cell.alphaSpeed = -0.1
        
        cell.spin = .pi * 1
        cell.spinRange = .pi / 2
        
        cell.emissionLongitude = (.pi * 0)
        cell.emissionRange = 360
        
        emitterLayer.emitterCells = [cell]
        cell.speed = 2
        
        emitterLayer.birthRate = 3
        emitterLayer.speed = 0.2
        
        
        backgroundView.layer.insertSublayer(emitterLayer, below: imageView.layer)
        
        return emitterLayer
    }


    func bezierPaths(){
        
            // ---------  First Bezier ---------
            let path = UIBezierPath()
            path.move(to: CGPoint(x: 10, y: 10))
            path.addLine(to: CGPoint(x: 390, y: 10))
            path.addLine(to: CGPoint(x: 390, y: 390))
            path.addLine(to: CGPoint(x: 10, y: 390))
            
            path.close()
            
            let shapeLayer = CAShapeLayer()
            shapeLayer.path = path.cgPath
            shapeLayer.fillColor = UIColor.clear.cgColor
            
        
            
            shapeLayer.strokeColor = UIColor.red.cgColor
        
            shapeLayer.lineWidth = 5.0
            
            
            
            let animation = CABasicAnimation(keyPath: "strokeEnd")
            /* set up animation */
            animation.fromValue = 0.0
            animation.toValue = 1.0
            animation.duration = 7
            shapeLayer.add(animation, forKey: "drawLineAnimation")
        
        
        
        
            // ---------  Second Bezier ---------
            let path2 = UIBezierPath()
            path2.move(to: CGPoint(x: 20, y: 20))
            path2.addLine(to: CGPoint(x: 380, y: 20))
            path2.addLine(to: CGPoint(x: 380, y: 380))
            path2.addLine(to: CGPoint(x: 20, y: 380))
            
            path2.close()
            
            let shapeLayer2 = CAShapeLayer()
            shapeLayer2.path = path2.cgPath
            shapeLayer2.fillColor = UIColor.clear.cgColor
            
        
            
            shapeLayer2.strokeColor = UIColor.orange.cgColor
            shapeLayer2.lineWidth = 5.0
            
            // animations
            
            let animation2 = CABasicAnimation(keyPath: "strokeEnd")
            /* set up animation */
            animation2.fromValue = 0.0
            animation2.toValue = 1.0
            animation2.duration = 7
            shapeLayer2.add(animation2, forKey: "drawLineAnimation")
        
        
        
        
        
            // ---------  Third Bezier ---------
            let path3 = UIBezierPath()
            path3.move(to: CGPoint(x: 30, y: 30))
            path3.addLine(to: CGPoint(x: 370, y: 30))
            path3.addLine(to: CGPoint(x: 370, y: 370))
            path3.addLine(to: CGPoint(x: 30, y: 370))
            
            path3.close()
            
            let shapeLayer3 = CAShapeLayer()
            shapeLayer3.path = path3.cgPath
            shapeLayer3.fillColor = UIColor.clear.cgColor
            
        
            shapeLayer3.strokeColor = UIColor.yellow.cgColor
            shapeLayer3.lineWidth = 5.0
        
            
            let animation3 = CABasicAnimation(keyPath: "strokeEnd")
            /* set up animation */
            animation3.fromValue = 0.0
            animation3.toValue = 1.0
            animation3.duration = 7
            shapeLayer3.add(animation3, forKey: "drawLineAnimation")
        

            backgroundView.layer.addSublayer(shapeLayer)
            backgroundView.layer.addSublayer(shapeLayer2)
            backgroundView.layer.addSublayer(shapeLayer3)
    }
        
    
// Represent on Renderer
PlaygroundPage.current.liveView = backgroundView
PlaygroundPage.current.needsIndefiniteExecution = true



bezierPaths()
createApplesEmitter()
starsEmitter()
