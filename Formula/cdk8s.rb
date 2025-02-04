require "language/node"

class Cdk8s < Formula
  desc "Define k8s native apps and abstractions using object-oriented programming"
  homepage "https://cdk8s.io/"
  url "https://registry.npmjs.org/cdk8s-cli/-/cdk8s-cli-1.0.137.tgz"
  sha256 "de357385a315dbdf882b82e56e797e12be636a856badaf10b0902d72b4793b14"
  license "Apache-2.0"

  bottle do
    sha256 cellar: :any_skip_relocation, all: "22316ef5cc58e59de5d89cb2f817d8b4e305b092f4289cab45e86ac3ddfd2c2f"
  end

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match "Cannot initialize a project in a non-empty directory",
      shell_output("#{bin}/cdk8s init python-app 2>&1", 1)
  end
end
