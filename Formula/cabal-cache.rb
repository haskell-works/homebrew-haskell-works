class CabalCache < Formula
  desc "Haskell cabal store caching tool"
  homepage "https://github.com/haskell-works/cabal-cache"
  url "https://github.com/haskell-works/cabal-cache/archive/v1.0.5.1.tar.gz"
  sha256 "912c7d08d9296a49a75ff25cf03b35b741e7c2198293d553b732d6d1dd29baaf"
  license "BSD-3-Clause"
  head "https://github.com/haskell-works/cabal-cache.git", branch: "main"

  bottle do
    # sha256 cellar: :any_skip_relocation, ventura:        "66e5d594e32b86480288e83ae9589c754e9796a6148b8b4992c1bb405688c7ef"
  end

  depends_on "cabal-install@3.8.1.0" => :build
  depends_on "ghc@8.10.7" => :build

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
