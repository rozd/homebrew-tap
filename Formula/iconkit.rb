class Iconkit < Formula
  desc "CLI tool for working with Apple .icon bundles"
  homepage "https://github.com/rozd/icon-kit"
  url "https://github.com/rozd/icon-kit/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "aa6c698162c5b6cc2e685d19d207eb2bf3dcc571dffc2cc70971aa59fa10d6b7"
  license "MIT"

  depends_on xcode: ["16.0", :build]
  depends_on :macos

  def install
    system "swift", "build", "--disable-sandbox", "--configuration", "release"
    bin.install ".build/release/iconkit"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/iconkit --version")
  end
end
