cask "wattson" do
  version "2.5"
  sha256 "21f1257aa11189c5ea02ec5bc3b56593269d74457abd6fb890ed4f56d645a364"

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
