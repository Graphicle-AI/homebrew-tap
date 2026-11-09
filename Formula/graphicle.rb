# Formula/graphicle.rb of the graphicle-ai/homebrew-tap repository:
#   brew install graphicle-ai/tap/graphicle
# Written by packaging/homebrew/fill_formula.py from graphicle.rb.in in
# https://github.com/graphicle-ai/graphicle; edit the template, not the tap.
class Graphicle < Formula
  desc "Persistent source-backed memory and code knowledge graphs for your work"
  homepage "https://github.com/graphicle-ai/graphicle"
  version "0.1.14"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/graphicle-ai/graphicle/releases/download/v0.1.14/graphicle-0.1.14-aarch64-apple-darwin.tar.gz"
      sha256 "807bbde2ad317efbb1236a32601f1bf49a0c5d7ee0364e31047193d16a6c34bf"
    end
    on_intel do
      url "https://github.com/graphicle-ai/graphicle/releases/download/v0.1.14/graphicle-0.1.14-x86_64-apple-darwin.tar.gz"
      sha256 "4d1b8f5053af9e8d4ef6d2c537c3377f775dcaf0d477d0e67767e06453d212dc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/graphicle-ai/graphicle/releases/download/v0.1.14/graphicle-0.1.14-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b213d86484ea9ef47f45c597c2513d5b789227a25328a3e1e04cc34eaf9668c8"
    end
    on_intel do
      url "https://github.com/graphicle-ai/graphicle/releases/download/v0.1.14/graphicle-0.1.14-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7e35764d2952b661d7b32e804f56efa913eb4f294a03469b7daa979f8daa609c"
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
