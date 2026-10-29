cask "betternotes" do
  version "0.1.0"
  sha256 "224cdeb227d805a1b565562f0224e45c55447e1213a532b26fdffed790c1b6dd"

  url "https://github.com/1grzyb1/betternotes/releases/download/v#{version}/BetterNotes-macos-universal.zip"
  name "BetterNotes"
  desc "Handwritten notebook for the desktop"
  homepage "https://github.com/1grzyb1/betternotes"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "BetterNotes.app"

  # The app is not notarized; drop the quarantine flag so it opens without a Gatekeeper prompt.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/BetterNotes.app"], must_succeed: false
  end
end
