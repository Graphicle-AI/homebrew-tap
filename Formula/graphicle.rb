# Formula/graphicle.rb of the graphicle-ai/homebrew-tap repository:
#   brew install graphicle-ai/tap/graphicle
# Written by packaging/homebrew/fill_formula.py from graphicle.rb.in in
# https://github.com/graphicle-ai/graphicle; edit the template, not the tap.
class Graphicle < Formula
  desc "Persistent source-backed memory and code knowledge graphs for your work"
  homepage "https://github.com/graphicle-ai/graphicle"
  version "0.1.8"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/graphicle-ai/graphicle/releases/download/v0.1.8/graphicle-0.1.8-aarch64-apple-darwin.tar.gz"
      sha256 "1a704a4d50754398c40736603a6ea61b0178f9bb6d3214e82af08b9463ca770f"
    end
    on_intel do
      url "https://github.com/graphicle-ai/graphicle/releases/download/v0.1.8/graphicle-0.1.8-x86_64-apple-darwin.tar.gz"
      sha256 "38529a5406bdd6e89140420a6309c496071677383c18df7ebbaf1d574dc7b1db"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/graphicle-ai/graphicle/releases/download/v0.1.8/graphicle-0.1.8-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f3d74e0cb66fc203b68a62c40c569f1e56b6d95d09b390dc45d7b8a19167ced2"
    end
    on_intel do
      url "https://github.com/graphicle-ai/graphicle/releases/download/v0.1.8/graphicle-0.1.8-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "654a7cb9f23758278c50ea2ed996920fa8875b5f09eac10ba2651fe9c4407f12"
    end
  end

  def install
    bin.install "graphicle", "graphicle-graph"
    # LICENSE, NOTICE, README.md and CHANGELOG.md are installed with the
    # formula's metadata.
    prefix.install Dir["NOTICE.md", "licenses"]
  end

  def caveats
    <<~EOS
      After an upgrade, run graphicle doctor --fix: it repairs agent entries
      that still start the previous version.

      By default, graphicle checks GitHub for a newer release at most once a
      day; to turn this off, run: graphicle config set update_notifier false

      Next: cd your-repo && graphicle setup
    EOS
  end

  test do
    assert_match "graphicle #{version}", shell_output("#{bin}/graphicle --version")
    assert_match "graphicle-graph #{version}", shell_output("#{bin}/graphicle-graph --version")
    assert_match "graphicle-graph #{version}", shell_output("#{bin}/graphicle graph --version")
  end
end
