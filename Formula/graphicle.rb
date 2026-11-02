# Formula/graphicle.rb of the graphicle-ai/homebrew-tap repository:
#   brew install graphicle-ai/tap/graphicle
# Written by packaging/homebrew/fill_formula.py from graphicle.rb.in in
# https://github.com/graphicle-ai/graphicle; edit the template, not the tap.
class Graphicle < Formula
  desc "Persistent source-backed memory and code knowledge graphs for your work"
  homepage "https://github.com/graphicle-ai/graphicle"
  version "0.1.11"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/graphicle-ai/graphicle/releases/download/v0.1.11/graphicle-0.1.11-aarch64-apple-darwin.tar.gz"
      sha256 "1a209b0036d6df82155aa5352d03b0b0c62fcd9cde44490f6fa429aacb9f8bfe"
    end
    on_intel do
      url "https://github.com/graphicle-ai/graphicle/releases/download/v0.1.11/graphicle-0.1.11-x86_64-apple-darwin.tar.gz"
      sha256 "164ceb95aa865bcc5caab34334598c51f46eebee2f65ebee752fa126ffb10807"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/graphicle-ai/graphicle/releases/download/v0.1.11/graphicle-0.1.11-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9f45661168ef309c68ab4d61dc016c9525030f97debb513d25b3265598650d0d"
    end
    on_intel do
      url "https://github.com/graphicle-ai/graphicle/releases/download/v0.1.11/graphicle-0.1.11-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bd6c0b8cb3e793b0ed28ec4f8e7a3f03de85e8b3c4be7cd8cc7a92747be09838"
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
