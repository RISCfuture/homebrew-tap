cask "subtrack" do
  version "2.0.1"
  sha256 "5ea60ec5b0b6e9c648382205710cbf12166536100dc65e32d711c81179e79294"

  url "https://github.com/RISCfuture/SubTrack/releases/download/#{version}/SubTrack-#{version}.dmg"
  name "SubTrack"
  desc "Removes unwanted audio and subtitle tracks from video files"
  homepage "https://riscfuture.github.io/SubTrack/"

  # Releases also carry an ffmpeg source tarball, so match on the tag rather
  # than on whichever asset happens to be listed first.
  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :golden_gate

  app "SubTrack.app"
  binary "#{appdir}/SubTrack.app/Contents/Resources/subtrack"

  zap trash: [
    "~/Library/Application Support/local.store",
    "~/Library/Application Support/local.store-shm",
    "~/Library/Application Support/local.store-wal",
    "~/Library/Application Support/presets.store",
    "~/Library/Application Support/presets.store-shm",
    "~/Library/Application Support/presets.store-wal",
    "~/Library/Caches/codes.tim.SubTrack-download",
    "~/Library/Containers/codes.tim.SubTrack-download",
    "~/Library/HTTPStorages/codes.tim.SubTrack-download",
    "~/Library/Preferences/codes.tim.SubTrack-download.plist",
    "~/Library/Saved Application State/codes.tim.SubTrack-download.savedState",
  ]
end
