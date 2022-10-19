describe 'Film' do
  let(:film) {
    Film.new('Название', 'Режиссер', 1942)
  }

  describe '#new' do
    it 'should create an instance of Film' do
      expect(film).to be_instance_of Film
    end
  end

  describe '#to_s' do
    it 'should print out in correct format' do
      expect(film.to_s).to eq 'Режиссер — «Название» (1942)'
    end
  end
end
