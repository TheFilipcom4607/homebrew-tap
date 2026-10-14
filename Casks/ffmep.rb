cask "ffmep" do
  version "1.2.0"
  sha256 "6b6d7bf0f476bfb554c1be32fe2d97ce4597d656192a5e92e8cb8234bd343e77"

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
