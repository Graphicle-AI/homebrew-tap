# Formula/graphicle.rb of the graphicle-ai/homebrew-tap repository:
#   brew install graphicle-ai/tap/graphicle
# Written by packaging/homebrew/fill_formula.py from graphicle.rb.in in
# https://github.com/graphicle-ai/graphicle; edit the template, not the tap.
class Graphicle < Formula
  desc "Persistent source-backed memory and code knowledge graphs for your work"
  homepage "https://github.com/graphicle-ai/graphicle"
  version "0.1.15"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/graphicle-ai/graphicle/releases/download/v0.1.15/graphicle-0.1.15-aarch64-apple-darwin.tar.gz"
      sha256 "3060386418d3df57de1cd1b018a53fb3ab66a0d6ac91652c322524286b412e9d"
    end
    on_intel do
      url "https://github.com/graphicle-ai/graphicle/releases/download/v0.1.15/graphicle-0.1.15-x86_64-apple-darwin.tar.gz"
      sha256 "32f213490f245ff4d4e470792595426cfbd7629a07cb5299ee990fa23d1913f4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/graphicle-ai/graphicle/releases/download/v0.1.15/graphicle-0.1.15-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6b223a7ad8d0d799b50f2627cf5e17411a3b5f789f84a7b2890fdc23db5669c3"
    end
    on_intel do
      url "https://github.com/graphicle-ai/graphicle/releases/download/v0.1.15/graphicle-0.1.15-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b8432a8f755d4413945dd569d9967efeac0fc040c1583a86a455dc41f43fe759"
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
