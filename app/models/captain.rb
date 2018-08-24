class Captain < ActiveRecord::Base
  has_many :boats

  def self.catamaran_operators
    includes(boats: :classifications).where('classifications.name = ?', 'Catamaran')
  end

  def self.sailors
    includes(boats: :classifications).where('classifications.name = ?', 'Sailboat').uniq
  end

  def self.motorboat_operators
    includes(boats: :classifications).where('classifications.name = ?', 'Motorboat').uniq
  end

  def self.talented_seafarers
    m = motorboat_operators.map{|m| m.name}
    s = sailors
    m & s
  end
end
