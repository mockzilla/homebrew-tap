class Connexions < Formula
  desc "Generate APIs with meaningful responses, configurable latency, error codes and more"
  homepage "https://mockzilla.github.io/connexions/"
  version "2.1.76"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mockzilla/connexions/releases/download/v#{version}/connexions-v#{version}-darwin-arm64"
      sha256 "8ead0c524e22d34869c1a037c1c8ec94a1ab5f74e63c6eec59183ec5312cdd54"
    else
      url "https://github.com/mockzilla/connexions/releases/download/v#{version}/connexions-v#{version}-darwin-amd64"
      sha256 "f59fb3f293e009db3572b09cfdaa26e4a5214852994d6e51d432dee25c689d7c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mockzilla/connexions/releases/download/v#{version}/connexions-v#{version}-linux-arm64"
      sha256 "1d18433c3c591f96f686ca1f7c162a63d58628fc49e92b314826c695a9566750"
    else
      url "https://github.com/mockzilla/connexions/releases/download/v#{version}/connexions-v#{version}-linux-amd64"
      sha256 "a566d3aa535f8c07070033bb604781eeb239f7f5d642a21e5bbe392ff6ee2fc3"
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
