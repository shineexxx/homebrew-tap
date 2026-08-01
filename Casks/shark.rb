cask "shark" do
  version "1.1"
  sha256 "966e804569de811621765cd855aa51c08ce0bc921da89ca3e52175a300471e4a"

  url "https://github.com/shineexxx/shark/releases/download/v#{version}/Shark-#{version}.zip"
  name "Shark"
  desc "File converter and video downloader with bundled ffmpeg and yt-dlp"
  homepage "https://github.com/shineexxx/shark"

  depends_on macos: :sonoma

  # The command line tool and its manual live inside the bundle, so both are
  # linked from there rather than shipped separately.
  app "Shark.app"
  binary "#{appdir}/Shark.app/Contents/Helpers/shark"
  manpage "#{appdir}/Shark.app/Contents/Resources/man/man1/shark.1"

  zap trash: [
    "~/Library/Application Support/Shark",
    "~/Library/Preferences/local.shark.app.plist",
    "~/Library/Saved Application State/local.shark.app.savedState",
  ]

  caveats <<~EOS
    Shark is signed ad-hoc rather than with an Apple Developer ID, so macOS
    blocks it the first time you open it. This is expected and happens once.

      1. Open Shark from Launchpad or Applications. macOS will refuse.
      2. Go to System Settings -> Privacy & Security, scroll down, and click
         "Open Anyway" next to Shark.
      3. Open Shark again and confirm.

    After that it launches normally, and the `shark` command works too.
  EOS
end
