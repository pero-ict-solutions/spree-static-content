require File.dirname(__FILE__) + '/../spec_helper'

describe Page do
  before(:each) do
    @page = Page.new
  end

  it "should be valid" do
    @page.should be_valid
  end
end
