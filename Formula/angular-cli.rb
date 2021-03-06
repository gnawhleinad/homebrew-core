require "language/node"

class AngularCli < Formula
  desc "CLI tool for Angular"
  homepage "https://cli.angular.io/"
  url "https://registry.npmjs.org/@angular/cli/-/cli-7.0.6.tgz"
  sha256 "931b75c5bd441fb00d95d266c8f5fc8e89b920238bf86837d3f7422c786bae91"

  bottle do
    sha256 "7b2d8365e0c78fca85d102efa4cb05b6bbb10b47adc3fdbf82e44359982e23e1" => :mojave
    sha256 "947fb5efc2ba89b2b70c28096053c3fd78b04bfab984ad1fc4aebc30eb536ec9" => :high_sierra
    sha256 "b70f0f06f0212b88478ab43da116cfb2cfb95a34f0d6f61e77edc892253daed9" => :sierra
  end

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    system bin/"ng", "new", "angular-homebrew-test", "--skip-install"
    assert_predicate testpath/"angular-homebrew-test/package.json", :exist?, "Project was not created"
  end
end
