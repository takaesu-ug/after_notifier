module AfterNotifier
  class PidGuard
    def initialize(pid)
      @pid = pid
    end

    def exists?
      !!::Process.kill(0, @pid) rescue false # signal 0 process alive monitoring
    end
  end
end
