class Mockzilla < Formula
  desc "Generate APIs with meaningful responses, configurable latency, error codes and more"
  homepage "https://mockzilla.github.io/mockzilla/"
  version "2.7.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mockzilla/mockzilla/releases/download/v#{version}/mockzilla-v#{version}-darwin-arm64"
      sha256 "ec6e3ed54e3be3655e36f497bea48f1f1d0f3147be318f5a3a450d30d487d201"
    else
      url "https://github.com/mockzilla/mockzilla/releases/download/v#{version}/mockzilla-v#{version}-darwin-amd64"
      sha256 "3c0e2709c8a048f5c06b9d24d864ff57ea85701c58e3f959cbc59273e8007eae"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mockzilla/mockzilla/releases/download/v#{version}/mockzilla-v#{version}-linux-arm64"
      sha256 "4f1c2e185e6c42d946c115dd02ae8b396d1f5fe9a073187e28a35d04e6dd3b20"
    else
      url "https://github.com/mockzilla/mockzilla/releases/download/v#{version}/mockzilla-v#{version}-linux-amd64"
      sha256 "5f65f64177ea63dd6415c86c2acbaae51be8532babc22c0ca4e5d805856c480c"
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
