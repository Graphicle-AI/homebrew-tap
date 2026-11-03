# Formula/graphicle.rb of the graphicle-ai/homebrew-tap repository:
#   brew install graphicle-ai/tap/graphicle
# Written by packaging/homebrew/fill_formula.py from graphicle.rb.in in
# https://github.com/graphicle-ai/graphicle; edit the template, not the tap.
class Graphicle < Formula
  desc "Persistent source-backed memory and code knowledge graphs for your work"
  homepage "https://github.com/graphicle-ai/graphicle"
  version "0.1.12"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/graphicle-ai/graphicle/releases/download/v0.1.12/graphicle-0.1.12-aarch64-apple-darwin.tar.gz"
      sha256 "83e795339e8cfa160a1f0ead7564acda5126b2c1ff7ee3f94c7e1fd5bfb0f038"
    end
    on_intel do
      url "https://github.com/graphicle-ai/graphicle/releases/download/v0.1.12/graphicle-0.1.12-x86_64-apple-darwin.tar.gz"
      sha256 "8ea2506d5a92fa171638ab7b60ef024fc82344b8ab6b1d824f9a3d9f3d632fab"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/graphicle-ai/graphicle/releases/download/v0.1.12/graphicle-0.1.12-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3f242a96b92335d78380d7ab9d4e8a22d39efbe1e11872d2d7dd4f2fe8f4923b"
    end
    on_intel do
      url "https://github.com/graphicle-ai/graphicle/releases/download/v0.1.12/graphicle-0.1.12-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "76f2b7a189a54e51273a7a93557463d1b68ae78e8299d0f4141802b62a9fbecb"
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
