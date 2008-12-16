require File.dirname(__FILE__) + '/../../spec_helper'

describe Admin::PagesController do

  #Delete this example and add some real ones
  it "should use Admin::PagesController" do
    controller.should be_an_instance_of(Admin::PagesController)
  end
  
  it "should render a 404 page when no page can be found" do
    get '/foobar'
    response.should be_not_found
  end
  
end
