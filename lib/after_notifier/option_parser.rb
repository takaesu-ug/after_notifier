require 'optparse'

module AfterNotifier
  class OptionParseError < StandardError; end

  class OptionParser
    attr_reader :pid, :terminal_notifier_options

    def initialize(argv)
      @pid = argv.shift
      @terminal_notifier_options = argv

      raise OptionParseError, 'Required PID' unless valid_pid?

      # When unset -message option, set default message.
      unless @terminal_notifier_options.include?("-message")
        @terminal_notifier_options.push(*["-message", "AFTER_NOTIFIER"])
      end
    end

    def valid_pid?
      # PID is number above 0.
      @pid.to_i > 0
    end
  end
end
