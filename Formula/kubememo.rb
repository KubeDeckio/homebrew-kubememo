class Kubememo < Formula
  desc "Kubernetes operational memory with durable memos, runtime notes, and activity capture"
  homepage "https://kubememo.kubedeck.io"
  url "https://github.com/KubeDeckio/KubeMemo/archive/refs/tags/v0.0.1-rc3.tar.gz"
  sha256 "c86d2d274de8a0b7873ce831ed61a8b3f717d15988c85dabad0e3e2fd1b7ccec"
  license "MIT"
  depends_on "go" => :build

  def install
    system "go", "build", "-trimpath", "-ldflags", "-s -w", "-o", bin/"kubememo", "./cmd/kubememo"
  end

  test do
    assert_match "kubememo", shell_output("#{bin}/kubememo version")
  end
end
