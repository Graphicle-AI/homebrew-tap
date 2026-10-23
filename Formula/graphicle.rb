# Formula/graphicle.rb of the graphicle-ai/homebrew-tap repository:
#   brew install graphicle-ai/tap/graphicle
# Written by packaging/homebrew/fill_formula.py from graphicle.rb.in in
# https://github.com/graphicle-ai/graphicle; edit the template, not the tap.
class Graphicle < Formula
  desc "Persistent source-backed memory and code knowledge graphs for your work"
  homepage "https://github.com/graphicle-ai/graphicle"
  version "0.1.5"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/graphicle-ai/graphicle/releases/download/v0.1.5/graphicle-0.1.5-aarch64-apple-darwin.tar.gz"
      sha256 "8c2fcd9818b4deb4e97b77dd86fedb5ee82fbe6dc3c19ddd7b1c9b70866a9766"
    end
    on_intel do
      url "https://github.com/graphicle-ai/graphicle/releases/download/v0.1.5/graphicle-0.1.5-x86_64-apple-darwin.tar.gz"
      sha256 "131329dac66db28dcbc5203982c8bc02f40f1cc0c5b79ed2e8b5f5b87a5dc39c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/graphicle-ai/graphicle/releases/download/v0.1.5/graphicle-0.1.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "079240740f264ce794ca2038167e359cd517770d37a7cb90a72ace36337de0da"
    end
    on_intel do
      url "https://github.com/graphicle-ai/graphicle/releases/download/v0.1.5/graphicle-0.1.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c94c2cf0f1bd2539e2a0ffafa6d2d829343234dd4bb5bc9cdc0e5ea486fbdfc9"
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
