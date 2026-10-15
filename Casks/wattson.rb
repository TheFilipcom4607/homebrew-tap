cask "wattson" do
  version "2.4"
  sha256 "33f851065bb33e1beaade6885e402c0b23f6726f5ff332f71d1128c358d0f634"

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
