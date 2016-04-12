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
  
  describe 'collection matchers' do
  
    it 'will match arrays' do
      array = [1,2,3]

      expect(array).to include(3)
      expect(array).to include(2,3)

      # in an array, the order matters
      expect(array).to start_with(1)
      expect(array).to end_with(3)

      # match elements, ignore the order
      expect(array).to match_array([3,2,1])
      expect(array).not_to match_array([1,2])
      # equals to
      expect(array).to contain_exactly(3,2,1)
      expect(array).not_to contain_exactly(2,1)
    end
    
    it 'will match strings' do
      string = 'Lynda'

      expect(string).to include('Ly')
      expect(string).to include('Ly', 'da')

      expect(string).to start_with('Ly')
      expect(string).to end_with('da')
    end
    
    it 'will match hashes' do
      hash = {:city => 'Dallas', :state => 'TX'}

      expect(hash).to include(:city)
      expect(hash).to include(:city => 'Dallas')
      
      expect(hash).to include(:city, :state)
      expect(hash).to include(:state => 'TX', :city => 'Dallas')
      expect(hash).to include({:state => 'TX', :city => 'Dallas'})
      
      expect(hash).not_to include({:state => 'CA', :city => 'Los Angel'})
    end
  
  end
  
  describe 'other useful matchers' do
  
    it 'will match strings with a regex' do
      string = 'The order has been received.'
      expect(string).to match(/order(.+)received/)
      
      expect('123').to match(/\d{3}/)
      expect(123).not_to match(/\d{3}/)
      
      email = 'someone@somewhere.com'
      expect(email).to match(/\A\w+@\w+\.\w{3}\Z/)
    end
    
    it 'will match object types' do
      expect('test').to be_instance_of(String)
      expect('test').to be_an_instance_of(String)
      
      expect('test').to be_kind_of(String)
      expect('test').to be_a_kind_of(String)
      expect('test').to be_a(String)
      expect([1,2,3]).to be_an(Array)
    end
    
    it 'will match objects with #respond_to' do
      string = 'test'
      expect(string).to respond_to(:length)
      expect(string).not_to respond_to(:sort)
    end
    
    it 'wil match class instances with #have_attributes' do
      class Car
        attr_accessor :make, :year, :color
      end
      car = Car.new
      car.make = 'Dodge'
      car.year = 2010
      car.color = 'green'
      
      expect(car).to have_attributes(:color => 'green')
      expect(car).to have_attributes(:make => 'Dodge', :year => 2010, :color => 'green')
    end
    
    it 'will match anything with #satisfy' do
      expect(10).to satisfy do |value|
        (value >= 5) && (value <= 10) && (value % 2 == 0)
      end
    end
  
  end
  
  describe 'predicate matchers' do
    
    it 'will match be_* to custom methods ending in ?' do
      expect([]).to be_empty
      expect(1).to be_integer
      expect(0).to be_zero
      expect(1).to be_nonzero
      expect(1).to be_odd
      expect(2).to be_even
      
      class Product
        def visible?; true; end
      end
      product = Product.new
      
      expect(product).to be_visible
      expect(product.visible?).to be true
    end
    
    it 'will match have_* to custom methods like has_*?' do
      hash = {:a => 1, :b => 2}
      expect(hash).to have_key(:a)
      expect(hash).to have_value(2)
      
      class Customer
        def has_pending_order?; true; end
      end
      customer = Customer.new
      
      expect(customer).to have_pending_order
      expect(customer.has_pending_order?).to be true
    end
    
  end
  
end