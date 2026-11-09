cask "habla" do
  version "2.1.5"
  sha256 "cd353c75c9d19d628c262093492ca8050edd85e4052ab2d5348781db3f9191a0"

  url "https://github.com/ikbrrrr/homebrew-habla/releases/download/v#{version}/Habla-#{version}-arm64.zip"
  name "Hablá"
  desc "Local voice dictation for macOS with a live spectrogram overlay"
  homepage "https://github.com/ikbrrrr/homebrew-habla"

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Habla.app"

  # This is a personal build, not notarized by Apple. Homebrew applies the
  # download quarantine on install; strip it here so Gatekeeper doesn't block
  # launch. (The old `--no-quarantine` flag was removed in Homebrew 6.)
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Habla.app"],
                          writable_paths: ["Habla.app"], writable_base: :appdir
  end

  caveats <<~CAVEATS
    First launch walks you through granting Accessibility (needed to paste
    transcribed text). Microphone is requested automatically by macOS. The
    Ctrl+Shift+Space hotkey needs no permission.

    The first dictation downloads a ~2 GB speech model from Hugging Face —
    give it a minute and a network connection the first time.

    Apple Silicon Macs only.
  CAVEATS
end
