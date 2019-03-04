RSpec.describe Universities do
  it 'has a version number' do
    expect(Universities::VERSION).not_to be nil
  end

  describe 'when requesting all universities' do
    subject do
      VCR.use_cassette('universities/all', allow_playback_repeats: true) do
        described_class.get_all
      end
    end

    include_examples 'array of entities'
  end

  describe 'when requesting universities filtered by country (e.g. `Romania`)' do
    subject do
      VCR.use_cassette('universities/romania', allow_playback_repeats: true) do
        described_class.get.by_country('Romania').fetch
      end
    end

    include_examples 'array of entities'

    it 'returns entities with country `Romania`' do
      expect(subject.first).to have_attributes(country: 'Romania', alpha_two_code: 'RO')
    end
  end

  describe 'when requesting universities filtered by name (e.g. `Politehnica`)' do
    subject do
      VCR.use_cassette('universities/Politehnica', allow_playback_repeats: true) do
        described_class.get.by_name('Politehnica').fetch
      end
    end

    include_examples 'array of entities'
    
    it 'returns entities with name matching `Politehnica`' do
      expect(subject.first.name).to match(/Politehnica/)
    end
  end
  
  describe 'when requesting universities filtered by name (e.g. `Politehnica`) and country (e.g. `Romania`)' do
    subject do
      VCR.use_cassette('universities/Politehnica+Romania', allow_playback_repeats: true) do
        described_class.get.by_name('Politehnica').by_country('Romania').fetch
      end
    end

    include_examples 'array of entities'
    
    it 'returns entities with name matching `Politehnica`' do
      expect(subject.first.name).to match(/Politehnica/)
    end
    
    it 'returns entities with country `Romania`' do
      expect(subject.first).to have_attributes(country: 'Romania', alpha_two_code: 'RO')
    end
  end
end
