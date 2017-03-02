require_relative 'car'

RSpec.describe Car do
  describe '.new' do
    it 'creates car instance' do
      expect(Car.new(:fiat)).to be_kind_of Car
    end

    it 'creates car instance of given supported color' do
      car = Car.new(:fiat, color: :red)

      expect(car.color_name).to eq 'Red'
    end

    context 'when color is not provided' do
      context 'and three colors are available' do
        it 'toggles available colors for each created instance' do
          # Ensure previous specs do not affect which color is picked first
          Object.send(:remove_const, 'Car')
          load 'car_factory/car.rb'
          stub_const('Car::AVAILABLE_COLORS', %i(black red yellow))

          expect(Car.new(:fiat).color_name).to eq 'Black'
          expect(Car.new(:fiat).color_name).to eq 'Red'
          expect(Car.new(:fiat).color_name).to eq 'Yellow'
          expect(Car.new(:fiat).color_name).to eq 'Black'
        end
      end
    end
  end

  describe '#brand' do
    it 'returns name of brand' do
      car = Car.new(:subaru)

      expect(car.brand).to eq 'Subaru'
    end
  end

  describe '#color_name' do
    it 'returns name of color of car' do
      car = Car.new(:subaru, color: :navy_blue)

      expect(car.color_name).to eq 'Navy Blue'
    end
  end
end
