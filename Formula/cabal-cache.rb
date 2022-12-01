class CabalCache < Formula
  desc "Haskell cabal store caching tool"
  homepage "https://github.com/haskell-works/cabal-cache"
  url "https://github.com/haskell-works/cabal-cache/archive/v1.0.5.1.tar.gz"
  sha256 "912c7d08d9296a49a75ff25cf03b35b741e7c2198293d553b732d6d1dd29baaf"
  license "BSD-3-Clause"
  head "https://github.com/haskell-works/cabal-cache.git", branch: "main"

  bottle do
    rebuild 1
    root_url "https://github.com/haskell-works/homebrew-haskell-works/releases/download/cabal-cache-1.0.5.1"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "d1bfa48161297265cb4338a1bbb1c241192c06b2bc5cae3166faf55b7cf02cd1"
  end

  depends_on "cabal-install" => :build
  depends_on "ghc@8.10" => :build

  def install
    system "cabal", "v2-update"
    # Work around build failure by enabling `ghc-lib` flag
    # lib/Language/Haskell/Stylish/GHC.hs:71:32: error:
    #     • Couldn't match expected type 'GHC.Settings'
    #                   with actual type 'ghc-lib-parser-9.2.4.20220729:GHC.Settings.Settings'
    # Issue ref: https://github.com/haskell/stylish-haskell/issues/405
    system "cabal", "v2-install", *std_cabal_v2_args, "--flags=+ghc-lib"
  end
end
