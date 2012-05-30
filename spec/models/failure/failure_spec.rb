require 'spec_helper'

describe "Exceptions::Failure" do
  context "Created Failure" do
    subject {Exception::Failure.create!(:type => "A", :message => "Hello", :backtrace => "Trace")}
    it "E" do
      binding.pry
      subject.message.should == "Hello"
    end
  end

  context "New Exception" do
    subject{ StandardError.new("An Error")}
    it "creates a notification" do
      Exception::Failure.notify("A",subject)
      Exception::Failure.last.message.should == "An Error"
    end
  end

  context "Exception spawned from Application" do
    subject{User.new}
    it "raises an exception" do
      Exception::Failure.should recieve(:notify)
      # subject.raise_exception
      # Exception::Failure.last.message.should == "Error from User"
    end

    # it ""
  end
end