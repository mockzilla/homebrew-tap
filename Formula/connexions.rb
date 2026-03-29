class Connexions < Formula
  desc "Generate APIs with meaningful responses, configurable latency, error codes and more"
  homepage "https://mockzilla.github.io/connexions/"
  version "2.1.80"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mockzilla/connexions/releases/download/v#{version}/connexions-v#{version}-darwin-arm64"
      sha256 "85c8a8692b9f26f9723b44de7c393f938584af3034a258110713eaa2583017a2"
    else
      url "https://github.com/mockzilla/connexions/releases/download/v#{version}/connexions-v#{version}-darwin-amd64"
      sha256 "1e564df9d9d84591323912adbc402143f080c342d9ab5b3103298c4ace55c31d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mockzilla/connexions/releases/download/v#{version}/connexions-v#{version}-linux-arm64"
      sha256 "5f54b9a18401f4a162f4cc66aa359074b575c7f91fc877b295ccabdec5081c15"
    else
      url "https://github.com/mockzilla/connexions/releases/download/v#{version}/connexions-v#{version}-linux-amd64"
      sha256 "bea51d17576641ba6b3889fa2fcd720f0258e113792aa13f4e13c8c094ed3e26"
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
