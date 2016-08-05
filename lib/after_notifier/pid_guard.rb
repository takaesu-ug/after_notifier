module AfterNotifier
  class UnknownPid < StandardError; end

  class PidGuard
    SLEEP_TIME = 2

    def initialize(pid)
      @pid = pid.to_i
    end

    def finished?
      # At first PID should be exisited.
      raise UnknownPid, 'Should set exist PID' unless exists?

      loop do
        return true unless exists?
        sleep SLEEP_TIME
      end
    end

    private

    def exists?
      !!::Process.kill(0, @pid) rescue false # signal 0 process alive monitoring
    end
  end
end
