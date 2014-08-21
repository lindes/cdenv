require 'cdenv/path'
require 'cdenv/parser'
require 'cdenv/env'

module CDENV

  def self.find_method(name)
    CDENV.constants.collect{|k| CDENV.const_get(k)}.select {|k| k.is_a?(Class)}.each do |k|
      if(k.respond_to?(name)) then
        return k.method(name)
      end
    end
    return nil
  end


  def self.auto_detect_shell
    if(ENV['SHELL'] =~ /csh$/) then
      STDERR.puts("Sorry, CSH and its derivitives are not supported",
                  "please see http://www.faqs.org/faqs/unix-faq/shell/csh-whynot/ for insights.")
      exit 1
    end

    case ENV['SHELL']
    when /zsh$/  then :zsh
    when /bash$/ then :bash
    else :generic
    end
  end

  def self.do_install_or_uninstall(shell, install, quiet)
    if(install) then
      STDERR.puts "Installing cdenv for #{shell.to_s}" unless(quiet)
      # luckily this part works for all supported shells:
      puts <<EOF
do_cdenv () {
  eval "`cdenv --#{shell.to_s} "$OLDPWD" "$PWD"`"
}
EOF
      puts case shell
           when :zsh     then "chpwd_functions+=(do_cdenv)"
           when :bash,
                :generic then <<EOF
_do_cd () {
  unset -f cd;
  cd "$@";
  do_cdenv "$OLDPWD" "$PWD";
  cd () { _do_cd "$@" ;};
}
cd () {
  _do_cd "$@";
}
EOF
           end
    else
      STDERR.puts "Removing cdenv for #{shell.to_s}" unless(quiet)
      puts "if typeset -f do_cdenv >/dev/null; then unset -f do_cdenv; fi"
      puts case shell
           when :zsh     then "set -A chpwd_functions ${chpwd_functions:#do_cdenv}"
           when :bash,
                :generic then "unset -f cd"
           end
    end
  end

end
