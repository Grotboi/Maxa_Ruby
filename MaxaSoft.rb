
require 'rspec'

# Модель игры с тремя дверями
class MontyHallGame
  attr_reader :doors

  def initialize
    @doors = ["коза", "коза", "машина"]
    @doors.shuffle!
  end

  # Выбор игрока
  def player_choice(door_number)
    @chosen_door = door_number - 1
  end

  # Решение Монти Холла
  def monty_reveals
    # Найти дверь с козой, отличную от выбранной
    available_doors = (0..2).to_a - [@chosen_door]
    @revealed_door = available_doors.find { |door| @doors[door] == "коза" }
  end

  # Переключение двери
  def switch_doors
    available_doors = (0..2).to_a - [@chosen_door, @revealed_door]
    @final_choice = available_doors[0]
  end

  # Результат игры
  def result
    @doors[@final_choice] == "машина" ? "Вы выиграли машину!" : "Вы выиграли козу..."
  end
end

# Тесты с использованием RSpec
RSpec.describe MontyHallGame do
  describe "Игра с тремя дверями" do
    let(:game) { MontyHallGame.new }

    context "Игрок выбирает первую дверь" do
      before { game.player_choice(1) }
      before { game.monty_reveals }

      it "Монти Холл открывает дверь с козой" do
        expect(game.doors[game.revealed_door]).to eq("коза")
      end

      it "Игрок переключается на другую дверь" do
        game.switch_doors
        expect(game.final_choice).to_not eq(game.chosen_door)
      end

      context "Игрок переключается на другую дверь" do
        before { game.switch_doors }

        it "Игрок выигрывает машину" do
          expect(game.result).to eq("Вы выиграли машину!")
        end
      end
    end

    context "Игрок выбирает вторую дверь" do
      before { game.player_choice(2) }
      before { game.monty_reveals }

      it "Монти Холл открывает дверь с козой" do
        expect(game.doors[game.revealed_door]).to eq("коза")
      end

      it "Игрок переключается на другую дверь" do
        game.switch_doors
        expect(game.final_choice).to_not eq(game.chosen_door)
      end

      context "Игрок переключается на другую дверь" do
        before { game.switch_doors }

        it "Игрок выигрывает машину" do
          expect(game.result).to eq("Вы выиграли машину!")
        end
      end
    end

    context "Игрок выбирает третью дверь" do
      before { game.player_choice(3) }
      before { game.monty_reveals }

      it "Монти Холл открывает дверь с козой" do
        expect(game.doors[game.revealed_door]).to eq("коза")
      end

      it "Игрок переключается на другую дверь" do
        game.switch_doors
        expect(game.final_choice).to_not eq(game.chosen_door)
      end

      context "Игрок переключается на другую дверь" do
        before { game.switch_doors }

        it "Игрок выигрывает машину" do
          expect(game.result).to eq("Вы выиграли машину!")
        end
      end
    end
  end
end