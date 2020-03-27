require 'rails_helper'

RSpec.describe Event, type: :model do
  let(:organizer) do
    User.new(name: 'example', email: 'example@mail.com')
  end

  subject do
    organizer.save
    described_class.new(name: 'example', description: 'example@mail.com', date: DateTime.now,
                        place: 'On my house', organizer_id: 1)
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'should be invalid without name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'should be invalid without description' do
    subject.description = nil
    expect(subject).to_not be_valid
  end

  it 'should be invalid without date' do
    subject.date = nil
    expect(subject).to_not be_valid
  end

  it 'should be invalid without place' do
    subject.place = nil
    expect(subject).to_not be_valid
  end

  describe 'Associations' do
    it { should belong_to(:organizer).without_validating_presence }
    it { should have_many(:event_attendances) }
    it { should have_many(:attendees) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:date) }
    it { should validate_presence_of(:place) }
  end
end
