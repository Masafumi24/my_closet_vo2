class AddSeasonData < ActiveRecord::Migration[5.2]
  def change
    seasons = [
      { id: 1, name: '春', background_color: "rgba(193, 66, 66, 0.2)" },
      { id: 2, name: '夏', background_color: "rgba(63, 191, 63, 0.2)" },
      { id: 3, name: '秋', background_color: "rgba(191, 127, 63, 0.2)" },
      { id: 4, name: '冬', background_color: "rgba(63, 191, 184, 0.2)" }
    ]
    seasons.each do |season|
      Season.create(season)
    end
  end
end
