# Formula/graphicle.rb of the graphicle-ai/homebrew-tap repository:
#   brew install graphicle-ai/tap/graphicle
# Written by packaging/homebrew/fill_formula.py from graphicle.rb.in in
# https://github.com/graphicle-ai/graphicle; edit the template, not the tap.
class Graphicle < Formula
  desc "Persistent source-backed memory and code knowledge graphs for your work"
  homepage "https://github.com/graphicle-ai/graphicle"
  version "0.1.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/graphicle-ai/graphicle/releases/download/v0.1.0/graphicle-0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "8c4b52625943f88201b22d6bce5532410dbdbd98454f00b71e72c05bc35a8c10"
    end
    on_intel do
      url "https://github.com/graphicle-ai/graphicle/releases/download/v0.1.0/graphicle-0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "bc35f457ecdc82dc6bb2f0b1e79001d17d1f2b704f2f047fff0ad60ef62c9997"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/graphicle-ai/graphicle/releases/download/v0.1.0/graphicle-0.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2c22329c781ff9e0822ec7e9343c7aa75a1fba926e26aeb8ac76c15c7e9c3053"
    end
    on_intel do
      url "https://github.com/graphicle-ai/graphicle/releases/download/v0.1.0/graphicle-0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "41491cd79e8150dfa7010e862d65d2cabbc1f78dfd51e3b9cf42af591ee1de6f"
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

      Next: cd your-repo && graphicle setup
    EOS
  end

  test do
    assert_match "graphicle #{version}", shell_output("#{bin}/graphicle --version")
    assert_match "graphicle-graph #{version}", shell_output("#{bin}/graphicle-graph --version")
    assert_match "graphicle-graph #{version}", shell_output("#{bin}/graphicle graph --version")
  end
end
