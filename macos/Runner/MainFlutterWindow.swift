import Cocoa
import FlutterMacOS
import KSPlayer

class MainFlutterWindow: NSWindow {
  override func awakeFromNib() {
      let flutterViewController = FlutterViewController.init()
      let windowFrame = self.frame
      self.contentViewController = flutterViewController
      self.setFrame(windowFrame, display: true)

      
      KSPlayerManager.firstPlayerType = KSMEPlayer.self
      KSPlayerManager.secondPlayerType = KSMEPlayer.self
      KSPlayerManager.logLevel = .debug
      KSOptions.isAutoPlay = true
      KSOptions.isSeekedAutoPlay = true
      KSOptions.hardwareDecodeH264 = true
      KSOptions.hardwareDecodeH265 = true
      
      RegisterGeneratedPlugins(registry: flutterViewController)
      VideoPlayerPlugin.register(with: flutterViewController.registrar(forPlugin: "VideoPlayerPlugin"))
      
      
      styleMask = [.closable, .miniaturizable, .resizable, .titled]
      
    super.awakeFromNib()
  }
}
