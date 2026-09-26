cask "wattson" do
  version "2.3"
  sha256 "a7dcc9c9e2c57992432c47f252a187f5067ae9969b42c0cc4217cc56fe3d84d9"

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
