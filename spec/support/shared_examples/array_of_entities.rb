shared_examples 'array of entities' do
  it 'returns an array of entities' do
    expect(subject).to be_kind_of(Array)
    expect(subject.first).to be_kind_of(Universities::Entity)
  end
end