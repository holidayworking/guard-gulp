require 'guard'
require 'guard/guard'
require 'mkmf'
require 'timeout'

module Guard
  class Gulp < Guard
    DEFAULT_SIGNAL = :QUIT

    def initialize(watchers = [], options = {})
      @options = options
      @pid = nil
      @gulp_installed = gulp_installed?
      super
    end

    def start
      return unless @gulp_installed
      stop
      UI.info 'Starting gulp...'
      UI.info cmd

      @pid = spawn(env, cmd)
    end

    def stop
      if @pid
        UI.info 'Stopping gulp...'
        UI.info 'Stopped process gulp'
        ::Process.kill DEFAULT_SIGNAL, @pid
        begin
          Timeout.timeout(15) do
            ::Process.wait @pid
          end
        rescue Timeout::Error
          UI.info 'Sending SIGKILL to gulp, as it\'s taking too long to shutdown.'
          ::Process.kill :KILL, @pid
          ::Process.wait @pid
        end
        UI.info 'Stopped process guard'
      end
    rescue Errno::ESRCH
      UI.info 'Guard::Gulp lost the Gulp subprocess!'
    ensure
      @pid = nil
    end

    # Called on Ctrl-Z signal
    def reload
      UI.info 'Restarting gulp...'
      restart
    end

    # Called on Ctrl-/ signal
    def run_all
      true
    end

    # Called on file(s) modifications
    def run_on_changes(paths)
      restart
    end

    def restart
      stop
      start
    end

    private

    def cmd
      'gulp watch'
    end

    def env
      {}
    end

    def gulp_installed?
      if find_executable 'gulp'
        true
      else
        UI.error 'Please install gulp!'
        false
      end
    end
  end
end
