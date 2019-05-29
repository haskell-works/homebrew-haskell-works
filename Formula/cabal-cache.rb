require "language/haskell"

class CabalCache < Formula
  include Language::Haskell::Cabal

  desc "CI configuration tool"
  homepage "https://github.com/haskell-works/cabal-cache"
  url "https://github.com/haskell-works/cabal-cache/archive/v1.0.0.12.tar.gz"
  sha256 "6a8bb1347a67e274e2b1f3eea8171197e0cffccd3c12a17ecdda308edae77c32"
  head "https://github.com/haskell-works/cabal-cache"

  depends_on "ghc" => :build
  depends_on "cabal-install" => :build

  def install
    install_cabal_package

    # Build bash completion
    (bash_completion/"cabal-cache").write `#{bin}/cabal-cache --bash-completion`
  end

  bottle do
    root_url "https://github.com/haskell-works/homebrew-haskell-works/releases/download/cabal-cache-1.0.0.12"
    cellar :any_skip_relocation
    rebuild 1
    sha256 "384c306f4a47b7ae7db03c6dddb036bdb069c4d4e78d540d821c018b642069dc" => :mojave
  end

  # bottle do
  #   root_url "https://github.com/haskell-works/homebrew-haskell-works/releases/download/cabal-cache-1.0.0.1"
  #   cellar :any_skip_relocation
  #   rebuild 1
  #   sha256 "0ee131962af50b97bc90cb51500de18bf0769416c56c112948f9effd8d15911a" => :high_sierra
  # end

  test do
    assert_match "cabal-cache 0.2.0.2", pipe_output("#{bin}/cabal-cache version", "", 0)
  end
end
