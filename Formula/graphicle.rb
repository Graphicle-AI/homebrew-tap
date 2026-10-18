# Formula/graphicle.rb of the graphicle-ai/homebrew-tap repository:
#   brew install graphicle-ai/tap/graphicle
# Written by packaging/homebrew/fill_formula.py from graphicle.rb.in in
# https://github.com/graphicle-ai/graphicle; edit the template, not the tap.
class Graphicle < Formula
  desc "Persistent source-backed memory and code knowledge graphs for your work"
  homepage "https://github.com/graphicle-ai/graphicle"
  version "0.1.2"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/graphicle-ai/graphicle/releases/download/v0.1.2/graphicle-0.1.2-aarch64-apple-darwin.tar.gz"
      sha256 "15ad108fafa9c5110e886b9ab612c3109809e58f62a92e49103a5c7ecf2eb491"
    end
    on_intel do
      url "https://github.com/graphicle-ai/graphicle/releases/download/v0.1.2/graphicle-0.1.2-x86_64-apple-darwin.tar.gz"
      sha256 "c53381b2a063ff04a22566346a42d07bc847290c0ea4856c4904eaf61f0093d8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/graphicle-ai/graphicle/releases/download/v0.1.2/graphicle-0.1.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ca5007731a5cc26be6ef4535702f64e0fb9c45c85d66991e5f8294ee6afbe835"
    end
    on_intel do
      url "https://github.com/graphicle-ai/graphicle/releases/download/v0.1.2/graphicle-0.1.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2483b9d8fdc65086b162f0f3d0282c37f711556779676a4b09adadf18840e3ad"
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
