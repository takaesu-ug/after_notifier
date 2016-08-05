require 'spec_helper'

describe AfterNotifier::OptionParser do
  describe '.new' do 
    it 'Do not detect pid, Raise required pid' do
      argv = %w(-message hoge)
      expect {
        AfterNotifier::OptionParser.new(argv)
      }.to raise_error AfterNotifier::OptionParseError
    end

    it 'Unset -message option then absolutely set -message option' do
      argv = %w(234 -title hoge)
      parser = AfterNotifier::OptionParser.new(argv)
      expect(parser.terminal_notifier_options).to eq %w(-title hoge -message AFTER_NOTIFIER)
    end

    it 'Has a attriibute' do 
      argv = %w(234 -message hoge)
      parser = AfterNotifier::OptionParser.new(argv)

      expect(parser.pid).to eq '234'
      expect(parser.terminal_notifier_options).to eq %w(-message hoge)
    end
  end
end
