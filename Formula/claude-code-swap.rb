class ClaudeCodeSwap < Formula
  include Language::Python::Virtualenv

  desc "Switch Claude Code provider profiles with one command"
  homepage "https://github.com/tensakulabs/claude-code-swap"
  url "https://github.com/tensakulabs/claude-code-swap/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "491efc3fe53d4fa9e2afe9b3b982a9a5b2fa0f15652189a032db7f6d97bc84c3"
  license "MIT"

  depends_on "python@3.12"

  resource "pyyaml" do
    url "https://files.pythonhosted.org/packages/05/8e/961c0007c59b8dd7729d542c61a4d537767a59645b82a0b521206e1e25c2/pyyaml-6.0.3.tar.gz"
    sha256 "d76623373421df22fb4cf8817020cbb7ef15c725b9d5e45f17e189bfc384190f"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ccs --version")
  end
end
