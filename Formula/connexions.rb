class Connexions < Formula
  desc "Generate APIs with meaningful responses, configurable latency, error codes and more"
  homepage "https://mockzilla.github.io/connexions/"
  version "2.1.79"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mockzilla/connexions/releases/download/v#{version}/connexions-v#{version}-darwin-arm64"
      sha256 "7e6b55198eecf08b2f04bad1c5da6bdf4e04189a4de0c8d28e93d695fab572ef"
    else
      url "https://github.com/mockzilla/connexions/releases/download/v#{version}/connexions-v#{version}-darwin-amd64"
      sha256 "e2e8fbd679fb3be346930bad57baf70218eac4c0c079c23fd6b0b992dfb8b809"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mockzilla/connexions/releases/download/v#{version}/connexions-v#{version}-linux-arm64"
      sha256 "72ad774b992f1e9b0977a8e3323157cfa95556e39bc79eae5f6c0de06c0b74c4"
    else
      url "https://github.com/mockzilla/connexions/releases/download/v#{version}/connexions-v#{version}-linux-amd64"
      sha256 "c58176dda4eee21622b61408587604f836e1d38074e0ac1a34a47cb749348d06"
    end
  end

  def install
    binary = Dir["connexions-*"].first
    bin.install binary => "connexions"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/connexions --version")
  end
end
