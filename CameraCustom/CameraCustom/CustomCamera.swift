//
//  ViewController.swift
//  CameraCustom
//
//  Created by Imran on 16/2/20.
//  Copyright © 2020 Im. All rights reserved.
//

import UIKit
import AVFoundation


var frontImage : UIImage!

class CustomCamera: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate {
    
    var captureSession = AVCaptureSession()
    
    var backCamera : AVCaptureDevice?
    var frontCamera: AVCaptureDevice?
    var currentCamera: AVCaptureDevice?
    
    var photoOutput  : AVCapturePhotoOutput?
    var cameraPreviewLayer : AVCaptureVideoPreviewLayer?
    
    var image: UIImage?
    
     
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCaptureSession()
        setupDevice()
        setupInputOutput()
        setupPreviewLayout()
        startRuntimeCaptureSession()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupCaptureSession()
    }
    func setupCaptureSession(){
        captureSession.sessionPreset = AVCaptureSession.Preset.photo
    }
    func setupDevice(){
        let deviceDiscovarySession = AVCaptureDevice.DiscoverySession(deviceTypes: [AVCaptureDevice.DeviceType.builtInWideAngleCamera], mediaType: AVMediaType.video, position: AVCaptureDevice.Position.unspecified)
        
        let devices = deviceDiscovarySession.devices
        for device in devices {
            if device.position == AVCaptureDevice.Position.back {
                backCamera  = device
            } else if device.position == AVCaptureDevice.Position.front {
                frontCamera = device
            }
        }
        currentCamera = backCamera
    }
    func setupInputOutput(){
        do {
            let captureDeviceInput = try AVCaptureDeviceInput(device: currentCamera!)
            captureSession.addInput(captureDeviceInput)
            photoOutput = AVCapturePhotoOutput()
            photoOutput?.setPreparedPhotoSettingsArray([AVCapturePhotoSettings(format: [AVVideoCodecKey: AVVideoCodecType.jpeg])], completionHandler:  nil)
            captureSession.addOutput(photoOutput!)
            captureSession.commitConfiguration()
        } catch {
            print(error)
        }
        
    }
    func setupPreviewLayout(){
        cameraPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        cameraPreviewLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
        cameraPreviewLayer?.connection?.videoOrientation =  AVCaptureVideoOrientation.portrait
        cameraPreviewLayer?.frame =  self.view.frame
        self.view.layer.insertSublayer(cameraPreviewLayer!, at: 0)
        
        let bottomView = UIView()
               view.addSubview(bottomView)
               bottomView.backgroundColor = .red
               bottomView.frame = CGRect(x: 0, y: view.frame.height - 100, width: self.view.frame.width, height: 100)
               
               let capturePicture = UIButton()
               bottomView.addSubview(capturePicture)
               capturePicture.frame = CGRect(x: bottomView.frame.width / 2 - 25, y: bottomView.frame.height / 2 - 25, width: 50, height: 50)
               capturePicture.backgroundColor = .green
               capturePicture.addTarget(self, action: #selector(capturePictureTap), for: .touchUpInside)
    }
    @objc func capturePictureTap(){
           let setting = AVCapturePhotoSettings()
           photoOutput?.capturePhoto(with:setting , delegate: self)
       }
    func startRuntimeCaptureSession(){
        captureSession.startRunning()
    }
    @IBAction func cameraAction(_ sender: Any) {
//        let setting = AVCapturePhotoSettings()
//        photoOutput?.capturePhoto(with:setting , delegate: self)
        //        performSegue(withIdentifier: "showPreview", sender: nil)
    }
    
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "showPreview" {
//            let preview = segue.destination as! PreviewVC
//            preview.image = self.image
//        }
//    }
}

extension CustomCamera : AVCapturePhotoCaptureDelegate {
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        if let imageData = photo.fileDataRepresentation() {
            print(imageData)
            frontImage = UIImage(data: imageData)
            
            
            let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
            if let homeViewController = mainStoryboard.instantiateViewController(withIdentifier: "ViewControllerCall") as? PreviewVC {
                homeViewController.image = frontImage
//                self.present(homeViewController, animated: true)
//                navigationController?.pushViewController(homeViewController, animated: true)
              navigationController?.popViewController(animated: true)
            }
            
            
            
            
            
//               let preview =  PreviewVC()
//                   preview.image = self.image
//            self.navigationController?.popViewController(animated: true)
//            let preview =  PreviewVC()
//            preview.image = self.image
//            DispatchQueue.main.async {
//                self.navigationController?.pushViewController(preview, animated: true)
//            }
            
            //performSegue(withIdentifier: "showPreview", sender: nil)
        }
    }
    
}
