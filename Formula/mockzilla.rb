class Mockzilla < Formula
  desc "Generate APIs with meaningful responses, configurable latency, error codes and more"
  homepage "https://mockzilla.github.io/mockzilla/"
  version "2.9.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mockzilla/mockzilla/releases/download/v#{version}/mockzilla-v#{version}-darwin-arm64"
      sha256 "f8adca8cd2d47d96b0dd8c37b2478bb9f72da8095738db5319da8c99d30d29fa"
    else
      url "https://github.com/mockzilla/mockzilla/releases/download/v#{version}/mockzilla-v#{version}-darwin-amd64"
      sha256 "7a57387467bf7c0bb2e22930e994faf65b975557d2c73b0b249e9818f0e7b2fb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mockzilla/mockzilla/releases/download/v#{version}/mockzilla-v#{version}-linux-arm64"
      sha256 "22d4cc0857d45b27c03b07378fc9740b33faffda5b06d79443476377c95ff0df"
    else
      url "https://github.com/mockzilla/mockzilla/releases/download/v#{version}/mockzilla-v#{version}-linux-amd64"
      sha256 "d4fa357a26fdd69b1f575ba4f76207c0e782ee01d536ca8a120a77e2236c1d16"
    end
  end

  def install
    binary = Dir["mockzilla-*"].first
    bin.install binary => "mockzilla"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mockzilla --version")
  end
end
