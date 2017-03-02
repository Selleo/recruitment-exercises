require_relative 'poker_table'
require_relative 'hand'
require_relative 'card'
require_relative 'combination'

RSpec.describe PokerTable do
  describe '.new' do
    it 'creates poker_table instance' do
      table = PokerTable.new('6D 7H AH 7S QC 6H 2D TD JD AS')

      expect(table).to be_kind_of PokerTable
    end

    it 'does not allow creating hands with duplicate cards' do
      line = 'AS 7H AH 7S QC 6H 2D TD JD AS'
      expect do
        PokerTable.new(line)
      end.to raise_error PokerError::DuplicatedCardError
    end
  end

  describe '#strongest_hand' do
    context 'when left hand is stronger than right hand' do
      it 'returns "left"' do
        line = '6D 7H AH 7S QC 6H 2D TD JD AS'
        table = PokerTable.new(line)

        expect(table.strongest_hand).to eq 'left'
      end
    end

    context 'when both hands are equal' do
      it 'returns "tie"' do
        line = 'JH 5D 7H TC JS JD JC TS 5S 7S'
        table = PokerTable.new(line)

        expect(table.strongest_hand).to eq 'tie'
      end
    end

    context 'when right hand is stronger than left hand' do
      it 'returns "right"' do
        line = '2H 8C AD TH 6H QD KD 9H 6S 6C'
        table = PokerTable.new(line)

        expect(table.strongest_hand).to eq 'right'
      end
    end

    context 'when left hand is stronger than right hand' do
      it 'returns "left"' do
        line = 'AD KH JC 5D 6D AC KC JD 6C 2D'
        table = PokerTable.new(line)

        expect(table.strongest_hand).to eq 'left'
      end
    end

    context 'when left hand is stronger than right hand' do
      it 'returns "left"' do
        line = 'AD AH AC AS 7D KD KC KS KH 7C'
        table = PokerTable.new(line)

        expect(table.strongest_hand).to eq 'left'
      end
    end
  end
end
