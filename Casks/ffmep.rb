cask "ffmep" do
  version "1.0.0"
  sha256 "bd4206432eba676da43a9b4748017e3723da4779f721780c414b01fc73752bef"

  url "https://github.com/TheFilipcom4607/ffmep/releases/download/v#{version}/ffmep-#{version}.dmg"
  name "ffmep"
  desc "Fast video, audio and image conversion for Apple silicon"
  homepage "https://github.com/TheFilipcom4607/ffmep"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :sonoma"
  depends_on arch: :arm64

  app "ffmep.app"

  zap trash: [
    "~/Library/Application Support/ffmep",
    "~/Library/Preferences/com.filip.ffmep.plist",
    "~/Library/Saved Application State/com.filip.ffmep.savedState",
  ]
end
