class AddColorData < ActiveRecord::Migration[5.2]
  def change
    colors = [
      { id: 1, name: 'ホワイト', background_color: "rgba(255, 255, 255, 0.2)" },
      { id: 2, name: 'ブラック', background_color: "rgba(0, 0, 0, 0.2)" },
      { id: 3, name: 'グレー', background_color: "rgba(128, 128, 128, 0.2)" },
      { id: 4, name: 'ブラウン', background_color: "rgba(139, 69, 19, 0.2)" },
      { id: 5, name: 'ベージュ', background_color: "rgba(255, 228, 196, 0.2)" },
      { id: 6, name: 'グリーン', background_color: "rgba(0, 128, 0, 0.2)" },
      { id: 7, name: 'ブルー', background_color: "rgba(0, 0, 255, 0.2)" },
      { id: 8, name: 'パープル', background_color: "rgba(128, 0, 128, 0.2)" },
      { id: 9, name: 'イエロー', background_color: "rgba(255, 255, 0, 0.2)" },
      { id: 10, name: 'ピンク', background_color: "rgba(255, 0, 255, 0.2)" },
      { id: 11, name: 'レッド', background_color: "rgba(255, 0, 0, 0.2)" },
      { id: 23, name: 'シルバー', background_color: "rgba(192, 192, 192, 0.2)" },
      { id: 24, name: 'ゴールド', background_color: "rgba(246, 225, 147, 0.2)" }
    ]
    colors.each do |color|
      Color.create(color)
    end
  end
end
