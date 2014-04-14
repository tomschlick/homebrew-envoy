require 'formula'

class Envoy < Formula
  homepage 'http://laravel.com/docs/ssh#envoy-task-macros'
  url 'https://github.com/laravel/envoy/raw/master/envoy.phar'
  sha1 'db14aea752eba7157ac407d8f6b47e06ae93bb26'
  version '1.0.11'

  def install
    libexec.install "envoy.phar"
    sh = libexec + "envoy"
    sh.write("#!/usr/bin/env bash\n\n/usr/bin/env php -d allow_url_fopen=On -d detect_unicode=Off #{libexec}/envoy.phar $*")
    chmod 0755, sh
    bin.install_symlink sh
  end

  def caveats; <<-EOS.undent
    Verify your installation by running:
      "envoy --version".
    EOS
  end

end
