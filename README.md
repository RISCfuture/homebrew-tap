# RISCfuture Tap

Homebrew casks for the [RISCfuture](https://github.com/RISCfuture) Mac apps that
ship a signed, notarized build outside the Mac App Store.

| Cask | App | |
| --- | --- | --- |
| `subtrack` | [SubTrack](https://riscfuture.github.io/SubTrack/) | Removes unwanted audio and subtitle tracks from video files |
| `zephyr` | [Zephyr](https://zephyrmac.app/) | A native Dropbox client for the Finder |

Both casks install the direct-download edition, which carries a command-line tool
the App Store edition cannot include. Install one edition or the other, not both.

## Installing

```sh
brew install --cask riscfuture/tap/subtrack
```

Or tap once and drop the prefix afterwards:

```sh
brew tap riscfuture/tap
brew install --cask zephyr
```

Or, in a `brew bundle` `Brewfile`:

```ruby
tap "riscfuture/tap"
cask "subtrack"
cask "zephyr"
```

## Updating

Both apps update themselves, so they are marked `auto_updates` and `brew upgrade`
leaves them alone. To take a new version through Homebrew instead:

```sh
brew upgrade --cask --greedy subtrack
```

## Documentation

`brew help`, `man brew`, or [Homebrew's documentation](https://docs.brew.sh).
