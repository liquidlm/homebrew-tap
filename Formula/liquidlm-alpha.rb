# Prerelease track of the LiquidLM CLI (npm `alpha` dist-tag). Installs the
# same `liquidlm` binary as the stable formula — the two cannot be linked at
# the same time. The sha256 MUST come from the registry after `npm publish`:
#   curl -fsSL https://registry.npmjs.org/@liquidlm/cli/-/cli-<version>.tgz | shasum -a 256
class LiquidlmAlpha < Formula
  desc "Command-line interface for LiquidLM knowledge vaults (prerelease)"
  homepage "https://liquidlm.com"
  url "https://registry.npmjs.org/@liquidlm/cli/-/cli-0.2.0-alpha.1.tgz"
  version "0.2.0-alpha.1"
  sha256 "df8430e3c046c5ef613bdb6b45e8c7bf26d73747294ad5bcc3f5e29e973b30b8"
  license "MIT"

  depends_on "node"

  conflicts_with "liquidlm", because: "both install the `liquidlm` binary"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/liquidlm --version")
  end
end
