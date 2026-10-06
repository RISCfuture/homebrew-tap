cask "zephyr" do
  version "1.1"
  sha256 "0d1529145475c2b5597406c04d6ee2a38a6d2bd7c9c8fd934eb3cc9efaa6caae"

  url "https://github.com/RISCfuture/Zephyr/releases/download/#{version}/Zephyr-#{version}.pkg"
  name "Zephyr"
  desc "Native Dropbox client for the Finder"
  homepage "https://zephyrmac.app/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :tahoe

  # Installed as a package rather than by copying the app out of it. The Finder
  # stamps com.apple.quarantine onto anything dragged from a disk image, macOS
  # then runs it from an App Translocation mount, and it will not run a File
  # Provider extension for a translocated process at all — so a copied Zephyr
  # could never put a Dropbox in the sidebar. The installer also links the
  # bundled `zephyr` tool into /usr/local/bin, which is why there is no `binary`
  # stanza here.
  pkg "Zephyr-#{version}.pkg"

  uninstall quit:    "codes.tim.Zephyr",
            pkgutil: "codes.tim.Zephyr.installer*",
            delete:  "/usr/local/bin/zephyr"

  # Sandboxed, so everything the app writes lives in its containers rather than
  # in the usual top-level Application Support / Caches directories.
  zap trash: [
    "~/Library/Application Scripts/codes.tim.Zephyr",
    "~/Library/Application Scripts/codes.tim.Zephyr.FileProvider",
    "~/Library/Application Scripts/codes.tim.Zephyr.FileProviderUI",
    "~/Library/Application Scripts/codes.tim.Zephyr.ShareExtension",
    "~/Library/Application Scripts/codes.tim.Zephyr.Widget",
    "~/Library/Containers/codes.tim.Zephyr",
    "~/Library/Containers/codes.tim.Zephyr.FileProvider",
    "~/Library/Containers/codes.tim.Zephyr.FileProviderUI",
    "~/Library/Containers/codes.tim.Zephyr.ShareExtension",
    "~/Library/Containers/codes.tim.Zephyr.Widget",
    "~/Library/Preferences/codes.tim.Zephyr.plist",
    "~/Library/Saved Application State/codes.tim.Zephyr.savedState",
  ]

  caveats <<~EOS
    Zephyr's direct-download and Mac App Store editions share the bundle
    identifier codes.tim.Zephyr. Install one edition or the other, not both.
  EOS
end
