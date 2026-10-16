# Formula/graphicle.rb of the graphicle-ai/homebrew-tap repository:
#   brew install graphicle-ai/tap/graphicle
# Written by packaging/homebrew/fill_formula.py from graphicle.rb.in in
# https://github.com/graphicle-ai/graphicle; edit the template, not the tap.
class Graphicle < Formula
  desc "Persistent source-backed memory and code knowledge graphs for your work"
  homepage "https://github.com/graphicle-ai/graphicle"
  version "0.1.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/graphicle-ai/graphicle/releases/download/v0.1.1/graphicle-0.1.1-aarch64-apple-darwin.tar.gz"
      sha256 "07d6a89aa4a51bd4165b9e502f65059242822714cbe70cd686f48868784c2cec"
    end
    on_intel do
      url "https://github.com/graphicle-ai/graphicle/releases/download/v0.1.1/graphicle-0.1.1-x86_64-apple-darwin.tar.gz"
      sha256 "574d80e4817a602bfa6480fd69c0b85fb1bae5fa084d758e12c064e6b5c935a5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/graphicle-ai/graphicle/releases/download/v0.1.1/graphicle-0.1.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "00a0cf1f5b080883694c6cd08e6339d6e8fb6947fa3f5197d644773d868095aa"
    end
    on_intel do
      url "https://github.com/graphicle-ai/graphicle/releases/download/v0.1.1/graphicle-0.1.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9c92c76b111da52b2c52168b1c11853f0a46323b6d5e17664add803582e43863"
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
