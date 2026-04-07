class Kubememo < Formula
  desc "Kubernetes operational memory with durable memos, runtime notes, and activity capture"
  homepage "https://kubememo.kubedeck.io"
  url "https://github.com/KubeDeckio/KubeMemo/archive/refs/tags/v0.0.1-rc9.tar.gz"
  sha256 "2250f2ec8755b6e4910a2c148f949323dce24a48bf1846c1813c560d82c4c9ab"
  license "MIT"
  depends_on "go" => :build

  def install
    system "go", "build", "-trimpath", "-ldflags", "-s -w -X github.com/KubeDeckio/KubeMemo/internal/cli.version=0.0.1-rc9", "-o", bin/"kubememo", "./cmd/kubememo"
  end

  test do
    assert_match "\"version\": \"0.0.1-rc9\"", shell_output("#{bin}/kubememo version")
  end
end
