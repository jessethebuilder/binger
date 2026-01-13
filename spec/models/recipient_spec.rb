describe Recipient, type: :model do
  before do
    @recipient = build(:recipient)
  end

  subject { @recipient }

  it 'should be valid' do
    @recipient.should be_valid
  end

  describe 'Associations' do
    it { should belong_to(:campaign).required }
  end # Associations

  describe 'Validations' do
    it { should validate_presence_of(:name) }
    it { should validate_inclusion_of(:status).in_array(Recipient::STATUSES).allow_nil }

    it 'should validate presence of :email AND :phone are not both blank' do
      @recipient.email = nil
      @recipient.phone = nil
      @recipient.valid?
      @recipient.errors[:email].should == ['and phone cannot both be blank']
    end

  end # Validations

  describe 'Methods' do

  end # Methods

  describe 'Callbacks' do

  end # Callbacks

  describe 'Class Methods' do
    before do
      @recipient.save!
    end

    describe 'Scopes' do
      before do
        @other_recipient = create(:recipient)
      end
    end # Scopes
  end # Class Methods
end
