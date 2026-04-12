class Connexions < Formula
  desc "Generate APIs with meaningful responses, configurable latency, error codes and more"
  homepage "https://mockzilla.github.io/connexions/"
  version "2.1.91"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mockzilla/connexions/releases/download/v#{version}/connexions-v#{version}-darwin-arm64"
      sha256 "e3497725487509b6cc8cfe6e173dac4b4b7522e8c394b8a677ef2fd9582cf29c"
    else
      url "https://github.com/mockzilla/connexions/releases/download/v#{version}/connexions-v#{version}-darwin-amd64"
      sha256 "2f4a88f871f535eb33b1a4d1a3b1c5741484c11d5a0c65422b6db00a5fc553a4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mockzilla/connexions/releases/download/v#{version}/connexions-v#{version}-linux-arm64"
      sha256 "211ae67bda3700cfcbf2debd738d270c3d2cd30d0ab6e113db44e29def635873"
    else
      url "https://github.com/mockzilla/connexions/releases/download/v#{version}/connexions-v#{version}-linux-amd64"
      sha256 "4ddce3776ba54d4ec4ea8e9aeb5b46cd4d276bcdb73e41147e775487f47d1f0d"
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
