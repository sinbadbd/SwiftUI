//
//  ViewController.swift
//  CameraCustom
//
//  Created by Imran on 16/2/20.
//  Copyright © 2020 Im. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate {
    
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
    }
    func startRuntimeCaptureSession(){
        captureSession.startRunning()
    }
    @IBAction func cameraAction(_ sender: Any) {
        let setting = AVCapturePhotoSettings()
        photoOutput?.capturePhoto(with:setting , delegate: self)
        //        performSegue(withIdentifier: "showPreview", sender: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPreview" {
            let preview = segue.destination as! PreviewVC
            preview.image = self.image
        }
    }
}

extension ViewController : AVCapturePhotoCaptureDelegate {
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        if let imageData = photo.fileDataRepresentation() {
            print(imageData)
            image = UIImage(data: imageData)
            let preview =  PreviewVC()
            preview.image = self.image
            self.navigationController?.pushViewController(preview, animated: true)
            //performSegue(withIdentifier: "showPreview", sender: nil)
        }
    }
}
