class Captain < ActiveRecord::Base
  has_many :boats

  def self.catamaran_operators
    a = includes(boats: :classifications).where('classifications.name = ?', 'Catamaran')
    binding.pry
  end
end
