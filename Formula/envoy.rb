require 'formula'

class Envoy < Formula
  homepage 'http://laravel.com/docs/ssh#envoy-task-macros'
  url 'https://github.com/laravel/envoy/raw/master/envoy.phar'
  sha1 '00401ec8014a1744bebae14f8411fde6f2db551b'
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
