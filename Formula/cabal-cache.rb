require "language/haskell"

class CabalCache < Formula
  include Language::Haskell::Cabal

  desc "CI configuration tool"
  homepage "https://github.com/haskell-works/cabal-cache"
  url "https://github.com/haskell-works/cabal-cache/archive/v0.2.0.2.tar.gz"
  sha256 "70d9b28c073d59f3574da2cb0735d3556ec7605def38b3486dbc5981771781a0"
  head "https://github.com/haskell-works/cabal-cache"

  depends_on "ghc" => :build
  depends_on "cabal-install" => :build

  def install
    install_cabal_package

    # Build bash completion
    (bash_completion/"cabal-cache").write `#{bin}/cabal-cache --bash-completion`
  end

  bottle do
    root_url "https://github.com/haskell-works/homebrew-haskell-works/releases/download/cabal-cache-0.2.0.2"
    cellar :any_skip_relocation
    sha256 "b611873018d0cd9c291cc7660391d699c01037fa5d9068ae166e8a7606595568" => :sierra
  end

  test do
    assert_match "cabal-cache 0.2.0.2", pipe_output("#{bin}/cabal-cache version", "", 0)
  end
end
