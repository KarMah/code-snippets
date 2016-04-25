class MyMethodChain

  def initialize(&block)
    @message = {}
    instance_eval(&block)
  end

  def we(*persons)
    self.tap { @persons = persons }
  end

  def going(place)
    self.tap { @place = place }
  end

  def at(time)
    self.tap { @time = time }
  end

  def when(date)
    self.tap { @date = date }
  end

  def output
    [persons_interpreted, 'are going', @place, @date, 'at', @time].join(' ')
  end

  def persons_interpreted
    last_person = @persons.last
    str = @persons[0..-2].join(', ')
    str << ' and ' unless str.empty?
    str << last_person
  end
end
