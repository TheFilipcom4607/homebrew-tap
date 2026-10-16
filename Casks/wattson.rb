cask "wattson" do
  version "2.7"
  sha256 "4ad8401f6c251b3e1231b51968ae2fafb853271e18ae39e467acce22d1f7e863"

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
