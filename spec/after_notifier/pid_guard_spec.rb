require 'spec_helper'
require 'open3'

describe AfterNotifier::PidGuard do
  let(:current_pid) { Process.pid }

  describe '#finished?' do
    it 'Should raise error, at first unkonwn pid' do
      guard = AfterNotifier::PidGuard.new(999999999)
      expect(guard).to receive(:exists?).and_return(false)
      expect {
        guard.finished?
      }.to raise_error AfterNotifier::UnknownPid
    end

    it '' do
      guard = AfterNotifier::PidGuard.new(current_pid)

      # At first true, second false.
      expect(guard).to receive(:exists?).exactly(2).and_return(true, false)
      expect(guard.finished?).to be true
    end

  end

  describe '#exists?' do
    it 'Should return true when running process' do
      guard = AfterNotifier::PidGuard.new(current_pid)
      expect(guard.send(:exists?)).to be true
    end

    it 'Should return false when not exist process' do
      guard = AfterNotifier::PidGuard.new(999999999)
      expect(guard.send(:exists?)).to be false
    end
  end
end
