cask "wattson" do
  version "2.3"
  sha256 "6d80143a621223aaf9ed30f17b8aa7fce0176e4df68e2fc54417d2950c3ae05e"

  url "https://github.com/TheFilipcom4607/wattson/releases/download/v#{version}/Wattson-#{version}.dmg"
  name "Wattson"
  desc "Menu bar battery item that reports power, USB-C ports, cables and devices"
  homepage "https://github.com/TheFilipcom4607/wattson"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Wattson.app"

  uninstall quit: "com.filip.wattson"

  # The Low Power Mode sudoers rule goes on zap rather than uninstall: Homebrew runs uninstall
  # directives on every upgrade, which would have Wattson ask for a password again each time.
  zap delete: "/etc/sudoers.d/wattson",
      trash:  "~/Library/Preferences/com.filip.wattson.plist"
end
