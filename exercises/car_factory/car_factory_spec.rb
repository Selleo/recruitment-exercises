require_relative 'car_factory'

RSpec.describe CarFactory do
  describe '.new' do
    it 'Creates new factory with given name and brand' do
      factory = CarFactory.new('Fiat Bielsko', brands: :fiat)

      expect(factory).to be_a_kind_of CarFactory
    end

    it 'does allow creation of factory for supported brands only (Fiat, Lancia, Ford, Subaru)' do
      expect do
        CarFactory.new('Fiat Bielsko', brands: :daewoo)
      end.to raise_error CarFactory::UnsupportedBrandException, "Brand not supported: 'Daewoo'"
    end
  end

  describe '#make_car' do
    context 'factory is created for one brand only' do
      it 'creates an instance of car for factory default brand' do
        factory = CarFactory.new('Fiat Bielsko', brands: :fiat)
        car = factory.make_car

        expect(car.brand).to eq 'Fiat'
      end

      it 'creates an instance of car for factory default brand when this brand is given as a parameter' do
        factory = CarFactory.new('Fiat Bielsko', brands: :fiat)
        car = factory.make_car(:fiat)

        expect(car.brand).to eq 'Fiat'
      end
    end

    context 'factory is created for multiple brands' do
      it 'does not allow creating car with default brand' do
        factory = CarFactory.new('Fiat Bielsko', brands: [:fiat, :lancia])

        expect do
          factory.make_car
        end.to raise_error CarFactory::UnsupportedBrandException, 'Factory does not have a brand or do not support it'
      end

      it "creates an instance of car for factory's given brand" do
        factory = CarFactory.new('Fiat Bielsko', brands: [:fiat, :lancia])
        car = factory.make_car(:fiat)

        expect(car.brand).to eq 'Fiat'
      end

      it 'does allow creation of an instance of car for factory given brand only' do
        factory = CarFactory.new('Fiat Bielsko', brands: [:fiat, :lancia])

        expect do
          factory.make_car(:subaru)
        end.to raise_error CarFactory::UnsupportedBrandException, 'Factory does not have a brand or do not support it'
      end
    end
  end

  describe '#name' do
    context 'factory is created for one brand only' do
      it 'returns factory name with supported brand' do
        factory = CarFactory.new('Fiat Bielsko', brands: :fiat)

        expect(factory.name).to eq 'Fiat Bielsko (produces Fiat)'
      end
    end

    context 'factory is created for mutliple brands' do
      it 'returns factory name with supported brands' do
        factory = CarFactory.new('Fiat Bielsko', brands: [:fiat, :subaru])

        expect(factory.name).to eq 'Fiat Bielsko (produces Fiat, Subaru)'
      end
    end
  end

  describe '#make_cars' do
    context 'when provided with number' do
      it 'returns a given number of car objects' do
        factory = CarFactory.new('Fiat Bielsko', brands: :fiat)

        cars = factory.make_cars(2)

        expect(cars.count).to eq 2
        expect(cars).to match_array [kind_of(Car), kind_of(Car)]
      end

      it 'loops through all available brands' do
        stub_const('CarFactory::SUPPORTED_BRANDS', %i(lancia subaru))
        factory = CarFactory.new('Fiat Bielsko', brands: [:lancia, :subaru])

        cars = factory.make_cars(3)

        expect(cars).to match_array [
          have_attributes(brand: 'Lancia'),
          have_attributes(brand: 'Subaru'),
          have_attributes(brand: 'Lancia')
        ]
      end
    end

    context 'when provided with configuration hash' do
      it 'allows creating a given amount of car for specified brands' do
        factory = CarFactory.new('fiat bielsko', brands: [:fiat, :subaru])

        cars = factory.make_cars(fiat: 1, subaru: 2)

        expect(cars).to match_array [
          have_attributes(brand: 'Fiat'),
          have_attributes(brand: 'Subaru'),
          have_attributes(brand: 'Subaru')
        ]
      end

      it 'disregards non existing brands' do
        factory = CarFactory.new('fiat bielsko', brands: [:fiat, :subaru])
        cars = []

        expect do
          cars = factory.make_cars(fiat: 1, subaru: 2, syrena: 2)
        end.to_not raise_error

        expect(cars).to match_array [
          have_attributes(brand: 'Fiat'),
          have_attributes(brand: 'Subaru'),
          have_attributes(brand: 'Subaru')
        ]
      end
    end
  end
end
