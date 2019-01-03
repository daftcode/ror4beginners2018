# frozen_string_literal: true

class BestiaryController < ApplicationController
  def index
    @monsters = monsters
  end

  def novigrad_monsters
    @monsters = monsters.select do |monster| 
      monster[:location].eql? 'Novigrad'
    end
  end

  private

  def monsters
    @monsters ||= begin
      Faker::Config.random = Random.new(42)
      (0..20).map do |n|
        {
          id: n,
          name: Faker::Witcher.monster,
          location: Faker::Witcher.location,
          best_slayer: Faker::Witcher.character
        }
      end
    end
  end
end
