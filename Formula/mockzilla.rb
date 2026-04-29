class Mockzilla < Formula
  desc "Generate APIs with meaningful responses, configurable latency, error codes and more"
  homepage "https://mockzilla.github.io/mockzilla/"
  version "2.1.100"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mockzilla/mockzilla/releases/download/v#{version}/mockzilla-v#{version}-darwin-arm64"
      sha256 "0c34c29af78fb9b461df85a3960ed85a3617cdf005a278b5675c262d54d4fb26"
    else
      url "https://github.com/mockzilla/mockzilla/releases/download/v#{version}/mockzilla-v#{version}-darwin-amd64"
      sha256 "ef588c677a57012a645bac643e1c749bc256840f792e599c8a70635f930c0ce6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mockzilla/mockzilla/releases/download/v#{version}/mockzilla-v#{version}-linux-arm64"
      sha256 "e3fcd0e9e876568e6157199cae5e2200012f738015366df0e37146eb8c556f8d"
    else
      url "https://github.com/mockzilla/mockzilla/releases/download/v#{version}/mockzilla-v#{version}-linux-amd64"
      sha256 "0073fffea03b7bf6dd50b1c4b25b91b57397a76c1664fc3c65b6b5f86aa13369"
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
