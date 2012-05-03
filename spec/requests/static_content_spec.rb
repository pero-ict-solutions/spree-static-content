require 'spec_helper'

describe 'Static Content Page' do

  before do
    Spree::Page.create(:slug => '/page', :title => 'Test Page', :body => 'Test page body')
  end

  it 'should render page when there is a query string' do
    visit '/page?test'
    page.should have_content('Test page body')
  end

end
