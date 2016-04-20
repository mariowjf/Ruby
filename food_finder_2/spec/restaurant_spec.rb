require 'restaurant'

describe Restaurant do

  let(:test_file) { 'spec/fixtures/restaurants_test.txt' }
  let(:crescent) { Restaurant.new(:name => 'Crescent', :cuisine => 'paleo', :price => 321) }
  
  describe 'attributes' do
  
    it 'allow reading and writing for :name' do
      subject.name = 'KFC'
      expect(subject.name).to eq('KFC')
    end
    
    it 'allow reading and writing for :cuisine' do
      subject.cuisine = 'fast food'
      expect(subject.cuisine).to eq('fast food')
    end
    
    it 'allow reading and writing for :price' do
      subject.price = 30
      expect(subject.price).to eq(30)
    end
    
  end
  
  describe '.load_file' do
  
    
  
  end
  
  describe '.all' do
  
    it 'returns array of restaurant objects from @@file' do
      # pending
      Restaurant.load_file(test_file)
      restaurants = Restaurant.all
      expect(restaurants.class).to eq(Array)
      expect(restaurants.length).to eq(6)
      expect(restaurants.first.class).to eq(Restaurant)
    end
    
    it 'returns an empty array when @@file is nil' do
      # pending
      # no_output { Restaurant.load_file(nil) }
      Restaurant.load_file(nil)
      restaurants = Restaurant.all
      expect(restaurants).to eq([])
    end
  
  end

  describe '#initialize' do
  
    context 'with no options' do
      
      let(:no_options) { Restaurant.new }
      
      it 'sets a default of "" for :name' do
        expect(no_options.name).to eq("") 
      end
      
      it 'sets a default of "unknown" for :cuisine' do
        expect(subject.cuisine).to eq('unknown') 
      end
      
      it 'does not set a default for :price' do
        expect(no_options.price).to be_nil
      end
      
    end
    
    context 'with custom options' do
    
      it 'allows setting the :name' do
        expect(crescent.name).to eq('Crescent')
      end
      
      it 'allows setting the :cuisine' do
        expect(crescent.cuisine).to eq('paleo')
      end
      
      it 'allows setting the :price' do
        expect(crescent.price).to eq(321)
      end
    
    end
  
  end
  
  describe '#save' do
  
    it 'returns false if @@file is nil' do
      expect(Restaurant.file).to be_nil
      expect(crescent.save).to be false
    end
    
    it 'returns false if not valid' do
      Restaurant.load_file(test_file)
      expect(Restaurant.file).not_to be_nil
      expect(subject.save).to be false      
    end
    
    it 'calls append on @@file if valid' do
      Restaurant.load_file(test_file)
      expect(Restaurant.file).not_to be_nil
      expect(Restaurant.file).to receive(:append).with(crescent)
      crescent.save
    end
  
  end
  
  describe '#valid?' do
  
    it 'returns false if name is nil' do
      crescent.name = nil
      expect(crescent.valid?).to be false
    end
    
    it 'returns false if name is blank' do
      crescent.name = ' '
      expect(crescent.valid?).to be false
    end
    
    it 'returns false if cuisine is nil' do
      crescent.cuisine = nil
      expect(crescent.valid?).to be false
    end
    
    it 'returns false if cuisine is blank' do
      crescent.cuisine = ' '
      expect(crescent.valid?).to be false
    end
    
    it 'returns false if price is nil' do
      crescent.price = nil
      expect(crescent.valid?).to be false
    end
    
    it 'returns false if price is 0' do
      crescent.price = 0
      expect(crescent.valid?).to be false
    end
    
    it 'returns false if price is negative' do
      crescent.price = -1
      expect(crescent.valid?).to be false
    end
    
    it 'returns true if name, cuisine, price are present' do
      expect(crescent.valid?).to be true
    end
  
  end
  
end