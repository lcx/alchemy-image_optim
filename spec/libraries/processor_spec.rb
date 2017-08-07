require "spec_helper"

module Alchemy::ImageOptim
  describe Processor do
    let(:processor) { Processor }

    describe ".call" do
      context "when an error occurs" do
        context "with 'raise_errors' configuration set to false" do
          before { Alchemy::ImageOptim.configuration.raise_errors = false }
          it "should not raise an error" do
            expect {processor.call("wrong argmument")}.to_not raise_error
          end
        end

        context "with 'raise_errors' configuration set to true" do
          before { Alchemy::ImageOptim.configuration.raise_errors = true }
          it "should raise an error" do
            expect {processor.call("wrong argmument")}.to raise_error
          end
        end
      end
    end
  end
end
