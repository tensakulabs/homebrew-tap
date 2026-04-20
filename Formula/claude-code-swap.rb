class ClaudeCodeSwap < Formula
  desc "Switch Claude Code provider profiles with one command"
  homepage "https://github.com/tensakulabs/claude-code-swap"
  version "0.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tensakulabs/claude-code-swap/releases/download/v#{version}/ccs-macos-aarch64.tar.gz"
      sha256 "dfb22a349985497784239449b853fe8dd61fe369e8ca9f44e1423e6d4c59b4f9"
    else
      url "https://github.com/tensakulabs/claude-code-swap/releases/download/v#{version}/ccs-macos-x86_64.tar.gz"
      sha256 "56ae75c8895796f74019922a0c10298ed9b6b69389a5a3354d7506c650d803ef"
    end
  end

  on_linux do
    url "https://github.com/tensakulabs/claude-code-swap/releases/download/v#{version}/ccs-linux-x86_64.tar.gz"
    sha256 "cfc9ae6cf5aadd155ff1100484de18e16b220097894fa6848cf8e3168c68ae13"
  end

  def install
    bin.install "ccs"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ccs --version")
  end
end
