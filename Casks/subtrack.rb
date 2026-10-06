cask "subtrack" do
  version "1.2"
  sha256 "264fe09b5cd44ee16003075d936a92923d9f64e83cfdd8f25670ee37f9008a34"

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
  depends_on macos: :tahoe

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
