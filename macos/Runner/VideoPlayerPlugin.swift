//
//  VideoPlayerPlugin.swift
//  Runner
//
//  Created by yang jie on 2022/2/20.
//
import Cocoa
import FlutterMacOS
import KSPlayer


class MeOptions: KSOptions {
    override func customizeDar(sar: CGSize, par: CGSize) -> CGSize? {
        let rate = sar.width * par.height / (sar.height * par.height)
        if rate < 5 / 4 {
            return CGSize(width: 5, height: 4)
        } else if rate < 4 / 3 {
            return CGSize(width: 4, height: 3)
        } else if rate < 16 / 9 {
            return CGSize(width: 16, height: 9)
        }
        return nil
    }

    override func isUseDisplayLayer() -> Bool {
        super.isUseDisplayLayer()
    }
}

public class VideoPlayerPlugin: NSObject, FlutterPlugin {
    
    var register: FlutterPluginRegistrar?
    private let playerView = MacVideoPlayerView()
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "hackathon_video_player", binaryMessenger: registrar.messenger)
        let instance = VideoPlayerPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
        instance.register = registrar
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
      switch call.method {
      case "play":
          let arguments = call.arguments as! [String: Any]
          let url = arguments["url"] as! String
          let res0 = KSPlayerResourceDefinition(url: URL.init(string: url)!, definition: "高清", options: MeOptions())
          let asset = KSPlayerResource(name: "", definitions: [res0], cover: URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c5/Big_buck_bunny_poster_big.jpg/848px-Big_buck_bunny_poster_big.jpg"))
          playerView.set(resource: asset)
          let view = self.register!.view!
          view.addSubview(playerView)
          playerView.translatesAutoresizingMaskIntoConstraints = false
          NSLayoutConstraint.activate([
              playerView.topAnchor.constraint(equalTo: view.topAnchor),
              playerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
              playerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
              playerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
          ])
      case "stop":
          self.playerView.resetPlayer()
          self.playerView.removeFromSuperview()
      case "pause":
          self.playerView.pause()
      default:
        result(FlutterMethodNotImplemented)
      }
  }
    
}
