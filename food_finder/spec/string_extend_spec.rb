require_relative('../lib/support/string_extend.rb')

describe 'String' do
  
  describe '#titleize' do
    
    it 'capitalizes each word in a string' do
      expect('board game'.titleize).to eq('Board Game')
    end
    
    it 'works with single-word strings' do
      expect('game'.titleize).to eq('Game')
    end
    
    it 'capitalizes all uppercase strings' do
      expect('BOARD GAME'.titleize).to eq('Board Game')
    end
    
    it 'capitalizes mixed-case strings' do
      expect('bOarD gAmE'.titleize).to eq('Board Game')
    end
    
  end
  
  describe '#blank?' do
    
    it 'returns true if string is empty' do
      expect(''.blank?).to be_truthy
    end
    
    it 'returns true if string contains only spaces' do
      expect('   '.blank?).to be_truthy
    end
    
    it 'returns true if string contains only tabs' do
      expect("\t\t\t".blank?).to be(true)
    end
    
    it 'returns true if string contains only spaces and tabs' do
      expect("\t \t".blank?).to be(true)
    end
    
    it 'returns false if string contains a letter' do
      expect("a".blank?).to be_falsey
    end
    
    it 'returns false if string contains a number' do
      expect("123".blank?).to be_falsey
    end
    
  end
  
end