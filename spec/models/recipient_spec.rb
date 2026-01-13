describe Recipient, type: :model do
  before do
    @recipient = build(:recipient)
  end

  subject { @recipient }

  it 'should be valid' do
    @recipient.should be_valid
  end

  describe 'Associations' do
    it { should belogn_to(:campaign).required }
  end # Associations

  describe 'Validations' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }

    it { should validate_presence_of(:status) }
    it { should validate_inclusion_of(:status).in_array(Recipient::STATUSES) }
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
