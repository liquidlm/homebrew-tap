# Staging copy. Final home: liquidlm/homebrew-tap → Formula/liquidlm.rb
# sha256 computed from the local `npm pack` tarball (npm pack is deterministic
# for identical content). Verify it against the registry after `npm publish`:
#   curl -fsSL https://registry.npmjs.org/@liquidlm/cli/-/cli-0.1.1.tgz | shasum -a 256
class Liquidlm < Formula
  desc "Command-line interface for LiquidLM knowledge vaults"
  homepage "https://liquidlm.com"
  url "https://registry.npmjs.org/@liquidlm/cli/-/cli-0.1.1.tgz"
  sha256 "3c6fff2e2328e86da2fd56ef30cdd7d6fae003ab35e58166e4fe2d50177f820d"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/liquidlm --version")
  end
end
