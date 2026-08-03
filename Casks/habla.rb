cask "habla" do
  version "2.1.1"
  sha256 "3792170c1943ab3b1c621ede7525b65858160b8b8804592330cca9ee5e7cb6af"

  url "https://github.com/ikbrrrr/homebrew-habla/releases/download/v#{version}/Habla-#{version}-arm64.zip"
  name "Hablá"
  desc "Local voice dictation for macOS with a live spectrogram overlay"
  homepage "https://github.com/ikbrrrr/homebrew-habla"

  depends_on arch: :arm64
  depends_on macos: ">= :sonoma"

  app "Habla.app"

  caveats <<~CAVEATS
    Hablá is a personal build and is not notarized by Apple, so it must be
    installed WITHOUT quarantine:

      brew install --cask ikbrrrr/habla/habla --no-quarantine

    First launch walks you through granting Accessibility (needed to paste
    transcribed text). Microphone is requested automatically by macOS. The
    Ctrl+Shift+Space hotkey needs no permission.

    The first dictation downloads a ~2 GB speech model from Hugging Face —
    give it a minute and a network connection the first time.

    Apple Silicon Macs only.
  CAVEATS
end
