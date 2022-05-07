require 'rails_helper'

RSpec.describe Warehouse, type: :model do
  describe '#valid?' do
    context 'presence' do
      it 'falso quando nome está vazio' do
        warehouse = Warehouse.new(name: '', code: 'GRU', city: 'Guarulhos', area: 100_000,
                                  address: 'Avenida do Aeroporto, 1000', cep: '15000-000',
                                  description: 'Galpão destinado para cargas internacionais')

        expect(warehouse.valid?).to eq false
      end

      it 'falso quando código está vazio' do
        warehouse = Warehouse.new(name: 'Aeroporto SP', code: '', city: 'Guarulhos', area: 100_000,
                                  address: 'Avenida do Aeroporto, 1000', cep: '15000-000',
                                  description: 'Galpão destinado para cargas internacionais')

        expect(warehouse.valid?).to eq false
      end

      it 'falso quando cidade está vazio' do
        warehouse = Warehouse.new(name: 'Aeroporto SP', code: 'GRU', city: '', area: 100_000,
                                  address: 'Avenida do Aeroporto, 1000', cep: '15000-000',
                                  description: 'Galpão destinado para cargas internacionais')

        expect(warehouse.valid?).to eq false
      end

      it 'falso quando área está vazio' do
        warehouse = Warehouse.new(name: 'Aeroporto SP', code: 'GRU', city: 'Guarulhos', area: '',
                                  address: 'Avenida do Aeroporto, 1000', cep: '15000-000',
                                  description: 'Galpão destinado para cargas internacionais')

        expect(warehouse.valid?).to eq false
      end

      it 'falso quando endereço está vazio' do
        warehouse = Warehouse.new(name: 'Aeroporto SP', code: 'GRU', city: 'Guarulhos', area: 100_000,
                                  address: '', cep: '15000-000',
                                  description: 'Galpão destinado para cargas internacionais')

        expect(warehouse.valid?).to eq false
      end

      it 'falso quando CEP está vazio' do
        warehouse = Warehouse.new(name: 'Aeroporto SP', code: 'GRU', city: 'Guarulhos', area: 100_000,
                                  address: 'Avenida do Aeroporto, 1000', cep: '',
                                  description: 'Galpão destinado para cargas internacionais')

        expect(warehouse.valid?).to eq false
      end

      it 'falso quando descrição está vazio' do
        warehouse = Warehouse.new(name: 'Aeroporto SP', code: 'GRU', city: 'Guarulhos', area: 100_000,
                                  address: 'Avenida do Aeroporto, 1000', cep: '15000-000',
                                  description: '')

        expect(warehouse.valid?).to eq false
      end
    end

    context 'uniqueness' do
      it 'falso quando nome já está em uso' do
        first_warehouse = Warehouse.create(name: 'Aeroporto', code: 'GRU', city: 'Guarulhos', area: 100_000,
                                           address: 'Avenida do Aeroporto, 1000', cep: '15000-000',
                                           description: 'Galpão destinado para cargas internacionais')

        second_warehouse = Warehouse.new(name: 'Aeroporto', code: 'SDU', city: 'Rio de Janeiro', area: 60_000,
                                         address: 'Avenida Atlantica, 50', cep: '20000-000',
                                         description: 'Galpão do Rio')

        expect(second_warehouse.valid?).to eq false
      end

      it 'falso quando código já está em uso' do
        first_warehouse = Warehouse.create(name: 'Aeroporto SP', code: 'AER', city: 'Guarulhos', area: 100_000,
                                           address: 'Avenida do Aeroporto, 1000', cep: '15000-000',
                                           description: 'Galpão destinado para cargas internacionais')

        second_warehouse = Warehouse.new(name: 'Aeroporto Rio', code: 'AER', city: 'Rio de Janeiro', area: 60_000,
                                         address: 'Avenida Atlantica, 50', cep: '20000-000',
                                         description: 'Galpão do Rio')

        expect(second_warehouse.valid?).to eq false
      end
    end

    context 'format' do
      it 'falso quando o formato do código é inválido' do
        first_warehouse = Warehouse.new(name: 'Aeroporto SP', code: 'Gru', city: 'Guarulhos', area: 100_000,
                                        address: 'Avenida do Aeroporto, 1000', cep: '15000-000',
                                        description: 'Galpão destinado para cargas internacionais')

        second_warehouse = Warehouse.new(name: 'Aeroporto SP', code: 'GR1', city: 'Guarulhos', area: 100_000,
                                         address: 'Avenida do Aeroporto, 1000', cep: '15000-000',
                                         description: 'Galpão destinado para cargas internacionais')

        expect(first_warehouse.valid?).to eq false
        expect(second_warehouse.valid?).to eq false
      end

      it 'falso quando o formato do CEP é inválido' do
        first_warehouse = Warehouse.new(name: 'Aeroporto SP', code: 'GRU', city: 'Guarulhos', area: 100_000,
                                        address: 'Avenida do Aeroporto, 1000', cep: '15a00-bc0',
                                        description: 'Galpão destinado para cargas internacionais')

        second_warehouse = Warehouse.new(name: 'Aeroporto SP', code: 'GRU', city: 'Guarulhos', area: 100_000,
                                         address: 'Avenida do Aeroporto, 1000', cep: '15000000',
                                         description: 'Galpão destinado para cargas internacionais')

        expect(first_warehouse.valid?).to eq false
        expect(second_warehouse.valid?).to eq false
      end
    end

    context 'length' do
      it 'falso quando o comprimento do código é inválido' do
        warehouse = Warehouse.new(name: 'Aeroporto SP', code: 'GUAR', city: 'Guarulhos', area: 100_000,
                                  address: 'Avenida do Aeroporto, 1000', cep: '15000-000',
                                  description: 'Galpão destinado para cargas internacionais')

        expect(warehouse.valid?).to eq false
      end

      it 'falso quando o comprimento do CEP é inválido' do
        warehouse = Warehouse.new(name: 'Aeroporto SP', code: 'GRU', city: 'Guarulhos', area: 100_000,
                                  address: 'Avenida do Aeroporto, 1000', cep: '15000-0001',
                                  description: 'Galpão destinado para cargas internacionais')

        expect(warehouse.valid?).to eq false
      end
    end
  end
end
