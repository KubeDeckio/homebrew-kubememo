class Kubememo < Formula
  desc "Kubernetes operational memory with durable memos, runtime notes, and activity capture"
  homepage "https://kubememo.kubedeck.io"
  url "https://github.com/KubeDeckio/KubeMemo/archive/refs/tags/v0.0.1-rc7.tar.gz"
  sha256 "edc06274ea484875d048fcf27d993852b5960e7cd1226cde10cbdbe18f6890d0"
  license "MIT"
  depends_on "go" => :build

  def install
    system "go", "build", "-trimpath", "-ldflags", "-s -w -X github.com/KubeDeckio/KubeMemo/internal/cli.version=0.0.1-rc7", "-o", bin/"kubememo", "./cmd/kubememo"
  end

  test do
    assert_match "\"version\": \"0.0.1-rc7\"", shell_output("#{bin}/kubememo version")
  end
end
