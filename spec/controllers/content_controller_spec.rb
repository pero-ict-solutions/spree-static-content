require File.dirname(__FILE__) + '/../spec_helper'

describe ContentController do
  
  before(:each) do
    @page = mock("page")

    # Generally, prefer stub! over should_receive in setup.
    @page.stub!(:slug).and_return('test')
    @page.stub!(:title).and_return('Testing 123')
    @page.stub!(:body).and_return('This is a test... cooool')
  end
  
  it "should use the catch all route to place path in path variable" do
    params_from(:get, "/foobar").should == {:controller => "content", :action => "show", :path=>["foobar"]}
  end
  
  it "should render a 404 when no content is found by the given slug" do
    
    get 'show', :path=>["foobar"]
    response.should render_template("#{RAILS_ROOT}/public/404.html")
    response.headers["Status"].should == "404 Not Found"
  end
  
  it "should render the page when the slug is correct" do
    get 'show', :path=>["test"]
    
    Page.should_receive(:find_by_slug).with('test').and_return(@page)
    response.should be_success
    assigns[:page].should equal(@page)
  end
  
end