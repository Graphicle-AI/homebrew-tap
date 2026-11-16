# Formula/graphicle.rb of the graphicle-ai/homebrew-tap repository:
#   brew install graphicle-ai/tap/graphicle
# Written by packaging/homebrew/fill_formula.py from graphicle.rb.in in
# https://github.com/graphicle-ai/graphicle; edit the template, not the tap.
class Graphicle < Formula
  desc "Persistent source-backed memory and code knowledge graphs for your work"
  homepage "https://github.com/graphicle-ai/graphicle"
  version "0.1.18"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/graphicle-ai/graphicle/releases/download/v0.1.18/graphicle-0.1.18-aarch64-apple-darwin.tar.gz"
      sha256 "6ad1bcf1057785973bbf6d4bfc633167dfa90a6636aa527c8f668c0bb9084c1a"
    end
    on_intel do
      url "https://github.com/graphicle-ai/graphicle/releases/download/v0.1.18/graphicle-0.1.18-x86_64-apple-darwin.tar.gz"
      sha256 "9b39b4bbad2a328734fa182a84f7369a37d667ba496d108f77527e474c2a6d37"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/graphicle-ai/graphicle/releases/download/v0.1.18/graphicle-0.1.18-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a7c8384370d6162232586d316b29a3242807c4497bac8b81e47ac457a46853bf"
    end
    on_intel do
      url "https://github.com/graphicle-ai/graphicle/releases/download/v0.1.18/graphicle-0.1.18-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "db99cb3fa8a3a8ee1850b14355d07090535c5f6be9a32b371a51b476a8a43159"
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
