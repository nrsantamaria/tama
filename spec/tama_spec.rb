require "tama"
require "rspec"
require "pry"

describe(Tama) do
  describe("#initialize") do
    it("sets the name and life levels of a new Tama") do
      my_pet = Tama.new("lil dragon")
      expect(my_pet.name()).to(eq("lil dragon"))
      expect(my_pet.food_level()).to(eq(10))
      expect(my_pet.sleep_level()).to(eq(10))
      expect(my_pet.happy_level()).to(eq(10))
    end
  end

  describe("#is_alive?") do
    it("is alive if the food level is above 0") do
      my_pet = Tama.new("lil dragon")
      expect(my_pet.is_alive?()).to(eq(true))
    end

    it("is dead if the food level is 0") do
      my_pet = Tama.new("lil dragon")
      10.times do
        my_pet.play()
      end
      expect(my_pet.is_alive?()).to(eq(false))
    end
  end

  describe("#play") do
    it("decreases the amount of food the Tama has left by 1") do
      my_pet = Tama.new("lil dragon")
      my_pet.play()  #decide what trigger you will use to make time pass
      expect(my_pet.food_level()).to(eq(9))
    end
  end

  describe("#ran_away?") do
    it("ran away if happiness is 0") do
      my_pet = Tama.new("lil dragon")
      10.times do
        my_pet.feed()
      end
      expect(my_pet.ran_away?).to(eq(true))
    end
  end
end
