require File.dirname(__FILE__) + '/../spec_helper'

describe Spree::Page do
  before(:each) do
    @page = Spree::Page.create(
    :title => 'test page',
    :slug => 'test-page',
    :body => 'this is a test page'
    )
  end

  it "should be valid" do
    @page.should be_valid
  end

  it "should add an / to the slug" do
    @page.slug.should == "/test-page"
  end

end
