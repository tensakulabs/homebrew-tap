class ClaudeCodeSwap < Formula
  desc "Switch Claude Code provider profiles with one command"
  homepage "https://github.com/tensakulabs/claude-code-swap"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tensakulabs/claude-code-swap/releases/download/v#{version}/ccs-macos-aarch64.tar.gz"
      sha256 "49974585f2f0a9c53cd9fa7039590e34c204e23de468e9ee0355bbdf3349e0a4"
    else
      url "https://github.com/tensakulabs/claude-code-swap/releases/download/v#{version}/ccs-macos-x86_64.tar.gz"
      sha256 "3447a9ee4dcda4b196e580121fbebfdddebab3486fb243a77b7a8c8cf8eebc23"
    end
  end

  on_linux do
    url "https://github.com/tensakulabs/claude-code-swap/releases/download/v#{version}/ccs-linux-x86_64.tar.gz"
    sha256 "cbd022cf4b891dc859290069006ae1170c9345a5aebc6918bd4d11e8fa8b812d"
  end

  def install
    bin.install "ccs"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ccs --version")
  end
end
