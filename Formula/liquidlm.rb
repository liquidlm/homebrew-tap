# Staging copy. Final home: liquidlm/homebrew-tap → Formula/liquidlm.rb
# sha256 computed from the local `npm pack` tarball (npm pack is deterministic
# for identical content). Verify it against the registry after `npm publish`:
#   curl -fsSL https://registry.npmjs.org/@liquidlm/cli/-/cli-0.1.3.tgz | shasum -a 256
class Liquidlm < Formula
  desc "Command-line interface for LiquidLM knowledge vaults"
  homepage "https://liquidlm.com"
  url "https://registry.npmjs.org/@liquidlm/cli/-/cli-0.1.3.tgz"
  sha256 "b81cabcb4e75810f527b892e0f2bf7f8e9d4bac1a9971814f7a9dfb285fb4c11"
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
