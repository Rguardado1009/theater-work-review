class Role < ActiveRecord::Base
  has_many :auditions

  def actors
    self.auditions.map do |audition|
        audition.actor
    end
  end

  def locations
    self.auditions.map do |audition|
        audition.location
    end
  end

  def hired
    self.auditions.select { |aud| aud.hired }
  end

  def lead
    result = self.hired.first

    if result
        result
    else
        'no actor has been hired for this role'
    end
  end

  def understudy
    result = self.hired.second

    if result
        result
    else
        'no actor has been hired for understudy for this role'
    end
  end

end