require File.dirname(__FILE__) + '/../spec_helper'

describe ContentController do
  
  before(:each) do
    @page = mock("page")

    # Generally, prefer stub! over should_receive in setup.
    @page.stub!(:slug).and_return('/test')
    @page.stub!(:title).and_return('Testing 123')
    @page.stub!(:body).and_return('This is a test... cooool')
  end
  
  it "should use the catch all route to place path in path variable" do
    params_from(:get, "/foobar").should == {:controller => "content", :action => "show", :path=>["foobar"]}
  end
  
end