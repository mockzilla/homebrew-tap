class Connexions < Formula
  desc "Generate APIs with meaningful responses, configurable latency, error codes and more"
  homepage "https://mockzilla.github.io/connexions/"
  version "2.1.75"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mockzilla/connexions/releases/download/v#{version}/connexions-v#{version}-darwin-arm64"
      sha256 "f10e27f8bcfa76e004196be29f55509059c68728f68dfd2540a762100ff64bb7"
    else
      url "https://github.com/mockzilla/connexions/releases/download/v#{version}/connexions-v#{version}-darwin-amd64"
      sha256 "b67fff2f6a7384f8c88cdf48a3026917e3ebc47547ac39099644c4a991004a1b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mockzilla/connexions/releases/download/v#{version}/connexions-v#{version}-linux-arm64"
      sha256 "14ff6dbe81549f6fc523c85116088bdc2462b9a7171c85a3235187f6d4d3901d"
    else
      url "https://github.com/mockzilla/connexions/releases/download/v#{version}/connexions-v#{version}-linux-amd64"
      sha256 "e81783d1b2b976991b9bf9a9c1c96e46657dc34cece023977973a5cdcfd96651"
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
