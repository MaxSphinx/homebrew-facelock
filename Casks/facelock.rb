cask "facelock" do
  version "1.0.0"
  sha256 "615c9638899218b01f9777f354b4805d5d8a9c2d9039fc24198790f6062bf34e"

  url "https://github.com/MaxSphinx/FaceLock/releases/download/v#{version}/FaceLock-macOS-arm64.zip"
  name "FaceLock"
  desc "Native biometric application shield and intruder defense for macOS"
  homepage "https://github.com/MaxSphinx/FaceLock"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :sonoma"
  depends_on arch: :arm64

  app "FaceLock.app"
  binary "#{appdir}/FaceLock.app/Contents/MacOS/FaceLock", target: "facelock"

  zap trash: [
    "~/.facelock",
    "~/Library/Preferences/io.github.facelock.plist",
    "~/Library/Saved Application State/io.github.facelock.savedState",
  ]
end
