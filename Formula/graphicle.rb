# Formula/graphicle.rb of the graphicle-ai/homebrew-tap repository:
#   brew install graphicle-ai/tap/graphicle
# Written by packaging/homebrew/fill_formula.py from graphicle.rb.in in
# https://github.com/graphicle-ai/graphicle; edit the template, not the tap.
class Graphicle < Formula
  desc "Persistent source-backed memory and code knowledge graphs for your work"
  homepage "https://github.com/graphicle-ai/graphicle"
  version "0.1.10"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/graphicle-ai/graphicle/releases/download/v0.1.10/graphicle-0.1.10-aarch64-apple-darwin.tar.gz"
      sha256 "35c9fc328b10ea933b6c6afd994b884962900f5970a5fa05ff0e698e019e614b"
    end
    on_intel do
      url "https://github.com/graphicle-ai/graphicle/releases/download/v0.1.10/graphicle-0.1.10-x86_64-apple-darwin.tar.gz"
      sha256 "532b0d1fb2a3d795a26bc6ce9e85ecb328c7e5fdad3ced3093c60fda261a7853"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/graphicle-ai/graphicle/releases/download/v0.1.10/graphicle-0.1.10-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ee1d8e3ec49847e8458c5513557f4ca148c53f44174d6eb8a2d3cb4a2976ccb9"
    end
    on_intel do
      url "https://github.com/graphicle-ai/graphicle/releases/download/v0.1.10/graphicle-0.1.10-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "12eb500d31acc4e26fbc5a4e634209f9b6190b0780f60754e66686554a0bcb3e"
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
