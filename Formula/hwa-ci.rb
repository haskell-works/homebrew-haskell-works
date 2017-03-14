require "language/haskell"

class HwaCi < Formula
  include Language::Haskell::Cabal

  desc "CI configuration tool"
  homepage "https://github.com/haskell-works/hwa-ci"
  url "https://github.com/haskell-works/hwa-ci/archive/v0.1.0.1.tar.gz"
  sha256 "70d9b28c073d59f3574da2cb0735d3556ec7605def38b3486dbc5981771781a0"
  head "https://github.com/haskell-works/hwa-ci"

  depends_on "ghc" => :build
  depends_on "cabal-install" => :build

  def install
    install_cabal_package
  end

  test do
    assert_match "hwa-ci 0.1.0.0", pipe_output("#{bin}/hwa-ci version", "", 0)
  end
end
