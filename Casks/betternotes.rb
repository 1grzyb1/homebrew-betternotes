cask "betternotes" do
  version "0.0.0"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"

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
