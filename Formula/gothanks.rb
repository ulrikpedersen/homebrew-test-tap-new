class Gothanks < Formula
  desc "Automatically star your go.mod Github dependencies"
  homepage "https://github.com/psampaz/gothanks"
  url "https://github.com/psampaz/gothanks/archive/v0.3.0.tar.gz"
  sha256 "ce5440334b3eac2e058724faa4c6e4478ca1d81ea087e55ccca33f1996752aad"
  license "MIT"
  revision 1

  bottle do
    root_url "https://github.com/ulrikpedersen/homebrew-test-tap-new/releases/download/gothanks-0.3.0_1"
    cellar :any_skip_relocation
    sha256 "fd9ba06f01d89a0d22fdb29eb772a33a680d82114fabe3cedcddafcfe1be41b7" => :catalina
    sha256 "81bbcb8277b8aa6044dd0096df217099c6812c96fd6f6b870cc26bc7d9db86db" => :x86_64_linux
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args
  end

  test do
    ENV.delete "GITHUB_TOKEN"
    assert_match "no Github token found", shell_output(bin/"gothanks", 255)
  end
end
