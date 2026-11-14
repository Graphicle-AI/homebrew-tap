# Formula/graphicle.rb of the graphicle-ai/homebrew-tap repository:
#   brew install graphicle-ai/tap/graphicle
# Written by packaging/homebrew/fill_formula.py from graphicle.rb.in in
# https://github.com/graphicle-ai/graphicle; edit the template, not the tap.
class Graphicle < Formula
  desc "Persistent source-backed memory and code knowledge graphs for your work"
  homepage "https://github.com/graphicle-ai/graphicle"
  version "0.1.17"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/graphicle-ai/graphicle/releases/download/v0.1.17/graphicle-0.1.17-aarch64-apple-darwin.tar.gz"
      sha256 "d670db8170da9486744c71c08f36969f09755cbb7c6b79cbf3c2d216a8fb48f4"
    end
    on_intel do
      url "https://github.com/graphicle-ai/graphicle/releases/download/v0.1.17/graphicle-0.1.17-x86_64-apple-darwin.tar.gz"
      sha256 "2d560e2db0bbd6ab962c0b6c0f86e2e846945dc9a53b27f6902b097aea58ea32"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/graphicle-ai/graphicle/releases/download/v0.1.17/graphicle-0.1.17-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "37577c644239a3f07f0c2a6a31529e57ec2b04a50fa65947dd165ff5f5bef502"
    end
    on_intel do
      url "https://github.com/graphicle-ai/graphicle/releases/download/v0.1.17/graphicle-0.1.17-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5c554a44ad0f4dbfd1de9784a99912ea77c3f1e3e5fdd8bdbe50e207cf89ee22"
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
