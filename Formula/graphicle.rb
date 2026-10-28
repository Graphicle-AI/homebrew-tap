# Formula/graphicle.rb of the graphicle-ai/homebrew-tap repository:
#   brew install graphicle-ai/tap/graphicle
# Written by packaging/homebrew/fill_formula.py from graphicle.rb.in in
# https://github.com/graphicle-ai/graphicle; edit the template, not the tap.
class Graphicle < Formula
  desc "Persistent source-backed memory and code knowledge graphs for your work"
  homepage "https://github.com/graphicle-ai/graphicle"
  version "0.1.9"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/graphicle-ai/graphicle/releases/download/v0.1.9/graphicle-0.1.9-aarch64-apple-darwin.tar.gz"
      sha256 "c407423b29c6a55b47696b85e9dc78a455dbef21f150298345242b205776e9e2"
    end
    on_intel do
      url "https://github.com/graphicle-ai/graphicle/releases/download/v0.1.9/graphicle-0.1.9-x86_64-apple-darwin.tar.gz"
      sha256 "8bff67858a29230d51b0c904f92aec1d103c4de4cf9ab20534899fdde2b91e30"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/graphicle-ai/graphicle/releases/download/v0.1.9/graphicle-0.1.9-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8f2461b648969c61b1802fbcb40abc24f39a9115c2d1402940ba14f39c4f6ff4"
    end
    on_intel do
      url "https://github.com/graphicle-ai/graphicle/releases/download/v0.1.9/graphicle-0.1.9-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d8de215e0a89f3c940173fc33d3eea73ef3df346ae821889f34b58424ee2014d"
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
