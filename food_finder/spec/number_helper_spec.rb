# encoding: UTF-8

require_relative('../lib/support/number_helper')
#require '../lib/support/number_helper'

describe 'NumberHelper' do
  
  include NumberHelper
  
  describe '#number_to_currency' do
    
    context 'using default values' do
      
      it 'correctly formats an integer' do
        expect(number_to_currency(12)).to eq('$12.00')
      end
      
      it 'correctly formats a float' do
        expect(number_to_currency(12.3)).to eq('$12.30')
        expect(number_to_currency(12.345)).to eq('$12.34')
        expect(number_to_currency(1234.5)).to eq('$1,234.50')
      end
      
      it 'correctly formats a string' do
        expect(number_to_currency('1234.567')).to eq('$1,234.56')
      end
      
      it 'uses delimiters for very large numbers' do
        expect(number_to_currency(1234)).to eq('$1,234.00')
        expect(number_to_currency(1234567)).to eq('$1,234,567.00')
      end
      
      it 'does not have delimiters for small numbers' do
        expect(number_to_currency(12)).to eq('$12.00')
      end
      
    end
    
    context 'using custom options' do
      
      it 'allows changing the :unit' do
        opt = { :unit => '⚛' }
        expect(number_to_currency(12, opt)).to eq('⚛12.00')
      end
      
      it 'allows changing the :precision' do
        opt = { :precision => 1 }
        expect(number_to_currency(12, opt)).to eq('$12.0')
        expect(number_to_currency(12.34, opt)).to eq('$12.3')
      end
      
      it 'omits the separator if :precision is 0' do
        opt = { :precision => 0 }
        expect(number_to_currency(12, opt)).to eq('$12')
        expect(number_to_currency(12.34, opt)).to eq('$12')
      end
      
      it 'allows changing the :delimiter' do
        opt = { :delimiter => ';' }
        expect(number_to_currency(1234, opt)).to eq('$1;234.00')
      end
      
      it 'allows changing the :separator' do
        opt = { :separator => ' ' }
        expect(number_to_currency(12.34, opt)).to eq('$12 34')
      end
      
      it 'correctly formats using multiple options' do
        opt = { :unit => '⚛', :precision => 3, :delimiter => ';', :separator => ' ' }
        expect(number_to_currency(1234.5678, opt)).to eq('⚛1;234 567')
      end
      
    end
    
  end
  
end