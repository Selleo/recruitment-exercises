require 'car_park'
require 'car'

RSpec.describe CarPark do
  describe '#capacity' do
    it 'returns car park capacity' do
      car_park = CarPark.new(100)

      expect(car_park.capacity).to eq 100
    end
  end

  describe '#cars' do
    it 'returns cars in car park' do
      car_park = CarPark.new(100)
      car = Car.new(:fiat)
      car_park.receive(car)

      expect(car_park.cars).to match_array [car]
    end
  end

  describe '#places_left' do
    it 'returns places left in car park' do
      car_park = CarPark.new(100)
      car1 = Car.new(:fiat)
      car2 = Car.new(:fiat)

      car_park.receive([car1, car2])

      expect(car_park.places_left).to eq 98
    end
  end

  describe '#receive' do
    it 'accepts multiple cars at once' do
      car_park = CarPark.new(100)
      car1 = Car.new(:fiat)
      car2 = Car.new(:fiat)
      car3 = Car.new(:fiat)

      car_park.receive([car1, car2])
      car_park.receive(car3)

      expect(car_park.cars).to match_array [car1, car2, car3]
    end

    it 'cannot accept more cars than capacity' do
      car_park = CarPark.new(2)
      car1 = Car.new(:fiat)
      car2 = Car.new(:lancia)
      car3 = Car.new(:mercedes)
      car4 = Car.new(:mercedes)

      car_park.receive([car1, car2, car3, car4])

      expect(car_park.cars).to match_array [car1, car2]
    end
  end

  describe '#retrieve' do
    it 'returns last n cars' do
      car_park = CarPark.new(3)
      car1 = Car.new(:fiat)
      car2 = Car.new(:lancia)
      car3 = Car.new(:mercedes)
      car_park.receive([car1, car2, car3])

      expect(car_park.retrieve(1)).to match_array [car3]

      expect(car_park.cars).to match_array [car1, car2]
    end
  end

  describe '#brands' do
    it 'returns all car brands' do
      car_park = CarPark.new(3)
      car1 = Car.new(:fiat)
      car2 = Car.new(:lancia)
      car3 = Car.new(:lancia)
      car_park.receive([car1, car2, car3])

      expect(car_park.brands).to match_array %w(Fiat Lancia)
    end
  end

  describe '#brands_stats' do
    it 'returns count of each car brand' do
      car_park = CarPark.new(3)
      car1 = Car.new(:fiat)
      car2 = Car.new(:lancia)
      car3 = Car.new(:lancia)
      car_park.receive([car1, car2, car3])

      expect(car_park.brands_stats).to match \
        a_hash_including('Fiat' => 1, 'Lancia' => 2)
    end
  end
end
