RSpec.describe Universities::Entity do
  let(:university_hash) do
    {
      "web_pages": ['http://www.pub.ro/'],
      "alpha_two_code": 'RO',
      "state-province": nil,
      "country": 'Romania',
      "domains": ['pub.ro'],
      "name": 'University Politehnica of Bucharest'
    }
  end

  let(:entity) { described_class.build(university_hash) }

  describe 'methods' do
    it 'responds to .build' do
      expect(described_class).to respond_to(:build).with(1).argument
    end
  end

  describe 'when calling attributes' do
    it 'returns the expected value' do
      expect(entity).to have_attributes(
        web_pages: ['http://www.pub.ro/'],
        alpha_two_code: 'RO',
        state_province: nil,
        country: 'Romania',
        domains: ['pub.ro'],
        name: 'University Politehnica of Bucharest'
      )
    end
  end
end