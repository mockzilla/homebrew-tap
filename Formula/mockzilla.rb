class Mockzilla < Formula
  desc "Generate APIs with meaningful responses, configurable latency, error codes and more"
  homepage "https://mockzilla.github.io/mockzilla/"
  version "2.5.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mockzilla/mockzilla/releases/download/v#{version}/mockzilla-v#{version}-darwin-arm64"
      sha256 "0c9edfc20e2b7d38f53360b4df9dc3e4fddbb6507db3b92c904289b82e423338"
    else
      url "https://github.com/mockzilla/mockzilla/releases/download/v#{version}/mockzilla-v#{version}-darwin-amd64"
      sha256 "d987517198c76491ef20cc5bc5f047b06128e6421ff6f7fc2527aa0268d8cba1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mockzilla/mockzilla/releases/download/v#{version}/mockzilla-v#{version}-linux-arm64"
      sha256 "9c7a5bc5854627d09a748090f70c814b79e4a8e5ec47b24925b2cbdf7afc9998"
    else
      url "https://github.com/mockzilla/mockzilla/releases/download/v#{version}/mockzilla-v#{version}-linux-amd64"
      sha256 "bb1ec5c009aaa8acd5c1fba5c5ca07300077acd54ee5e243c3de57fe9d2dbefe"
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
