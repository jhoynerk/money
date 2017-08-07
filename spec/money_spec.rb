require 'spec_helper'

RSpec.describe Money do

  context 'When the money class is initialized.' do
    it 'Should return the amount' do
      expect(Money.new(50, 'EUR').amount).to eq( 50 )
      expect(Money.new(40, 'USD').amount).to eq( 40 )
    end

    it 'Should return the currency' do
      expect(Money.new(50, 'EUR').currency).to eq( 'EUR' )
      expect(Money.new(40, 'USD').currency).to eq( 'USD' )
    end

    it 'Should return the inspect' do
      expect(Money.new(50, 'EUR').inspect).to eq( '50.00 EUR' )
      expect(Money.new(40, 'USD').inspect).to eq( '40.00 USD' )
      expect(Money.new(55.50, 'USD').inspect).to eq( '55.50 USD' )
      expect(Money.new(102.03, 'USD').inspect).to eq( '102.03 USD' )
    end

    it 'Should return the convert of EUR to USD' do
      fifty_eur = Money.new(50, 'EUR')
      expect(fifty_eur.convert_to('USD').inspect).to eq( '55.50 USD' )
    end

    it 'Should return the convert of EUR to Bitcoin' do
      fifty_eur = Money.new(50, 'EUR')
      expect(fifty_eur.convert_to('Bitcoin').inspect).to eq( '0.24 Bitcoin' )
    end

    it 'Should return the convert of USD to EUR' do
      fifty_five_eur = Money.new(55.50, 'USD')
      expect(fifty_five_eur.convert_to('EUR').inspect).to eq( '50.00 EUR' )
    end
  end

  context 'When we use arithmetic operations' do
    it 'Should return the sum of two equal instances.' do
      forty_eur = Money.new(40, 'EUR')
      fifty_eur = Money.new(50, 'EUR')
      expect(forty_eur + fifty_eur).to eq( forty_eur )
      expect(forty_eur.inspect).to eq( '90.00 EUR' )
    end

    it 'Should return the subtraction of two equal instances.' do
      sixty_eur = Money.new(60, 'EUR')
      thirty_eur = Money.new(30, 'EUR')
      expect(sixty_eur - thirty_eur).to eq( sixty_eur )
      expect(sixty_eur.inspect).to eq( '30.00 EUR' )
    end

    it 'Should return true of two equal instances.' do
      thirty_eur_1 = Money.new(30, 'EUR')
      thirty_eur_2 = Money.new(30, 'EUR')
      expect(thirty_eur_1 == thirty_eur_2).to eq( true )
    end

    it 'Should return true of the greater instances.' do
      sixty_eur = Money.new(60, 'EUR')
      thirty_eur = Money.new(30, 'EUR')
      expect(sixty_eur > thirty_eur).to eq( true )
      expect(sixty_eur < thirty_eur).to eq( false )
    end

    it 'Should return true of two equal instances with different currency.' do
      sixty_eur = Money.new(60, 'EUR')
      sixty_eur_to_usd = sixty_eur.convert_to('USD')
      expect(sixty_eur == sixty_eur_to_usd).to eq( true )
    end

    it 'Should return amount multiplies' do
      sixty_eur = Money.new(60, 'EUR')
      expect((sixty_eur * 2).inspect).to eq( "120.00 EUR" )
    end

    it 'Should return amount division' do
      sixty_eur = Money.new(60, 'EUR')
      expect((sixty_eur / 2).inspect).to eq( "30.00 EUR" )
    end
  end
end
