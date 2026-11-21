# Formula/graphicle.rb of the graphicle-ai/homebrew-tap repository:
#   brew install graphicle-ai/tap/graphicle
# Written by packaging/homebrew/fill_formula.py from graphicle.rb.in in
# https://github.com/graphicle-ai/graphicle; edit the template, not the tap.
class Graphicle < Formula
  desc "Persistent source-backed memory and code knowledge graphs for your work"
  homepage "https://github.com/graphicle-ai/graphicle"
  version "0.1.19"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/graphicle-ai/graphicle/releases/download/v0.1.19/graphicle-0.1.19-aarch64-apple-darwin.tar.gz"
      sha256 "3969ca6897ac978e79514d92a48da587e344e796ccb993a6a10fc955a1c70ee2"
    end
    on_intel do
      url "https://github.com/graphicle-ai/graphicle/releases/download/v0.1.19/graphicle-0.1.19-x86_64-apple-darwin.tar.gz"
      sha256 "3d21ad9712c52547ca4c8f479da71fb6cb397de28b3de9241b7ac088cccb1390"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/graphicle-ai/graphicle/releases/download/v0.1.19/graphicle-0.1.19-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9f4e53f70f2357f7872783fce569693bd69e123a5ffde9fecdd4c59b3f785a58"
    end
    on_intel do
      url "https://github.com/graphicle-ai/graphicle/releases/download/v0.1.19/graphicle-0.1.19-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3210eed45103b8c2656f7caabae2c5d4479473f15482f852ac62716224ee9e2a"
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
