describe 'Expectation Matchers' do
  
  describe 'equivalence matchers' do
    
    it 'will match loose equality with #eq' do
      a = "2 cats"
      b = "2 cats"
      expect(a).to eq(b)
      expect(a).to be == b
      
      c = 17
      d = 17.0
      expect(c).to eq(d)
    end
    
    it 'will match value equality with #eql' do
      a = "2 cats"
      b = "2 cats"
      expect(a).to eql(b)
      expect(a).to be == b
      
      c = 17
      d = 17.0
      expect(c).not_to eql(d)
    end
    
    it 'will match identify equality with #equal' do
      a = "2 cats"
      b = "2 cats"
      expect(a).not_to equal(b)
      
      c = b
      expect(b).to equal(c)
      expect(b).to be(c)
    end
    
  end
  
  describe 'truthiness matchers' do
    
    it 'will match true/false' do
      expect(1 < 2).to be true
      expect(1 > 2).to be false
      
      expect('foo').not_to be true
      expect(nil).not_to be false
      expect(0).not_to be false
    end
    
    it 'will match truthy/falsey' do
      expect(1 < 2).to be_truthy
      expect(1 > 2).to be_falsey
      
      expect('foo').to be_truthy
      expect(nil).to be_falsey
      expect(0).not_to be_falsey
    end
    
    it 'will match nil' do
      expect(nil).to be_nil
      expect(nil).to be(nil)
      
      expect(false).not_to be_nil
      expect(0).not_to be_nil
    end
    
  end
  
  describe 'numeric comparison matcher' do
    
    it 'will match less than/greater than' do
      expect(10).to be > 9
      expect(10).to be >= 10
      expect(10).to be <= 10
      expect(9).to be < 10
    end
    
    it 'will match numeric ranges' do
      expect(10).to be_between(5, 10).inclusive
      expect(10).not_to be_between(5, 10).exclusive
      expect(12).to be_within(1).of(11)
      expect(5..10).to cover(9)
    end
    
  end
  
end