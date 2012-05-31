require 'spec_helper'

describe Spree::Issue do
  it "should be part of a magazine" do
    issue = Factory.build(:issue)
    issue.should respond_to(:magazine)
  end

  it "should be related to a variant which is the magazine" do
    issue = Factory.create(:issue)
    issue.magazine.should be_an_instance_of Spree::Variant
  end

  it "should not be valid if no magazine issue and no name is specified" do
    issue = Factory.build(:issue, :name => "", :magazine_issue => nil)
    issue.should_not be_valid
  end

  it "should have a name like the name of the magazine issue" do
    issue = Factory.create(:issue, :magazine_issue => Factory.create(:variant))
    issue.name.should equal(issue.magazine_issue.product.name)
  end

  it "should have the name attribute if no magazine issue is present" do
    issue = Factory.create(:issue, :name => "New Issue")
    issue.name.should == "New Issue"
  end
end