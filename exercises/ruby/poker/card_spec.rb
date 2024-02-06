require_relative 'card'

RSpec.describe Card do
  describe '.new' do
    it 'creates new card' do
      expect(Card.new('KS')).to be_kind_of Card
    end

    it 'disallows creation of invalid card' do
      expect do
        Card.new('X9')
      end.to raise_error PokerError::InvalidCardError
    end
  end

  describe '<=>' do
    context 'compares card ranks' do
      it 'ace is greater than king' do
        ace = Card.new('AC')
        king = Card.new('KC')

        expect(ace > king).to eq true
        expect(king < ace).to eq true
      end
    end

    it 'king is greater than queen' do
      king = Card.new('KC')
      queen = Card.new('QC')

      expect(king > queen).to eq true
      expect(queen < king).to eq true
    end

    it 'queen is greater than jack' do
      queen = Card.new('KC')
      jack = Card.new('JC')

      expect(queen > jack).to eq true
      expect(jack < queen).to eq true
    end

    it 'jack is greater than ten' do
      jack = Card.new('JC')
      ten = Card.new('TC')

      expect(jack > ten).to eq true
      expect(ten < jack).to eq true
    end

    it 'ten is greater than nine' do
      ten = Card.new('TC')
      nine = Card.new('9C')

      expect(ten > nine).to eq true
      expect(nine < ten).to eq true
    end

    it 'nine is greater than eight' do
      nine = Card.new('9C')
      eight = Card.new('8C')

      expect(nine > eight).to eq true
      expect(eight < nine).to eq true
    end

    it 'eight is greater than seven' do
      eight = Card.new('8C')
      seven = Card.new('7C')

      expect(eight > seven).to eq true
      expect(seven < eight).to eq true
    end

    it 'seven is greater than six' do
      seven = Card.new('7C')
      six = Card.new('6C')

      expect(seven > six).to eq true
      expect(six < seven).to eq true
    end

    it 'six is greater than five' do
      six = Card.new('6C')
      five = Card.new('5C')

      expect(six > five).to eq true
      expect(five < six).to eq true
    end

    it 'five is greater than four' do
      five = Card.new('5C')
      four = Card.new('4C')

      expect(five > four).to eq true
      expect(four < five).to eq true
    end

    it 'four is greater than three' do
      four = Card.new('4C')
      three = Card.new('3C')

      expect(four > three).to eq true
      expect(three < four).to eq true
    end

    it 'three is greater than two' do
      three = Card.new('3C')
      two = Card.new('2C')

      expect(three > two).to eq true
      expect(two < three).to eq true
    end
  end
end
