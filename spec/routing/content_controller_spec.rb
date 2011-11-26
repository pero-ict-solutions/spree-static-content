require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ContentController do
  
  it "should use the catch all route to place path in path variable" do
    
    { :get => "/foobar" }.
      should route_to(
        :controller => "content",
        :action => "show",
        :path => "foobar"
      )
  end
  
end