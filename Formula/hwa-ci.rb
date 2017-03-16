require "language/haskell"

class HwaCi < Formula
  include Language::Haskell::Cabal

  desc "CI configuration tool"
  homepage "https://github.com/haskell-works/hwa-ci"
  url "https://github.com/haskell-works/hwa-ci/archive/v0.1.0.2.tar.gz"
  sha256 "6cd2c65382df5eb91fe7a18d635aae2039becd17d315604633588a06ea86f462"
  head "https://github.com/haskell-works/hwa-ci"

  depends_on "ghc" => :build
  depends_on "cabal-install" => :build

  def install
    install_cabal_package

    # Build bash completion
    (bash_completion/"hwa-ci").write `#{bin}/hwa-ci --bash-completion-script hwa-ci`
  end

  bottle do
    root_url "https://github.com/haskell-works/homebrew-haskell-works/releases/download/hwa-ci-0.1.0.2"
    cellar :any_skip_relocation
    sha256 "c44ebccad5a135dd7cad7a529b0ff06bc7772e1e591aaff831aca79923ec9747" => :sierra
  end

  test do
    assert_match "hwa-ci 0.1.0.0", pipe_output("#{bin}/hwa-ci version", "", 0)
  end
end
