describe 'Doubles' do
  
  it "allow stubbing methods" do
    dbl = double("Chant")
    allow(dbl).to receive(:hey!)
    expect(dbl).to respond_to(:hey!)
  end
  
  it "allow stubbing a response with a block" do
    dbl = double("Chant")
    allow(dbl).to receive(:hey!) { "Ho!" }
    expect(dbl.hey!).to eq("Ho!")
  end
  
  it "allow stubbing responses with #and_return" do
    dbl = double("Chant")
    allow(dbl).to receive(:hey!).and_return("Ho!")
    expect(dbl.hey!).to eq("Ho!")
  end
  
  it "allow stubbing multiple methods with hash syntax" do
    dbl = double("Person")
    allow(dbl).to receive_messages(:full_name => 'Mary Smith', :initials => 'MTS')
    expect(dbl.full_name).to eq("Mary Smith")
    expect(dbl.initials).to eq("MTS")
  end
  
  it "allow stubbing with a hash argument to #double" do
    dbl = double("Person", :full_name => 'Mary Smith', :initials => 'MTS')
    expect(dbl.full_name).to eq("Mary Smith")
    expect(dbl.initials).to eq("MTS")
  end
  
  it "allow stubbing mutiple responses with #and_return" do
    die = double("Die")
    allow(die).to receive(:roll).and_return(1,5,2,6)
    expect(die.roll).to eq(1)
    expect(die.roll).to eq(5)
    expect(die.roll).to eq(2)
    expect(die.roll).to eq(6)
    expect(die.roll).to eq(6)
    expect(die.roll).to eq(6)
  end
  
end