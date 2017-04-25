class Tama
  @@all_tamas = []

  def initialize(name)
    @name = "I'm " << name
    @food_level = 5
    @sleep_level = 5
    @happy_level = 5
    @status = "nice to meet you!"
    @reaction = "img/idle.gif"
    @@all_tamas.push(self)
  end

  def Tama.all
    @@all_tamas
  end

  def Tama.clear
    @@all_tamas = []
  end

  def name
    @name
  end
  def food_level
    @food_level
  end
  def sleep_level
    @sleep_level
  end
  def happy_level
    @happy_level
  end
  def status
    @status
  end
  def reaction
    @reaction
  end

  def is_alive?
    if(@food_level == 0 || @sleep_level == 0)
      @status = "R.I.P, I died"
      @reaction = "img/dead.gif"
    end
  end

  def ran_away?
    if @happy_level == 0
      @status = "you never play with me, I'm running away!"
      @reaction = "img/leave.gif"
    end
  end

  def play
    @food_level -= 1
    @sleep_level -= 1
    @happy_level += 1
    @reaction = "img/play.gif"
    upkeep()
  end

  def status_check
    @status = ""

    if @food_level <= 3
      @status << "feed me! "
    end
    if @sleep_level <= 3
      @status << "I'm tired! "
    end
    if @happy_level <= 3
      @status << "I need attention! "
    end
  end

  def feed
    if @status == "you never play with me, I'm running away!" || @status == "R.I.P, I died"
      # name = @name
      # Tama.clear
      # Tama.new(name)
    else
      @food_level += 1
      @happy_level -= 1
      @reaction = "img/food.gif"
      upkeep()
    end
  end

  def sleep
    if @status == "R.I.P, I died" || @status == "you never play with me, I'm running away!"
      # name = @name
      # Tama.clear
      # Tama.new(name)
    else
      @sleep_level += 1
      @happy_level -= 1
      @reaction = "img/sleep.gif"
      upkeep()
    end
  end

  def upkeep
    status_check()
    ran_away?()
    is_alive?()
  end

end
