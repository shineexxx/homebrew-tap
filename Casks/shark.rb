cask "shark" do
  version "1.0"
  sha256 "8fb9b59bfd9899ef58831db56352b82cc4c39bf70516fedb2d7bc0c58a66b3a2"

  url "https://github.com/shineexxx/shark/releases/download/v#{version}/Shark-#{version}.zip"
  name "Shark"
  desc "File converter and video downloader with bundled ffmpeg and yt-dlp"
  homepage "https://github.com/shineexxx/shark"

  depends_on macos: ":sonoma"

  app "Shark.app"

  # The command line tool and its manual live inside the bundle, so both are
  # linked from there rather than shipped separately.
  binary "#{appdir}/Shark.app/Contents/Helpers/shark"
  manpage "#{appdir}/Shark.app/Contents/Resources/man/man1/shark.1"

  zap trash: [
    "~/Library/Application Support/Shark",
    "~/Library/Preferences/local.shark.app.plist",
    "~/Library/Saved Application State/local.shark.app.savedState",
  ]

  caveats <<~EOS
    Shark is signed ad-hoc, not with an Apple Developer ID, so macOS will
    refuse to open it on first launch. Either install with

      brew install --cask --no-quarantine shark

    or, after installing, allow it once in
    System Settings → Privacy & Security.
  EOS
end
