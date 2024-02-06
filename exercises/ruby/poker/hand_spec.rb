require_relative 'hand'
require_relative 'card'

RSpec.describe Hand do
  describe '.new' do
    it 'allows creation of new hand' do
      hand = create_hand(%w(AH QH JH 2S 5C))

      expect(hand).to be_kind_of(Hand)
    end

    it 'disallows creation of not full hand' do
      expect do
        create_hand(%w(QC QH QS QD))
      end.to raise_error PokerError::InvalidNumberOfCardsError
    end
  end

  describe '<=>' do
    context 'royal flush compared to straight flush' do
      it 'royal flush is greater' do
        royal_flush = create_hand(%w(AH KH QH JH TH))
        straight_flush = create_hand(%w(TH 8H 7H 6H 9H))

        expect(royal_flush > straight_flush).to eq true
        expect(straight_flush < royal_flush).to eq true
      end
    end

    context 'straight flush compared to four of a kind' do
      it 'straight flush is greater' do
        straight_flush = create_hand(%w(TH 8H 7H 6H 9H))
        four_of_a_kind = create_hand(%w(QC QH QS QD 5C))

        expect(straight_flush > four_of_a_kind).to eq true
        expect(four_of_a_kind < straight_flush).to eq true
      end
    end

    context 'four of a kind compared to full house ' do
      it 'four of a kind is greater' do
        four_of_a_kind = create_hand(%w(QC QH QS QD 5C))
        full_house = create_hand(%w(AH AS AD KS KH))

        expect(four_of_a_kind > full_house).to eq true
        expect(full_house < four_of_a_kind).to eq true
      end
    end

    context 'full house compared to flush' do
      it 'full house of a kind is greater' do
        full_house = create_hand(%w(AH AS AD KS KH))
        flush = create_hand(%w(JH 2H 5H AH 3H))

        expect(full_house > flush).to eq true
        expect(flush < full_house).to eq true
      end
    end

    context 'flush compared to straight' do
      it 'flush is greater' do
        flush = create_hand(%w(JH 2H 5H AH 3H))
        straight = create_hand(%w(QC JH 9D 8C TS))

        expect(flush > straight).to eq true
        expect(straight < flush).to eq true
      end
    end

    context 'straight compared to three of kind' do
      it 'straight is greater' do
        straight = create_hand(%w(QC JH TS 8C 9D))
        three_of_kind = create_hand(%w(AH AS AD 2S KH))

        expect(straight > three_of_kind).to eq true
        expect(three_of_kind < straight).to eq true
      end
    end

    context 'three of kind compared to two pairs' do
      it 'three of kind is greater' do
        three_of_kind = create_hand(%w(QC QH QS 2D 5C))
        two_pairs = create_hand(%w(QC QH AS AD 5C))

        expect(three_of_kind > two_pairs).to eq true
        expect(two_pairs < three_of_kind).to eq true
      end
    end

    context 'two pairs compared to one pair' do
      it 'two pairs is greater' do
        two_pairs = create_hand(%w(QC QH AS AD 5C))
        one_pair = create_hand(%w(AH AS QD 6S 3H))

        expect(two_pairs > one_pair).to eq true
        expect(one_pair < two_pairs).to eq true
      end
    end

    context 'highest card compared to one pair' do
      it 'two pairs is greater' do
        one_pair = create_hand(%w(6D 7H AH 7S QC))
        highest_card = create_hand(%w(6H 2D TD JD AS))

        expect(one_pair > highest_card).to eq true
        expect(highest_card < one_pair).to eq true
      end
    end
  end

  def create_hand(card_codes)
    Hand.new(get_cards(card_codes))
  end

  def get_cards(card_codes)
    card_codes.map do |card_code|
      Card.new(card_code)
    end
  end
end
