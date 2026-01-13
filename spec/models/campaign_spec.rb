describe Campaign, type: :model do
  before do
    @campaign = build(:campaign)
  end

  subject { @campaign }

  it 'should be valid' do
    @campaign.should be_valid
  end

  describe 'Associations' do
    it { should have_many(:recipients) }
  end # Associations

  describe 'Validations' do
    it { should validate_presence_of(:title) }

    it { should validate_presence_of(:status) }
    it { should validate_inclusion_of(:status).in_array(Campaign::STATUSES) }\
  end # Validations

  describe 'Methods' do

  end # Methods

  describe 'Callbacks' do

  end # Callbacks

  describe 'Class Methods' do
    before do
      @campaign.save!
    end

    describe 'Scopes' do
      before do
        @other_campaign = create(:campaign)
      end
    end # Scopes
  end # Class Methods
end
