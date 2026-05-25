class Mockzilla < Formula
  desc "Generate APIs with meaningful responses, configurable latency, error codes and more"
  homepage "https://mockzilla.github.io/mockzilla/"
  version "2.6.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mockzilla/mockzilla/releases/download/v#{version}/mockzilla-v#{version}-darwin-arm64"
      sha256 "1ce35fd11c84d6fac92f81fe354c8dbac98a005bed5451293ef9c1a71c863eef"
    else
      url "https://github.com/mockzilla/mockzilla/releases/download/v#{version}/mockzilla-v#{version}-darwin-amd64"
      sha256 "c2cfe7deb9faa8e286f60229aaf26f033a88243affd944fa6c1b541315d0d95a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mockzilla/mockzilla/releases/download/v#{version}/mockzilla-v#{version}-linux-arm64"
      sha256 "6e8201a5d2fd98d27508cb3d8d9c6e2af17089dc4499ade8eedac58d91d50cc3"
    else
      url "https://github.com/mockzilla/mockzilla/releases/download/v#{version}/mockzilla-v#{version}-linux-amd64"
      sha256 "5f1a7cb79188930b4480a690ac9ee8d7dc359a50aa5dbfeb046afac01d8ef08b"
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
