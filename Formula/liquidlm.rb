# Staging copy. Final home: liquidlm/homebrew-tap → Formula/liquidlm.rb
# The sha256 MUST be taken from the registry AFTER `npm publish` — a local
# `npm pack` can differ byte-for-byte (formatting passes touching package.json
# between pack and publish bit us on 0.1.3):
#   curl -fsSL https://registry.npmjs.org/@liquidlm/cli/-/cli-<version>.tgz | shasum -a 256
class Liquidlm < Formula
  desc "Command-line interface for LiquidLM knowledge vaults"
  homepage "https://liquidlm.com"
  url "https://registry.npmjs.org/@liquidlm/cli/-/cli-0.1.4.tgz"
  sha256 "f413a8e2c1eceef442087f34e60bd53ab56f725829f2138c2d606fae14d5a90e"
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
