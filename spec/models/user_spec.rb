require 'rails_helper'

RSpec.describe User, :type => :model do
  it "is valid with valid attributes" do
    user = User.new(name: 'foo', email: 'foo@bar.biz')
    expect(user).to be_valid
  end
  it "is not valid without a name" do
    user = User.new(name: nil, email: "example@mail.com")
    expect(user).to_not be_valid
  end
  it "is not valid without a email" do
    user = User.new(name: "foo", email: nil)
    expect(user).to_not be_valid
  end

  it "is not valid without a valid email" do
    user = User.new(name: "foo", email: 'email.com')
    expect(user).to_not be_valid
  end

  it "is not valid with a email bigger than 250 characters" do
    user = User.new(name: "example", email: "example@mail.co#{'m'*250}")
    expect(user).to_not be_valid
  end

  it 'is not valid with a name bigger tan 100 characters' do
    user = User.new(name: "a"*101, email: "example@mail.com")
    expect(user).to_not be_valid
  end

  it 'is not valid if there are the same email saved' do
    user = User.new(name: "example", email: "example@mail.com")
    user.save
    user = User.new(name: "Other", email: "example@mail.com")
    expect(user).to_not be_valid
  end
end