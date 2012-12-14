require 'spec_helper'

describe 'Static Content Page' do
  it 'should render page when there is a query string' do
    Spree::Page.create(:slug => '/page', :title => 'Test Page', :body => 'Test page body')
    visit '/page?test'
    page.should have_content('Test page body')
  end

  it 'should render page with a slug not starting by /' do
    Spree::Page.create(:slug => 'page2', :title => 'Test Page 2', :body => 'Test page body 2')
    visit '/page2'
    page.should have_content('Test page body 2')
  end

  it "should render a custom root page" do
    Spree::Page.create(:slug => '/', :title => 'Root Page', :body => 'Root Body')
    visit '/'
    page.should have_content('Root Body')
  end

  it "should not effect the rendering of the rest of the site" do
    p = FactoryGirl.create :product
    visit spree.product_path(p)
    page.should have_content(p.name)
  end

end
