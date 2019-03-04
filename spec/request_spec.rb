RSpec.describe Universities::Request do
  let(:request) { Universities::Request.new }

  describe 'when calling filters' do
    it 'responds to #country' do
      expect(request).to respond_to(:country).with(1).argument
    end

    it 'responds to alias method #by_country' do
      expect(request).to respond_to(:by_country).with(1).argument
    end

    it 'responds to #name' do
      expect(request).to respond_to(:name).with(1).argument
    end

    it 'responds to alias method #by_name' do
      expect(request).to respond_to(:by_name).with(1).argument
    end

    it 'responds to #fetch' do
      expect(request).to respond_to(:fetch)
    end
  end

  describe 'when using UpDupable module' do
    it '#country returns a new instance of Universities::Request' do
      expect(request.country('Romania')).to be_kind_of(described_class)
    end

    it '#name returns a new instance of Universities::Request' do
      expect(request.name('Romania')).to be_kind_of(described_class)
    end
  end

  describe 'when calling #fetch' do
    subject do
      VCR.use_cassette('universities/all', allow_playback_repeats: true) do
        request.fetch
      end
    end
    
    include_examples 'array of entities'
  end
end
