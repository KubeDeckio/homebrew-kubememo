class Kubememo < Formula
  desc "Kubernetes operational memory with durable memos, runtime notes, and activity capture"
  homepage "https://kubememo.kubedeck.io"
  url "https://github.com/KubeDeckio/KubeMemo/archive/refs/heads/main.tar.gz"
  sha256 "e0af46737d69398564347f5cc81be190c17765e58ea1231ebc0b97bbdd48b04e"
  license "MIT"
  depends_on "go" => :build

  def install
    system "go", "build", "-trimpath", "-ldflags", "-s -w -X github.com/KubeDeckio/KubeMemo/internal/cli.version=dev", "-o", bin/"kubememo", "./cmd/kubememo"
  end

  test do
    assert_match '"version": "dev"', shell_output("#{bin}/kubememo version")
  end
end
