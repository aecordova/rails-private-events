require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    described_class.new(name: 'example', email: 'example@mail.com')
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end
  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
  it 'is not valid without a email' do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a valid email' do
    subject.email = 'email.com'
    expect(subject).to_not be_valid
  end

  it 'is not valid with a email bigger than 250 characters' do
    subject.email = "example@mail.co#{'m' * 250}"
    expect(subject).to_not be_valid
  end

  it 'is not valid with a name bigger tan 100 characters' do
    subject.name = 'a' * 101
    expect(subject).to_not be_valid
  end

  it 'is not valid if there are the same email saved' do
    subject.save
    user = User.new(name: 'Other', email: 'example@mail.com')
    expect(user).to_not be_valid
  end

  describe 'Associations' do
    it { should have_many(:created_events) }
    it { should have_many(:event_attendances) }
    it { should have_many(:attending_events) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
  end
end
