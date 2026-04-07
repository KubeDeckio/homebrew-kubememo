class Kubememo < Formula
  desc "Kubernetes operational memory with durable memos, runtime notes, and activity capture"
  homepage "https://kubememo.kubedeck.io"
  url "https://github.com/KubeDeckio/KubeMemo/archive/refs/tags/v0.0.1.tar.gz"
  sha256 "ddae33ca26e762a69ff6925a675171ab7415cbaf47e4bd96283c56281ebe3ba2"
  license "MIT"
  depends_on "go" => :build

  def install
    system "go", "build", "-trimpath", "-ldflags", "-s -w -X github.com/KubeDeckio/KubeMemo/internal/cli.version=0.0.1", "-o", bin/"kubememo", "./cmd/kubememo"
  end

  test do
    assert_match "\"version\": \"0.0.1\"", shell_output("#{bin}/kubememo version")
  end
end
