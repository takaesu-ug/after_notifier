require "after_notifier/version"
require 'terminal-notifier'

require 'after_notifier/option_parser'
require 'after_notifier/pid_guard'

module AfterNotifier
  def self.run(argv)
    parser = AfterNotifier::OptionParser.new(argv)

    if PidGuard.new(parser.pid).finished?
      exec TerminalNotifier::BIN_PATH, *(parser.terminal_notifier_options)
    end
  end
end
