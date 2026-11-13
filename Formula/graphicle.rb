# Formula/graphicle.rb of the graphicle-ai/homebrew-tap repository:
#   brew install graphicle-ai/tap/graphicle
# Written by packaging/homebrew/fill_formula.py from graphicle.rb.in in
# https://github.com/graphicle-ai/graphicle; edit the template, not the tap.
class Graphicle < Formula
  desc "Persistent source-backed memory and code knowledge graphs for your work"
  homepage "https://github.com/graphicle-ai/graphicle"
  version "0.1.16"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/graphicle-ai/graphicle/releases/download/v0.1.16/graphicle-0.1.16-aarch64-apple-darwin.tar.gz"
      sha256 "bf90f3060e68ef775c1acc53113c9489f951c299bcde7a7f63b4f8499db46955"
    end
    on_intel do
      url "https://github.com/graphicle-ai/graphicle/releases/download/v0.1.16/graphicle-0.1.16-x86_64-apple-darwin.tar.gz"
      sha256 "3adf2ddba7ddf5162f3b59e527861b5ae7ac2d0dd9a7d4b6e587ba931f7008c4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/graphicle-ai/graphicle/releases/download/v0.1.16/graphicle-0.1.16-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4f51602352c998c93090b08841a9fea7995a899d58bca9edb929497581b8dda2"
    end
    on_intel do
      url "https://github.com/graphicle-ai/graphicle/releases/download/v0.1.16/graphicle-0.1.16-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cd308bd1beccc74d25d7ca715d2f3f56c7f7f5fd9cd64bd446533e28276919f9"
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
