cask "subtrack" do
  version "2.0"
  sha256 "5f8622059826ac044e29b29819d32cd1ebaf13317f8a0b0d5f7110ec6fd32a6c"

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
