RSpec.configure do |rspec|
  # This config option will be enabled by default on RSpec 4,
  # but for reasons of backwards compatibility, you have to
  # set it on RSpec 3.
  #
  # It causes the host group and examples to inherit metadata
  # from the shared context.
  rspec.shared_context_metadata_behavior = :apply_to_host_groups
end

RSpec.shared_context 'app configured', shared_context: :metadata do

  before do
    FactoryGirl.create :admin_user
    %w(Smartphones Laptops Desktops).each do |name|
      FactoryGirl.create :category, name: name
    end
    %w(Gazillion Smithsong).each do |name|
      FactoryGirl.create :brand, name: name
    end
    apricot = FactoryGirl.create :brand, name: 'Apricot'
    aphone = FactoryGirl.create :product, name: 'A-Phone 8', brand: apricot

    @deal = FactoryGirl.create :deal, description: 'Get $100 off of this product!', product: aphone
  end

  def app_name
    Rails.application.class.parent_name.titleize
  end

  # let(:shared_let) { {'arbitrary' => 'object'} }
  # subject do
  #   'this is the subject'
  # end
end

RSpec.configure do |rspec|
  rspec.include_context 'app configured', include_shared: true
end
