require "language/haskell"

class HwaCi < Formula
  include Language::Haskell::Cabal

  desc "CI configuration tool"
  homepage "https://github.com/haskell-works/hwa-ci"
  url "https://github.com/haskell-works/hwa-ci/archive/v0.1.0.0.tar.gz"
  sha256 "f9ac84bcdcdad559e44b7fd301bb4437136c2be23f304cd9742b93e623659af6"
  head "https://github.com/Gabriel439/Haskell-Dhall-JSON-Library"

  depends_on "ghc" => :build
  depends_on "cabal-install" => :build

  def install
    install_cabal_package
  end

  bottle do
    sha256 "db6ec38aced981628c1d0ba001a5405826236374c591c66f74d58baaa4e42dc8" => :sierra
  end

  test do
    assert_match "hwa-ci 0.1.0.0", pipe_output("#{bin}/hwa-ci version", "", 0)
  end
end
