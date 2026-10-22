# Formula/graphicle.rb of the graphicle-ai/homebrew-tap repository:
#   brew install graphicle-ai/tap/graphicle
# Written by packaging/homebrew/fill_formula.py from graphicle.rb.in in
# https://github.com/graphicle-ai/graphicle; edit the template, not the tap.
class Graphicle < Formula
  desc "Persistent source-backed memory and code knowledge graphs for your work"
  homepage "https://github.com/graphicle-ai/graphicle"
  version "0.1.4"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/graphicle-ai/graphicle/releases/download/v0.1.4/graphicle-0.1.4-aarch64-apple-darwin.tar.gz"
      sha256 "04192d0a729ab76efebe120ba62911c16ce9789c9469d8c16ec2b6fd69236624"
    end
    on_intel do
      url "https://github.com/graphicle-ai/graphicle/releases/download/v0.1.4/graphicle-0.1.4-x86_64-apple-darwin.tar.gz"
      sha256 "0c7e2df33494b08b8eac39ad2209051981419deef395c5b6479ae3f477dc02ed"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/graphicle-ai/graphicle/releases/download/v0.1.4/graphicle-0.1.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4187df246c72611c5d3adb5be5c62ddac517e256f38b9b8ae0e7054b31158605"
    end
    on_intel do
      url "https://github.com/graphicle-ai/graphicle/releases/download/v0.1.4/graphicle-0.1.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e196b830b69506517a1deda61a5a33e911ba61f471739c09dd8578ec61330003"
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
