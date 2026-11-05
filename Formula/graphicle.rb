# Formula/graphicle.rb of the graphicle-ai/homebrew-tap repository:
#   brew install graphicle-ai/tap/graphicle
# Written by packaging/homebrew/fill_formula.py from graphicle.rb.in in
# https://github.com/graphicle-ai/graphicle; edit the template, not the tap.
class Graphicle < Formula
  desc "Persistent source-backed memory and code knowledge graphs for your work"
  homepage "https://github.com/graphicle-ai/graphicle"
  version "0.1.13"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/graphicle-ai/graphicle/releases/download/v0.1.13/graphicle-0.1.13-aarch64-apple-darwin.tar.gz"
      sha256 "0c5ad8ec0e62376602a8ba50b4767a38cccf602615c2debebcc31bb637754cd2"
    end
    on_intel do
      url "https://github.com/graphicle-ai/graphicle/releases/download/v0.1.13/graphicle-0.1.13-x86_64-apple-darwin.tar.gz"
      sha256 "b778cc5de6c0d928f236800d7d9389c1fcbe86b247f1570d72c9c8b83b824eda"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/graphicle-ai/graphicle/releases/download/v0.1.13/graphicle-0.1.13-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e9e65d71087a37564c1c858f51f6202e3d3356f4f2baa111fb0f3131afbeef38"
    end
    on_intel do
      url "https://github.com/graphicle-ai/graphicle/releases/download/v0.1.13/graphicle-0.1.13-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b175e33b3ae7128fa377ac65480b548e227d267840c5d7509132f9691c909afc"
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
