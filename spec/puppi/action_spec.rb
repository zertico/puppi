require "spec_helper"

describe Puppi::Action do
  
  before(:each) do
    Puppi::initial_checks
    Puppi::GenerateSampleData.helpers
    Puppi::GenerateSampleData.datafiles
  end
        
  it "should respond to check action" do
    Puppi::Action.new({:action => 'check', :puppi_module => nil}).should respond_to(:execute).with(1).argument
  end
  
  it "should respond to log action" do
    Puppi::Action.new({:action => 'log', :puppi_module => nil}).should respond_to(:execute).with(1).argument
  end
  
  it "should respond to info action" do
    Puppi::Action.new({:action => 'info', :puppi_module => nil}).should respond_to(:execute).with(1).argument
  end
  
  it "should not respond to an unknown action" do
    expect { Puppi::Action.new({:action => :unknow_action, :puppi_module => nil}) }.to raise_error Puppi::Exceptions::ActionNotFound
  end
  
  it "should return module name if puppi module is specified" do
    Puppi::Action.new({:action => 'check', :puppi_module => 'openssh'}).puppi_module.to_s.should match(/openssh/)
  end
  
  it "should return nil as module name name if no puppi module is specified" do
    Puppi::Action.new({:action => 'check', :puppi_module => nil}).puppi_module.should be_a(NilClass)
  end
  
  it "should return all command output when running info command" do
    output = Puppi::Action.new({:action => 'info', :puppi_module => nil}).output
    output.should be_an(Array)
    output.should have(2).items
    output.should include("+ hostname +\n")
    output.should include("+ openssh +\n")
  end
  
  subject { Puppi::Action.new({:action => 'check', :puppi_module => nil}).output }
  it "should return all command output when running check command" do
    should be_an(Array)
    should have(4).items
    should include("| hostname |\n")
    should include("| 0.1 |\n")
    should include("| openssh |\n")
    should include("| 1.0 |\n")
  end
end