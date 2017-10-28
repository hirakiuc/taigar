require 'spec_helper'

RSpec.describe Taigar::Model::Page do
  describe 'new' do
    it 'should return an instance' do
      items = []
      env = {
        response_headers: {
          'x-paginated' => 'true',
          'x-paginated-by' => '1',
          'x-pagination-count' => '10',
          'x-pagination-current' => '2',
          'x-pagination-next' => 'https://host?page=3',
          'x-pagination-prev' => 'https://host?page=1'
        }
      }

      m = Taigar::Model::Page.new(items, env)
      expect(m).to be_an_instance_of(Taigar::Model::Page)

      expect(m.items).to eq(items)
      expect(m.attrs).to eq({
        paginated: true,
        per_page: 1,
        count: 10,
        current_page: 2,
        next_params: {page: '3'},
        prev_params: {page: '1'}
      })
    end
  end
end
