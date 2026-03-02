class Tcr < Formula
  desc "Token Context Reducer - High-performance CLI proxy to minimize LLM token consumption"
  homepage "https://github.com/tensakulabs/tcr"
  version "0.22.2"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/tensakulabs/tcr/releases/download/v0.22.2/tcr-aarch64-apple-darwin.tar.gz"
    sha256 "adb081530589b5a246ab16211efd1411284135d9737ff15a8551715a075caf7f"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/tensakulabs/tcr/releases/download/v0.22.2/tcr-x86_64-apple-darwin.tar.gz"
    sha256 "be1fbfe05fa73544b9dbdcef8ca256bea1d8d4e9ad0601f21b44897787e86556"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/tensakulabs/tcr/releases/download/v0.22.2/tcr-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "c2dfb39f21cdf16712848a9be39ce48a1c60089d009d1e92f7851f7724badef8"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/tensakulabs/tcr/releases/download/v0.22.2/tcr-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "86a0731466b08a5139df16032f39933570e429359eacdc63d1c3b241a6a81039"
  end

  def install
    bin.install "tcr"
  end

  def caveats
    <<~EOS
      tcr is installed! Get started:

        # Initialize for Claude Code
        tcr init -g          # Global hook-first setup (recommended)
        tcr init             # Add to ./CLAUDE.md (this project only)

        # See all commands
        tcr --help

        # Measure your token savings
        tcr gain

      Full documentation: https://github.com/tensakulabs/tcr
    EOS
  end

  test do
    system "#{bin}/tcr", "--version"
  end
end
