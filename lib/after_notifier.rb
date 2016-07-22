require "after_notifier/version"
require 'terminal-notifier'

require 'after_notifier/option_parser'

module AfterNotifier
  def self.run(argv)
    parser = AfterNotifier::OptionParser.new(argv)



    # TerminalNotifier.notify('Hello world')
    ap TerminalNotifier::BIN_PATH
    ap parser

    exec TerminalNotifier::BIN_PATH, *(parser.terminal_notifier_options)

    # optionparserrからオプションを通って
  end
end
