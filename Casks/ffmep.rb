cask "ffmep" do
  version "1.1.0"
  sha256 "cfaaf7472c9d5a397c852090b02c723f810a67d0459c1d92085c86c5f6ca6424"

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
  binary "#{appdir}/ffmep.app/Contents/MacOS/ffmep"

  zap trash: [
    "~/Library/Application Support/ffmep",
    "~/Library/Preferences/com.filip.ffmep.plist",
    "~/Library/Saved Application State/com.filip.ffmep.savedState",
  ]
end
