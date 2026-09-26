cask "ffmep" do
  version "1.0.0"
  sha256 "c25b23892946353bf17456f6eb45dc269d90be9652a75b5346e358a98bbb52c6"

  url "https://github.com/TheFilipcom4607/ffmep/releases/download/v#{version}/ffmep-#{version}.dmg"
  name "ffmep"
  desc "Fast video, audio and image conversion for Apple silicon"
  homepage "https://github.com/TheFilipcom4607/ffmep"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma
  depends_on arch: :arm64

  app "ffmep.app"

  zap trash: [
    "~/Library/Application Support/ffmep",
    "~/Library/Preferences/com.filip.ffmep.plist",
    "~/Library/Saved Application State/com.filip.ffmep.savedState",
  ]
end
